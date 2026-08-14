module app;

import classify;
import consecutive;
import emit;
import generate;
import paths;
import report;
import verify;
import versions;
import walk;

import std.algorithm : canFind, startsWith;
import std.file : exists, mkdirRecurse, write;
import std.path : buildPath, dirName;
import std.stdio;
import std.string : indexOf;

int main(string[] args)
{
    auto roots = defaultRoots();
    bool doGenerate = true;
    bool doUpgrade = true;
    bool doCarry;
    bool doConsecutive;
    bool doVerify = true;
    bool help;

    for (size_t i = 1; i < args.length; ++i)
    {
        auto a = args[i];
        string next()
        {
            if (i + 1 >= args.length)
                throw new Exception("missing value for " ~ a);
            return args[++i];
        }

        if (a == "-h" || a == "--help")
            help = true;
        else if (a == "--libwasm-root")
            roots.libwasm = abs(next());
        else if (a == "--ldc-root")
            roots.ldc = abs(next());
        else if (a == "--new-import")
            roots.newImport = abs(next());
        else if (a == "--out-dir")
            roots.outDir = abs(next());
        else if (a == "--report")
            roots.reportMd = abs(next());
        else if (a == "--json")
            roots.reportJson = abs(next());
        else if (a == "--no-generate")
            doGenerate = false;
        else if (a == "--no-upgrade")
            doUpgrade = false;
        else if (a == "--carry")
            doCarry = true;
        else if (a == "--consecutive")
            doConsecutive = true;
        else if (a == "--ldc-tag")
            roots.ldcTag = next();
        else if (a == "--stock-root")
            roots.stockRoot = abs(next());
        else if (a == "--no-verify")
            doVerify = false;
        else
        {
            stderr.writeln("unknown flag: ", a);
            help = true;
        }
    }

    if (help)
    {
        writeln(q"HELP
runtime-adapt — CRuntime_LIBWASM from LDC stock.

Pin generate (default): classify LDC 1.36 vs druntime-wasm; copy identical
from LDC, adapted from libwasm. Does not carry to other tags.

Carry (LDC-style): take stock at --ldc-tag, apply taught adapt.d splices
(CRT gate, no-GC alloc, throw abort on pre-1.43, drop kernel imports).
1.43+ emits exception-using Phobos (numeric/json/regex/…). Same splices
replay onto N+n / N-n. Never copies a previous generated tree forward.

  dub build --compiler=ldc2
  dub run --compiler=ldc2 -- [flags]

  --libwasm-root DIR   libwasm checkout (auto-detected)
  --ldc-root DIR       LDC v1.36.0 clone (default tmp/ldc-1.36.0)
  --new-import DIR     LDC 1.42 import/ (upgrade map + v1.42.0 stock)
  --out-dir DIR        pin generate out (tmp/generated-druntime-wasm)
  --report FILE / --json FILE
  --no-generate        classify only
  --no-upgrade         skip 1.42 map

  --carry              emit stock-N + splices → libwasm/runtime-v<tag>
  --ldc-tag TAG        stock tag (default v1.36.0)
  --stock-root DIR     override clone or import/ tree
  --consecutive        walk adjacent tags into runtime-v*; verify ldc2 --version
  --no-verify          skip ldc2 compile smoke after --carry / --consecutive
HELP");
        return help && args.length > 1 ? 1 : 0;
    }

    if (doCarry || doConsecutive)
        doGenerate = false;

    requireExists(libwasmRuntime(roots.libwasm), "libwasm druntime-wasm");
    if (!doCarry && !doConsecutive)
    {
        requireExists(buildPath(roots.ldc, "runtime", "druntime", "src", "object.d"),
            "LDC 1.36.0 druntime (clone tag v1.36.0 recursively into tmp/ldc-1.36.0)");
        requireExists(buildPath(roots.ldc, "runtime", "phobos", "std"),
            "LDC 1.36.0 phobos submodule");
    }

    if (doConsecutive)
    {
        writeln("consecutive carry → ", roots.libwasm, "/runtime-v<tag>");
        auto steps = runConsecutiveLadder(roots.libwasm, roots.ldc, roots.newImport,
            roots.libwasm);
        auto md = renderConsecutive(steps);
        auto dest = buildPath(roots.libwasm, "runtime-CONSECUTIVE.md");
        write(dest, md);
        writeln(md);
        writeln("report      ", dest);
        int bad;
        foreach (s; steps)
            if (!s.skipped && doVerify && findLdc2ForTag(roots.libwasm, s.toTag).length
                && !s.toBuildOk)
                bad++;
        return bad ? 1 : 0;
    }

    if (doCarry)
    {
        auto stock = roots.stockRoot;
        if (!stock.length)
            stock = resolveStock(roots.libwasm, roots.ldcTag, roots.ldc, roots.newImport);
        if (!stock.length)
        {
            stderr.writeln("no stock for ", roots.ldcTag,
                " (clone tmp/", tagToDirName(roots.ldcTag),
                " or pass --stock-root / --new-import)");
            return 1;
        }
        auto outDir = roots.outDir;
        if (outDir == defaultRoots().outDir || !outDir.length
            || outDir.canFind("generated-druntime-wasm"))
            outDir = runtimeVersionDir(roots.libwasm, roots.ldcTag);
        writeln("carry       tag=", roots.ldcTag, " stock=", stock);
        auto er = emitCarry(stock, libwasmRuntime(roots.libwasm), outDir, roots.ldcTag);
        writeln("  emitted=", er.emitted, " omitted=", er.omitted,
            " spliced=", er.spliced, " extras=", er.extras,
            " parseFail=", er.parseFail);
        writeln("  out        ", outDir);
        if (er.parseFail)
            return 1;
        if (!doVerify)
            return 0;
        auto vr = verifyCarryBuild(roots.libwasm, roots.ldcTag, outDir);
        writeln("  ldc2       ", vr.ldc2);
        writeln("  --version  ", vr.versionOut.canFind('\n')
            ? vr.versionOut[0 .. vr.versionOut.indexOf('\n')] : vr.versionOut);
        writeln("  compile    ", vr.ok ? "ok" : "FAIL");
        if (!vr.ok)
        {
            writeln(vr.cmd);
            writeln(vr.compileOut);
            return 1;
        }
        return 0;
    }

    writeln("libwasm     ", roots.libwasm);
    writeln("ldc 1.36    ", roots.ldc);
    if (roots.newImport.length)
        writeln("new import  ", roots.newImport);

    writeln("walking trees…");
    auto ldcFiles = walkLdc136(roots.ldc);
    auto oursFiles = walkLibwasmRuntime(roots.libwasm);
    auto kernelRt = walkLibwasmKernel(roots.libwasm);
    writeln("  ldc files     ", ldcFiles.length);
    writeln("  libwasm files ", oursFiles.length);
    writeln("  libwasm/rt    ", kernelRt.length);

    writeln("parsing + classifying (libdparse)…");
    auto inv = classifyTrees(ldcFiles, oursFiles, kernelRt);
    auto c = countKinds(inv.rows);
    writeln(formatCounts(c, inv.rows.length));

    UpgradeRow[] up;
    if (doUpgrade && roots.newImport.length && exists(buildPath(roots.newImport, "object.d")))
    {
        writeln("upgrade map vs ", roots.newImport);
        auto neu = walkImportTree(roots.newImport);
        writeln("  newest files  ", neu.length);
        up = upgradeMap(inv.rows, neu);
    }

    mkdirRecurse(dirName(roots.reportMd));
    auto md = renderMarkdown(inv, up, roots.ldc, roots.libwasm, roots.newImport);
    write(roots.reportMd, md);
    write(roots.reportJson, renderJson(inv, up));
    writeln("report      ", roots.reportMd);
    writeln("json        ", roots.reportJson);

    if (doGenerate)
    {
        writeln("generating  ", roots.outDir);
        auto st = generateTree(inv, roots.outDir);
        writeln("  copy-ldc     ", st.copiedLdc);
        writeln("  copy-libwasm ", st.copiedLibwasm);
        writeln("  omitted      ", st.omitted);
        writeln("  js stubs     ", st.jsWrote);
    }
    return 0;
}

string formatCounts(Counts c, size_t total)
{
    import std.format : format;
    return format("  identical=%s adapted=%s stub-adapt=%s extra=%s missing=%s total=%s",
        c.identical, c.adapted, c.stubAdapt, c.extra, c.missing, total);
}
