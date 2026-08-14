// AST-driven splices. Apply libwasm-specific 1.36.0 edits onto *any* LDC-N
// stock body. Do not copy druntime-wasm blobs for hook files.
//
// Taught splices (carry N±n):
//   object.crt-gate          CRuntime_LIBWASM static assert after module
//   hook._d_allocmemory[T]   no GC.malloc
//   hook._d_throw_exception  abort on pre-1.43 (1.43+ uses libwasm.rt.eh)
//   drop-import.*            no ModuleInfo / threads / dwarf EH / _d_cmain
//   stdc.time-wasi           WASI → core.sys.wasi.time
//   stdc.assert-libwasm      CRuntime_LIBWASM assert symbols
//   spinlock.drop-thread     no core.thread / Thread.yield on wasm

module adapt;

import dparse.ast;
import dparse.lexer;
import dparse.parser : parseModule;
import dparse.rollback_allocator : RollbackAllocator;

import parseutil;
import versions;

import std.algorithm : canFind, sort;
import std.array : join;
import std.string : indexOf;

enum AdaptMode
{
    verifyOnly, /// newline-normalize only
    overlay,    /// taught libwasm splices
}

struct AdaptResult
{
    bool ok;
    bool parsedIn;
    bool parsedOut;
    string output;
    string error;
    string[] applied;
    ParseFacts inFacts;
    ParseFacts outFacts;
}

struct Splice
{
    size_t start;
    size_t end;
    string insert;
}

