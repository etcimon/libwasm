// Carry emit: LDC-N stock + taught splices + libwasm-only extras.
// Pin druntime-wasm is compare-only. Never copy LDC-N "goal" as the product
// for hook files — those go through adapt.d.

module emit;

import adapt;
import filecmp;
import generate : writeJsEhStubs, jsReadme;
import kernel;
import parseutil;
import paths;
import principles;
import versions;
import walk;

import std.algorithm : canFind;
import std.array : appender, join, replace, split;
import std.file : exists, mkdirRecurse, readText, write, rmdirRecurse;
import std.format : format;
import std.path : buildPath, dirName;

struct FileEmit
{
    string rel;
    EmitAction action;
    string principleId;
    string[] astRules;
    bool parsedOut;
    string error;
}

struct EmitReport
{
    string tag;
    string stockRoot;
    string outDir;
    int emitted;
    int omitted;
    int spliced;
    int extras;
    int parseFail;
    FileEmit[] files;
    FileCmp[] cmps;
}

private string tryRead(string p)
{
    if (!p.length || !exists(p))
        return "";
    return normalizeSource(readText(p));
}

EmitReport emitCarry(string stockRoot, string pinRoot, string outDir, string tag)
{
    if (exists(outDir))
        rmdirRecurse(outDir);
    mkdirRecurse(outDir);
    mkdirRecurse(buildPath(outDir, "js"));

    EmitReport rep;
    rep.tag = tag;
    rep.stockRoot = stockRoot;
    rep.outDir = outDir;

    auto stockFiles = walkStockOrImport(stockRoot);
    auto pinFiles = collectPin(pinRoot);
    bool[string] done;

    foreach (sf; stockFiles)
    {
        auto g = classifyPath(sf.rel);
        auto p = selectPrinciple(sf.rel, g);
        EmitAction act = selectAction(sf.rel, g, tag);
        if (act != EmitAction.omit && p !is null && p.action == EmitAction.astOverlay)
            act = EmitAction.astOverlay;
        // Pre-EH: pin std/ is the curated wasm set. Stock logger /
        // experimental/allocator pull omitted core.sync. 1.43+ wasm EH
        // emits all non-kernel Phobos; unused sourceLibrary files are
        // not compiled until imported.
        auto pinHit0 = findRel(pinFiles, sf.rel);
        if (!isEhCapableTag(tag) && act != EmitAction.omit && pinHit0 is null
            && !isHookFile(sf.rel) && !isCompilerHookFile(sf.rel)
            && sf.rel != "object.d"
            && !(sf.rel.length >= 4 && sf.rel[0 .. 4] == "ldc/")
            && g != KernelGroup.ctfeKeep)
            act = EmitAction.omit;
        // On disk for later, but do not compile: POSIX clocks, uuid
        // (needs Clock), logger, C++ bindings, LLVM-only stdatomic.
        if (act != EmitAction.omit && omitUncompilableOnWasm(sf.rel))
            act = EmitAction.omit;
        FileEmit fe;
        fe.rel = sf.rel;
        fe.action = act;
        if (act == EmitAction.omit)
            fe.principleId = p is null ? "omit.kernel" : p.id;
        else if (isEhCapableTag(tag) && p !is null && p.id == "omit.kernel")
            fe.principleId = "take.stock-eh-phobos";
        else
            fe.principleId = p is null ? "take.stock" : p.id;

        if (act == EmitAction.omit)
        {
            rep.omitted++;
            rep.files ~= fe;
            done[sf.rel] = true;
            continue;
        }

        auto stockTxt = tryRead(sf.abs);
        auto pinTxt0 = pinHit0 is null ? "" : tryRead(pinHit0.abs);
        // Stock-N is the emit source. Pin is FILE-CMP + extras only.
        // Copying pin object.d onto 1.42 keeps ClassInfo at the 1.36
        // field count (no depth/nameSig) → ldc2 1.42 rejects classes.
        // Mixing pin object.d with stock capacity.d is the other way
        // to break (_d_arraysetlengthT vs _d_arraysetlengthTImpl).
        // Compiler ABI / LLVM: always stock-N.
        //   object.d          TypeInfo_Class field count
        //   ldc/*             LDC_LLVM_* asserts
        //   array/capacity.d  1.42 object.d imports _d_arraysetlengthT
        // Everything else pin has is the 1.36 WASI/no-GC port.
        immutable isLdcPkg = sf.rel.length >= 4 && sf.rel[0 .. 4] == "ldc/";
        immutable isStd = sf.rel.length >= 4 && sf.rel[0 .. 4] == "std/";
        // 1.43 Phobos must be stock-N. Pin gammafunction is 1.36 and
        // lacks sgnGamma / beta that 1.43 mathspecial calls.
        immutable forceStock = isLdcPkg || sf.rel == "object.d"
            || isCompilerHookFile(sf.rel)
            || (isEhCapableTag(tag) && isStd);
        string body;
        if (sf.rel == "core/time.d" && tag.canFind("1.43"))
        {
            body = renderTimeStub();
            fe.principleId = "stub.time-libwasm";
            fe.parsedOut = true;
        }
        else if (forceStock || !pinTxt0.length)
        {
            body = stockTxt;
            if (isCompilerHookFile(sf.rel))
                fe.principleId = "take.stock-compiler-hook";
        }
        else
        {
            body = pinTxt0;
            fe.principleId = "take.pin";
        }
        if (fe.principleId != "stub.time-libwasm"
            && (act == EmitAction.astOverlay || isHookFile(sf.rel)))
        {
            auto ad = adaptSource(body, sf.rel, tag, AdaptMode.overlay);
            body = ad.output;
            fe.astRules = ad.applied;
            fe.parsedOut = ad.parsedOut;
            if (!ad.parsedOut)
            {
                fe.error = ad.error;
                rep.parseFail++;
            }
            if (ad.applied.length)
                rep.spliced++;
        }
        else
        {
            fe.parsedOut = true;
        }

        auto dest = buildPath(outDir ~ sf.rel.split("/"));
        mkdirRecurse(dirName(dest));
        write(dest, body);
        rep.emitted++;
        done[sf.rel] = true;

        auto pinHit = findRel(pinFiles, sf.rel);
        auto pinTxt = pinHit is null ? "" : tryRead(pinHit.abs);
        rep.cmps ~= classifyFile(sf.rel, body, pinTxt, stockTxt);
        rep.files ~= fe;
    }

    foreach (pf; pinFiles)
    {
        if (pf.rel in done)
            continue;
        // 1.36 rt/lifetime imports __arrayStart; 1.42 has no rt/lifetime.
        // 1.36 rt/* extras (lifetime, aaA, …) target the pin kernel.
        if (pf.rel.length >= 3 && pf.rel[0 .. 3] == "rt/")
            continue;
        // libwasm-only extra (core/sys/wasi, …)
        auto dest = buildPath(outDir ~ pf.rel.split("/"));
        mkdirRecurse(dirName(dest));
        write(dest, tryRead(pf.abs));
        FileEmit fe;
        fe.rel = pf.rel;
        fe.action = EmitAction.copyLibwasm;
        fe.principleId = "copy.libwasm-extra";
        fe.parsedOut = true;
        rep.files ~= fe;
        rep.extras++;
        rep.emitted++;
        done[pf.rel] = true;
        auto stockHit = findRel(stockFiles, pf.rel);
        auto stockTxt = stockHit is null ? "" : tryRead(stockHit.abs);
        rep.cmps ~= classifyFile(pf.rel, tryRead(pf.abs), tryRead(pf.abs), stockTxt);
    }

    // 1.42 array.appending imports PAGESIZE from omitted GC blockmeta.
    {
        auto dest = buildPath(outDir, "core", "internal", "gc", "blockmeta.d");
        if (!exists(dest))
        {
            mkdirRecurse(dirName(dest));
            write(dest, "module core.internal.gc.blockmeta;\n"
                ~ "// runtime-adapt stub: stock appending only needs PAGESIZE.\n"
                ~ "enum size_t PAGESIZE = 4096;\n");
            FileEmit fe;
            fe.rel = "core/internal/gc/blockmeta.d";
            fe.action = EmitAction.takeStock;
            fe.principleId = "stub.blockmeta-pagesize";
            fe.parsedOut = true;
            rep.files ~= fe;
            rep.extras++;
            rep.emitted++;
        }
    }

    write(buildPath(outDir, "dub.sdl"), renderDruntimeDubSdl(tag));
    write(buildPath(outDir, "ldc2-wasm.conf"), renderWasmConf(outDir));

    writeJsEhStubs(buildPath(outDir, "js", "error-handling.ts"));
    writeJsEhStubs(buildPath(outDir, "js", "error-handling.js.txt"));
    write(buildPath(outDir, "js", "README.md"), jsReadme());
    write(buildPath(outDir, "FILE-CMP.md"), renderFileCmp(rep.cmps, tag));
    write(buildPath(outDir, "EMIT.md"), renderEmit(rep));
    return rep;
}

