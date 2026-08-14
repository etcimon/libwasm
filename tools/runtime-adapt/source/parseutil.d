module parseutil;

import dparse.ast;
import dparse.lexer;
import dparse.parser : parseModule;
import dparse.rollback_allocator : RollbackAllocator;

import std.algorithm : canFind, map;
import std.array : join;
import std.string : strip;

/// Facts extracted with libdparse — the same parser serve-d/dscanner uses.
struct ParseFacts
{
    bool parsed;
    string error;
    string moduleName;
    string[] imports;
    string[] externCNames;
    string[] versions;
    bool mentionsLibwasmCrt;
    bool mentionsWebAssembly;
    bool mentionsWasi;
}

string normalizeSource(string raw)
{
    import std.array : replace;
    return raw.replace("\r\n", "\n").replace("\r", "\n");
}

ParseFacts parseDSource(string source, string fileName)
{
    ParseFacts f;
    auto src = normalizeSource(source);
    f.mentionsLibwasmCrt = src.canFind("CRuntime_LIBWASM");
    f.mentionsWebAssembly = src.canFind("WebAssembly");
    f.mentionsWasi = src.canFind("version(WASI)") || src.canFind("version (WASI)");

    LexerConfig config;
    config.fileName = fileName;
    config.stringBehavior = StringBehavior.source;
    auto cache = StringCache(StringCache.defaultBucketCount);
    auto tokens = getTokensForParser(cast(ubyte[]) src, config, &cache);

    foreach (t; tokens)
    {
        if (t.type == tok!"identifier" && t.text.length)
        {
            auto id = t.text;
            if (id == "CRuntime_LIBWASM" || id == "CRuntime_DRUNTIME_WASM"
                || id == "WebAssembly" || id == "WASI" || id == "CRuntime_WASI")
            {
                if (!f.versions.canFind(id))
                    f.versions ~= id;
            }
        }
    }

    string lastErr;
    void msg(string, size_t, size_t, string message, bool isError)
    {
        if (isError)
            lastErr = message;
    }

    RollbackAllocator rba;
    uint errors;
    auto mod = parseModule(tokens, fileName, &rba, &msg, &errors);
    if (errors || mod is null)
    {
        f.parsed = false;
        f.error = lastErr.length ? lastErr : "parse failed";
        return f;
    }
    f.parsed = true;
    auto v = new FactVisitor();
    v.visit(mod);
    f.moduleName = v.moduleName;
    f.imports = v.imports;
    f.externCNames = v.externC;
    return f;
}

private string idChainToString(const IdentifierChain chain)
{
    if (chain is null)
        return "";
    string[] parts;
    foreach (t; chain.identifiers)
        if (t.text.length)
            parts ~= t.text;
    return parts.join(".");
}

private bool isExternC(const Attribute attr)
{
    if (attr is null)
        return false;
    if (attr.linkageAttribute !is null && attr.linkageAttribute.identifier.text == "C")
        return true;
    return false;
}

private final class FactVisitor : ASTVisitor
{
    alias visit = ASTVisitor.visit;
    string moduleName;
    string[] imports;
    string[] externC;

    override void visit(const ModuleDeclaration m)
    {
        if (m !is null)
            moduleName = idChainToString(m.moduleName);
        m.accept(this);
    }

    override void visit(const ImportDeclaration imp)
    {
        foreach (si; imp.singleImports)
        {
            auto n = idChainToString(si.identifierChain);
            if (n.length && !imports.canFind(n))
                imports ~= n;
        }
        imp.accept(this);
    }

    override void visit(const FunctionDeclaration fn)
    {
        bool cLinkage;
        foreach (a; fn.attributes)
            if (isExternC(a))
                cLinkage = true;
        if (cLinkage && fn.name.text.length && !externC.canFind(fn.name.text))
            externC ~= fn.name.text;
        fn.accept(this);
    }
}

bool looksStubbed(string src, ulong ldcBytes, ulong oursBytes)
{
    auto n = normalizeSource(src);
    if (ldcBytes > 0 && oursBytes * 100 / ldcBytes < 35)
        return true;
    if (n.canFind("unimplemented") || n.canFind("not implemented")
        || n.canFind("TODO: stub") || n.canFind("STUB:"))
        return true;
    return false;
}

bool looksAdapted(const ParseFacts ours, const ParseFacts ldc)
{
    if (ours.mentionsLibwasmCrt && !ldc.mentionsLibwasmCrt)
        return true;
    if (ours.mentionsWebAssembly && !ldc.mentionsWebAssembly)
        return true;
    return false;
}