AdaptResult adaptSource(string source, string rel, string referenceTag, AdaptMode mode)
{
    AdaptResult r;
    auto src = normalizeSource(source);
    auto inn = parseDSource(src, rel);
    r.parsedIn = inn.parsed;
    r.inFacts = inn;
    if (!inn.parsed)
    {
        r.error = "input parse: " ~ inn.error;
        r.output = src;
        return r;
    }

    if (mode == AdaptMode.verifyOnly)
    {
        r.output = src;
        r.ok = true;
        r.parsedOut = true;
        r.outFacts = inn;
        return r;
    }

    LexerConfig config;
    config.fileName = rel;
    config.stringBehavior = StringBehavior.source;
    auto cache = StringCache(StringCache.defaultBucketCount);
    auto tokens = getTokensForParser(cast(ubyte[]) src, config, &cache);
    string lastErr;
    void msg(string, size_t, size_t, string m, bool isError)
    {
        if (isError)
            lastErr = m;
    }
    RollbackAllocator rba;
    uint errors;
    auto mod = parseModule(tokens, rel, &rba, &msg, &errors);
    if (errors || mod is null)
    {
        r.error = lastErr.length ? lastErr : "re-lex parse failed";
        r.output = src;
        return r;
    }

    auto vis = new AdaptVisitor(tokens);
    vis.visit(mod);
    // Token scan only: AST singleImports on `import a, b;` has a
    // zero-width / identifier span that eats the next declaration.
    vis.imports = scanImportTokens(tokens);

    Splice[] splices;
    if (rel == "core/internal/spinlock.d" && src.canFind("core.thread"))
    {
        auto imp = "import core.atomic, core.thread;";
        auto at = src.indexOf(imp);
        if (at >= 0)
        {
            splices ~= Splice(cast(size_t) at, cast(size_t) at + imp.length,
                "import core.atomic;");
            r.applied ~= "spinlock.drop-thread";
        }
        auto yld = "return Thread.yield();";
        auto yt = src.indexOf(yld);
        if (yt >= 0)
        {
            splices ~= Splice(cast(size_t) yt, cast(size_t) yt + yld.length,
                "return;");
            r.applied ~= "spinlock.no-yield";
        }
    }

    // LDC 1.43 defines version(Posix) on wasm32-unknown-wasi, so a
    // trailing `else version (WASI)` is dead. Lift WASI ahead of Posix.
    if (rel == "core/time.d")
    {
        auto posixClock = "else version (Posix)\n    {\n        enum clockArg = _posixClock(clockType);\n    }";
        auto at = src.indexOf(posixClock);
        if (at >= 0 && src.canFind("else version (WASI)"))
        {
            // 1.43 wasm32-unknown-wasi is version(Posix) and may not
            // define WASI. CRuntime_LIBWASM is the libwasm gate.
            splices ~= Splice(cast(size_t) at, cast(size_t) at + posixClock.length,
                "else version (CRuntime_LIBWASM)\n    {\n"
                ~ "        // no POSIX clock_gettime; JS getTimeStamp\n"
                ~ "    }\n"
                ~ posixClock);
            r.applied ~= "time.libwasm-before-posix";
        }
    }

    if (rel == "core/stdc/time.d" && !src.canFind("version (WASI)")
        && src.canFind("unsupported system"))
    {
        auto needle = "else\n    static assert(0, \"unsupported system\");";
        auto at = src.indexOf(needle);
        if (at >= 0)
        {
            splices ~= Splice(cast(size_t) at, cast(size_t) at + needle.length,
                "else version (WASI)\n"
                ~ "    public import core.sys.wasi.time;\n"
                ~ "else\n    static assert(0, \"unsupported system\");");
            r.applied ~= "stdc.time-wasi";
        }
    }

    if (rel == "core/stdc/assert_.d" && !src.canFind("CRuntime_LIBWASM"))
    {
        auto needle = "else\n{\n    static assert(0);\n}";
        auto at = src.indexOf(needle);
        if (at >= 0)
        {
            splices ~= Splice(cast(size_t) at, cast(size_t) at + needle.length,
                "else version (CRuntime_LIBWASM)\n{\n"
                ~ "    noreturn __assert(const(char)* exp, const(char)* file, uint line);\n"
                ~ "    noreturn __assert_fail(const(char)* exp, const(char)* file, uint line, const(char)* func);\n"
                ~ "}\nelse\n{\n    static assert(0);\n}");
            r.applied ~= "stdc.assert-libwasm";
        }
    }

    if (rel == "object.d" || inn.moduleName == "object")
    {
        auto at = afterModuleDecl(tokens);
        if (at != size_t.max && !src.canFind("CRuntime_LIBWASM"))
        {
            splices ~= Splice(at, at,
                "\n\n// runtime-adapt (" ~ referenceTag
                ~ "): CRT gate carried from libwasm 1.36.0\n"
                ~ "version (CRuntime_LIBWASM) {}\n"
                ~ "else static assert(0, \"WASI interface required. "
                ~ "You must compile with wasmXX-unknown-wasi.\");\n");
            r.applied ~= "object.crt-gate";
        }
    }

    foreach (fn; vis.functions)
    {
        if (fn.bodyStart == size_t.max || fn.bodyEnd == size_t.max)
            continue;
        if (fn.name == "_d_allocmemory" || fn.name == "_d_allocmemoryT")
        {
            splices ~= Splice(fn.bodyStart, fn.bodyEnd,
                "\n    {\n        // runtime-adapt " ~ referenceTag
                ~ ": stock body is GC.malloc. Libwasm WasmAllocator.\n"
                ~ "        return null;\n    }");
            r.applied ~= "hook." ~ fn.name;
        }
        else if (fn.name == "_d_throw_exception")
        {
            // 1.43+ libwasm.rt.eh implements llvm_wasm_throw. Do not
            // splice abort over a stock body if one is ever emitted.
            if (isEhCapableTag(referenceTag))
                continue;
            splices ~= Splice(fn.bodyStart, fn.bodyEnd,
                "\n    {\n        // runtime-adapt " ~ referenceTag
                ~ ": DtoThrow calls this; JS captureException aborts.\n"
                ~ "        assert(0, \"runtime-adapt: _d_throw_exception\");\n    }");
            r.applied ~= "hook._d_throw_exception";
        }
    }

    foreach (imp; vis.imports)
    {
        if (!shouldDropImport(imp.moduleName))
            continue;
        splices ~= Splice(imp.start, imp.end, "/* runtime-adapt drop import "
            ~ imp.moduleName ~ " */");
        r.applied ~= "drop-import." ~ imp.moduleName;
    }

    r.output = applySplices(src, splices);
    auto outp = parseDSource(r.output, rel);
    r.parsedOut = outp.parsed;
    r.outFacts = outp;
    r.ok = outp.parsed;
    if (!outp.parsed)
        r.error = "output parse: " ~ outp.error;
    return r;
}

private struct FnSpan
{
    string name;
    size_t bodyStart = size_t.max;
    size_t bodyEnd = size_t.max;
}

private struct ImpSpan
{
    string moduleName;
    size_t start;
    size_t end;
}

private final class AdaptVisitor : ASTVisitor
{
    alias visit = ASTVisitor.visit;
    const(Token)[] tokens;
    FnSpan[] functions;
    ImpSpan[] imports;

    this(const(Token)[] t)
    {
        tokens = t;
    }