string renderTimeStub()
{
    return q"D
module core.time;

// runtime-adapt stub: LDC 1.43 treats wasm as Posix, so stock/pin
// MonoTimeImpl infers void from _posixClock. Libwasm uses JS time.
// Enough of Duration / TimeException for exception-using Phobos
// (std.datetime.date, std.conv, …) without POSIX clocks.
enum ClockType { normal = 0, raw = 5, processCPUTime = 4, threadCPUTime = 7 }

class TimeException : Exception
{
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable next = null) @safe pure nothrow
    {
        super(msg, file, line, next);
    }
    this(string msg, Throwable next, string file = __FILE__, size_t line = __LINE__) @safe pure nothrow
    {
        super(msg, file, line, next);
    }
}

struct Duration
{
    long hnsecs;
    long total(string units)() const @safe @nogc nothrow pure
    {
        static if (units == "hnsecs") return hnsecs;
        else static if (units == "nsecs") return hnsecs * 100;
        else static if (units == "usecs") return hnsecs / 10;
        else static if (units == "msecs") return hnsecs / 10_000;
        else static if (units == "seconds") return hnsecs / 10_000_000;
        else static if (units == "minutes") return hnsecs / 600_000_000L;
        else static if (units == "hours") return hnsecs / 36_000_000_000L;
        else static if (units == "days") return hnsecs / 864_000_000_000L;
        else static if (units == "weeks") return hnsecs / 6_048_000_000_000L;
        else static assert(0, units);
    }
    Duration opUnary(string op)() const @safe @nogc nothrow pure if (op == "-")
    {
        return Duration(-hnsecs);
    }
    Duration opBinary(string op)(Duration rhs) const @safe @nogc nothrow pure
        if (op == "+" || op == "-")
    {
        static if (op == "+") return Duration(hnsecs + rhs.hnsecs);
        else return Duration(hnsecs - rhs.hnsecs);
    }
}

