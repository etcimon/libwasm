// Carry libwasm 1.36.0 splices across adjacent LDC stock tags.
// Does not copy N's generated tree onto N+1. Each tag is stock-N + the
// same taught adapt.d splices.

module consecutive;

import emit;
import paths;
import versions;
import verify;

import std.file : exists, mkdirRecurse;
import std.format : format;
import std.path : buildPath;

struct ConsecutiveStep
{
    string fromTag;
    string toTag;
    string fromStock;
    string toStock;
    bool skipped;
    string skipReason;
    int fromEmitted;
    int toEmitted;
    int fromSpliced;
    int toSpliced;
    int fromParseFail;
    int toParseFail;
    int fromMissed;
    int toMissed;
    bool fromBuildOk;
    bool toBuildOk;
    string fromBuildNote;
    string toBuildNote;
    string note;
}

string resolveStock(string libwasmRoot, string tag, string pinLdc, string import42)
{
    import std.path : buildNormalizedPath, dirName;
    if (tag == pinTag && pinLdc.length && exists(buildPath(pinLdc, "runtime",
            "druntime", "src", "object.d")))
        return pinLdc;
    auto named = buildPath(libwasmRoot, "tmp", tagToDirName(tag));
    if (exists(buildPath(named, "runtime", "druntime", "src", "object.d"))
        || exists(buildPath(named, "object.d")))
        return named;
    if ((tag == "v1.42.0" || tag == "1.42.0") && import42.length
        && exists(buildPath(import42, "object.d")))
        return import42;
    // LDC master checkout next to libwasm (riscv-compilers/ldc2).
    if (tag == "v1.43.0" || tag == "1.43.0" || tag == "master")
    {
        auto master = buildNormalizedPath(libwasmRoot, "..", "ldc2");
        if (exists(buildPath(master, "runtime", "druntime", "src", "object.d")))
            return master;
    }
    auto ldc2ref = buildNormalizedPath(libwasmRoot, "..", "ldc2", "tools",
        "runtime-adapt", "workspace", "refs", tag);
    if (exists(buildPath(ldc2ref, "runtime", "druntime", "src", "object.d")))
        return ldc2ref;
    return "";
}

ConsecutiveStep runConsecutiveStep(string libwasmRoot, string fromTag, string toTag,
    string pinLdc, string import42, string outBase)
{
    ConsecutiveStep s;
    s.fromTag = fromTag;
    s.toTag = toTag;
    s.fromStock = resolveStock(libwasmRoot, fromTag, pinLdc, import42);
    s.toStock = resolveStock(libwasmRoot, toTag, pinLdc, import42);
    if (!s.fromStock.length)
    {
        s.skipped = true;
        s.skipReason = "no stock for " ~ fromTag;
        return s;
    }
    if (!s.toStock.length)
    {
        s.skipped = true;
        s.skipReason = "no stock for " ~ toTag;
        return s;
    }

    auto pin = libwasmRuntime(libwasmRoot);
    auto fromOut = runtimeVersionDir(libwasmRoot, fromTag);
    auto toOut = runtimeVersionDir(libwasmRoot, toTag);
    auto a = emitCarry(s.fromStock, pin, fromOut, fromTag);
    auto b = emitCarry(s.toStock, pin, toOut, toTag);
    s.fromEmitted = a.emitted;
    s.toEmitted = b.emitted;
    s.fromSpliced = a.spliced;
    s.toSpliced = b.spliced;
    s.fromParseFail = a.parseFail;
    s.toParseFail = b.parseFail;
    foreach (c; a.cmps)
        if (c.klass == "missed-libwasm")
            s.fromMissed++;
    foreach (c; b.cmps)
        if (c.klass == "missed-libwasm")
            s.toMissed++;
    auto va = verifyCarryBuild(libwasmRoot, fromTag, fromOut);
    auto vb = verifyCarryBuild(libwasmRoot, toTag, toOut);
    s.fromBuildOk = va.ok;
    s.toBuildOk = vb.ok;
    s.fromBuildNote = va.ok ? "ldc2 " ~ fromTag ~ " ok" : va.compileOut;
    s.toBuildNote = vb.ok ? "ldc2 " ~ toTag ~ " ok" : vb.compileOut;
    s.note = format("emit %s→%s spliced %s→%s missed %s→%s parse %s→%s build %s→%s",
        s.fromEmitted, s.toEmitted, s.fromSpliced, s.toSpliced,
        s.fromMissed, s.toMissed, s.fromParseFail, s.toParseFail,
        s.fromBuildOk, s.toBuildOk);
    return s;
}

ConsecutiveStep[] runConsecutiveLadder(string libwasmRoot, string pinLdc, string import42,
    string outBase, const string[] tags = null)
{
    auto seq = tags.length ? tags : tagWindow();
    ConsecutiveStep[] outp;
    foreach (i, tag; seq)
    {
        if (i + 1 >= seq.length)
            break;
        outp ~= runConsecutiveStep(libwasmRoot, tag, seq[i + 1], pinLdc, import42, outBase);
    }
    return outp;
}

string renderConsecutive(const ConsecutiveStep[] steps)
{
    import std.array : appender;
    auto buf = appender!string();
    buf.put("# consecutive carry — stock-N + taught splices, not copy-N\n\n");
    buf.put("| from | to | skip | emitted | spliced | missed | parseFail | ldc2 build |\n");
    buf.put("|---|---|---|---|---|---|---|---|\n");
    foreach (s; steps)
    {
        if (s.skipped)
        {
            buf.put(format("| %s | %s | %s | | | | | |\n", s.fromTag, s.toTag, s.skipReason));
            continue;
        }
        buf.put(format("| %s | %s | | %s→%s | %s→%s | %s→%s | %s→%s | %s→%s |\n",
            s.fromTag, s.toTag, s.fromEmitted, s.toEmitted,
            s.fromSpliced, s.toSpliced, s.fromMissed, s.toMissed,
            s.fromParseFail, s.toParseFail,
            s.fromBuildOk ? "ok" : "skip/fail",
            s.toBuildOk ? "ok" : "skip/fail"));
    }
    return buf.data;
}