    override void visit(const ImportDeclaration imp)
    {
        foreach (si; imp.singleImports)
        {
            ImpSpan s;
            s.moduleName = chainName(si.identifierChain);
            if (imp.startIndex || imp.endIndex)
            {
                s.start = imp.startIndex;
                s.end = imp.endIndex;
            }
            else
            {
                s.start = firstIdentIndex(si.identifierChain);
                s.end = s.start;
            }
            if (s.moduleName.length)
                imports ~= s;
        }
        imp.accept(this);
    }

    override void visit(const FunctionDeclaration fn)
    {
        FnSpan f;
        f.name = fn.name.text;
        braceSpanAfterName(f.name, f.bodyStart, f.bodyEnd);
        functions ~= f;
        fn.accept(this);
    }

    private void braceSpanAfterName(string name, ref size_t a, ref size_t b)
    {
        bool seenName;
        int depth;
        foreach (t; tokens)
        {
            if (!seenName)
            {
                if (t.type == tok!"identifier" && t.text == name)
                    seenName = true;
                continue;
            }
            if (t.type == tok!";" && depth == 0 && a == size_t.max)
                return;
            if (t.type == tok!"{")
            {
                if (depth == 0)
                    a = t.index;
                ++depth;
            }
            else if (t.type == tok!"}")
            {
                --depth;
                if (depth == 0 && a != size_t.max)
                {
                    auto closeLen = t.text.length ? t.text.length : 1;
                    b = t.index + closeLen;
                    return;
                }
            }
        }
    }
}

private string chainName(const IdentifierChain chain)
{
    if (chain is null)
        return "";
    string[] parts;
    foreach (t; chain.identifiers)
        if (t.text.length)
            parts ~= t.text;
    return parts.join(".");
}

private size_t firstIdentIndex(const IdentifierChain chain)
{
    if (chain is null || !chain.identifiers.length)
        return 0;
    return chain.identifiers[0].index;
}

/// Token scan so `public import core.internal.entrypoint : _d_cmain;`
/// is dropped. libdparse puts selective imports in importBindings, not
/// singleImports, so the AST visitor alone misses them.
private ImpSpan[] scanImportTokens(const(Token)[] tokens)
{
    ImpSpan[] r;
    foreach (i, t; tokens)
    {
        if (t.type != tok!"import")
            continue;
        size_t start = t.index;
        size_t j = i;
        while (j > 0)
        {
            auto prev = tokens[j - 1];
            if (prev.type == tok!"public" || prev.type == tok!"static"
                || prev.type == tok!"private" || prev.type == tok!"protected"
                || prev.type == tok!"export" || prev.type == tok!"package")
            {
                start = prev.index;
                --j;
            }
            else
                break;
        }
        string[] parts;
        bool inBinds;
        size_t end = start;
        for (size_t k = i + 1; k < tokens.length; ++k)
        {
            auto u = tokens[k];
            if (u.type == tok!";")
            {
                end = u.index + 1;
                break;
            }
            if (u.type == tok!":")
            {
                inBinds = true;
                continue;
            }
            if (!inBinds && u.type == tok!"identifier" && u.text.length)
                parts ~= u.text;
        }
        if (!parts.length || end <= start)
            continue;
        ImpSpan s;
        s.moduleName = parts.join(".");
        s.start = start;
        s.end = end;
        r ~= s;
    }
    return r;
}

private size_t afterModuleDecl(const(Token)[] tokens)
{
    bool sawModule;
    foreach (t; tokens)
    {
        if (t.type == tok!"module")
            sawModule = true;
        else if (sawModule && t.type == tok!";")
            return t.index + 1;
    }
    return size_t.max;
}

private bool shouldDropImport(string modName)
{
    if (!modName.length)
        return false;
    static immutable drop = [
        "core.thread", "core.sync", "rt.minfo", "rt.dmain2", "rt.sections",
        "rt.sections_elf_shared", "rt.sections_win64", "rt.sections_osx",
        "core.runtime", "rt.deh", "rt.dwarfeh", "core.internal.entrypoint",
    ];
    foreach (d; drop)
        if (modName == d || (modName.length > d.length && modName[0 .. d.length] == d
                && modName[d.length] == '.'))
            return true;
    return false;
}

private string applySplices(string src, Splice[] splices)
{
    if (!splices.length)
        return src;
    splices.sort!((a, b) => a.start > b.start);
    string s = src;
    foreach (sp; splices)
    {
        if (sp.start > s.length || sp.end > s.length || sp.end < sp.start)
            continue;
        s = s[0 .. sp.start] ~ sp.insert ~ s[sp.end .. $];
    }
    return s;
}