long convert(string from, string to)(long value) @safe @nogc nothrow pure
{
    return dur!from(value).total!to();
}

Duration dur(string units)(long length) @safe @nogc nothrow pure
{
    static if (units == "hnsecs") return Duration(length);
    else static if (units == "nsecs") return Duration(length / 100);
    else static if (units == "usecs") return Duration(length * 10);
    else static if (units == "msecs") return Duration(length * 10_000);
    else static if (units == "seconds") return Duration(length * 10_000_000);
    else static if (units == "minutes") return Duration(length * 600_000_000L);
    else static if (units == "hours") return Duration(length * 36_000_000_000L);
    else static if (units == "days") return Duration(length * 864_000_000_000L);
    else static if (units == "weeks") return Duration(length * 6_048_000_000_000L);
    else static assert(0, units);
}

alias weeks = dur!"weeks";
alias days = dur!"days";
alias hours = dur!"hours";
alias minutes = dur!"minutes";
alias seconds = dur!"seconds";
alias msecs = dur!"msecs";
alias usecs = dur!"usecs";
alias hnsecs = dur!"hnsecs";
alias nsecs = dur!"nsecs";

Duration abs(Duration d) @safe @nogc nothrow pure
{
    return Duration(d.hnsecs < 0 ? -d.hnsecs : d.hnsecs);
}

struct MonoTimeImpl(ClockType ct = ClockType.normal)
{
    enum ticksPerSecond = 1_000_000L;
    long ticks;
    static MonoTimeImpl currTime() @safe @nogc nothrow { return MonoTimeImpl.init; }
}
alias MonoTime = MonoTimeImpl!(ClockType.normal);
D";
}

string renderDruntimeDubSdl(string tag)
{
    auto t = tag;
    if (t.length && (t[0] == 'v' || t[0] == 'V'))
        t = t[1 .. $];
    // 1.43+ emits a large Phobos set. Compile the exception-using
    // subset; exclude OS / C++ / logger / POSIX clocks / stdatomic
    // (those files stay on disk for targeted import later).
    if (isEhCapableTag(tag))
    {
        return format(q"SDL
name "druntime-wasm"
description "Carried CRuntime_LIBWASM tree for LDC %s (runtime-adapt --carry; wasm EH + Phobos)"
version "%s"
targetType "sourceLibrary"
targetArch "wasm32-unknown-wasi"
versions "CRuntime_LIBWASM"
importPaths "."
sourcePaths "core" "ldc" "std"
sourceFiles "object.d"
excludedSourceFiles "core/stdc/stdatomic.d" "core/stdcpp/*" "std/logger/*" "std/experimental/*" "std/windows/*" "std/net/*" "std/datetime/systime.d" "std/datetime/timezone.d" "std/datetime/package.d" "std/datetime/stopwatch.d"
SDL", t, t);
    }
    return format(q"SDL
name "druntime-wasm"
description "Carried CRuntime_LIBWASM tree for LDC %s (runtime-adapt --carry)"
version "%s"
targetType "sourceLibrary"
targetArch "wasm32-unknown-wasi"
versions "CRuntime_LIBWASM"
sourcePaths "core" "ldc" "std"
sourceFiles "object.d"
SDL", t, t);
}

string renderWasmConf(string runtimeDir)
{
    import std.path : buildNormalizedPath;
    auto inc = buildNormalizedPath(runtimeDir).replace("\\", "/");
    return format(q"CONF
// Generated next to runtime-v<tag>. Use: ldc2 -conf=<this file>
default:
{
    switches = [ "-defaultlib=" ];
    post-switches = [];
    lib-dirs = [];
};
"^wasm(32|64)-":
{
    switches = [
        "-defaultlib=",
        "-d-version=CRuntime_LIBWASM",
        "-fno-moduleinfo",
        "-L-z", "-Lstack-size=1048576",
        "-L--stack-first",
        "-link-internally",
        "-L--export-dynamic",
    ];
    post-switches = [ "-I%s" ];
    lib-dirs = [];
};
CONF", inc);
}

string renderEmit(const EmitReport rep)
{
    auto buf = appender!string();
    buf.put(format("# carry emit %s\n\n", rep.tag));
    buf.put(format("- stock: `%s`\n- out: `%s`\n", rep.stockRoot, rep.outDir));
    buf.put(format("- emitted %s  omitted %s  spliced %s  extras %s  parseFail %s\n\n",
        rep.emitted, rep.omitted, rep.spliced, rep.extras, rep.parseFail));
    buf.put("| path | action | principle | splices |\n");
    buf.put("|---|---|---|---|\n");
    foreach (f; rep.files)
    {
        if (f.action == EmitAction.takeStock && !f.astRules.length)
            continue;
        buf.put(format("| `%s` | %s | %s | %s |\n",
            f.rel, f.action, f.principleId, f.astRules.join(", ")));
    }
    return buf.data;
}

/// Files that need OS/LLVM bits even though they are "Phobos".
/// Leave them off the 1.43 compile graph (sourcePaths would build them).
bool omitUncompilableOnWasm(string rel)
{
    if (rel == "core/stdc/stdatomic.d" || rel == "std/uuid.d"
        || rel == "std/datetime/systime.d" || rel == "std/datetime/timezone.d"
        || rel == "std/datetime/package.d" || rel == "std/datetime/stopwatch.d")
        return true;
    static immutable prefixes = [
        "core/stdcpp/", "std/logger/", "std/experimental/",
        "std/windows/", "std/net/",
    ];
    foreach (p; prefixes)
        if (rel.length >= p.length && rel[0 .. p.length] == p)
            return true;
    return false;
}

private RelFile[] collectPin(string pinRoot)
{
    if (!pinRoot.length || !exists(pinRoot))
        return null;
    return walkLibwasmRuntimeFrom(pinRoot);
}

/// Walk an LDC clone (`runtime/druntime/src`) or a flat `import/` tree.
RelFile[] walkStockOrImport(string root)
{
    import std.file : exists;
    auto src = buildPath(root, "runtime", "druntime", "src", "object.d");
    if (exists(src))
        return walkLdc136(root);
    if (exists(buildPath(root, "object.d")))
        return walkImportTree(root);
    return null;
}

private RelFile[] walkLibwasmRuntimeFrom(string pinRoot)
{
    // pinRoot is either libwasm checkout or druntime-wasm itself.
    if (exists(buildPath(pinRoot, "druntime-wasm", "object.d")))
        return walkLibwasmRuntime(pinRoot);
    if (exists(buildPath(pinRoot, "object.d")))
        return walkImportTree(pinRoot);
    return null;
}
