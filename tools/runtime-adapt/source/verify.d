// Compile a carried runtime-v<ldcV> tree with a matching ldc2 --version V.

module verify;

import std.algorithm : canFind;
import std.file : exists, tempDir, write;
import std.format : format;
import std.path : buildNormalizedPath, buildPath, dirName;
import std.process : Config, execute;
import std.string : indexOf, strip;

struct VerifyResult
{
    bool ok;
    string ldc2;
    string versionOut;
    string compileOut;
    int compileStatus;
    string cmd;
}

/// Map v1.36.0 → toolchain dir fragment ldc2-1.36.0
string tagToToolchain(string tag)
{
    auto t = tag.strip;
    if (t.length && (t[0] == 'v' || t[0] == 'V'))
        t = t[1 .. $];
    return "ldc2-" ~ t;
}

string findLdc2ForTag(string libwasmRoot, string tag)
{
    auto ver = tagToToolchain(tag);
    string[] cands = [
        buildNormalizedPath(libwasmRoot, "..", "..", "riscv-dev", "toolchains",
            ver ~ "-windows-x64", "bin", "ldc2.exe"),
        buildNormalizedPath(libwasmRoot, "..", "..", "riscv-dev", "toolchains",
            ver, "bin", "ldc2.exe"),
        buildNormalizedPath(libwasmRoot, "..", "toolchains",
            ver ~ "-windows-x64", "bin", "ldc2.exe"),
        // LDC master ninja tree (riscv-compilers/ldc2-build).
        buildNormalizedPath(libwasmRoot, "..", "ldc2-build", "bin", "ldc2.exe"),
    ];
    foreach (p; cands)
        if (exists(p))
            return p;
    return "";
}

bool versionMatches(string versionOut, string tag)
{
    auto t = tag.strip;
    if (t.length && (t[0] == 'v' || t[0] == 'V'))
        t = t[1 .. $];
    if (versionOut.indexOf(t) >= 0)
        return true;
    // master / 1.43.0-git-* still match the 1.43.0 tag.
    if (t == "1.43.0" && versionOut.indexOf("1.43") >= 0)
        return true;
    return false;
}

VerifyResult verifyCarryBuild(string libwasmRoot, string tag, string runtimeDir)
{
    VerifyResult r;
    r.ldc2 = findLdc2ForTag(libwasmRoot, tag);
    if (!r.ldc2.length)
    {
        r.compileOut = "no ldc2 toolchain for " ~ tag;
        return r;
    }
    auto vo = execute([r.ldc2, "--version"]);
    r.versionOut = vo.output.strip;
    if (vo.status != 0 || !versionMatches(r.versionOut, tag))
    {
        r.compileOut = format("ldc2 --version did not match %s\n%s", tag, r.versionOut);
        r.compileStatus = vo.status ? vo.status : 1;
        return r;
    }

    auto smoke = buildPath(libwasmRoot, "tools", "runtime-adapt", "tests", "smoke_start.d");
    if (!exists(smoke))
    {
        r.compileOut = "missing tests/smoke_start.d";
        return r;
    }
    auto ofile = buildPath(runtimeDir, "smoke.o");
    string[] cmd = [
        r.ldc2,
        "-mtriple=wasm32-unknown-wasi",
        "-fno-moduleinfo",
        "-d-version=CRuntime_LIBWASM",
        "-defaultlib=",
        "-I=" ~ runtimeDir,
        "-c",
        smoke,
        "-of=" ~ ofile,
    ];
    r.cmd = cmd.joinCmd();
    auto cr = execute(cmd);
    r.compileStatus = cr.status;
    r.compileOut = cr.output;
    if (cr.status != 0)
    {
        // Only fall back when this ldc2 cannot target wasm. A real
        // wasm semantic error (missing entrypoint, ClassInfo, …)
        // must fail the carry — host import/ would hide it.
        auto wasmMissing = cr.output.canFind("unknown target")
            || cr.output.canFind("Unable to find target")
            || cr.output.canFind("invalid architecture");
        if (!wasmMissing)
        {
            r.ok = false;
            return r;
        }
        cmd = [
            r.ldc2,
            "-fno-moduleinfo",
            "-d-version=CRuntime_LIBWASM",
            "-defaultlib=",
            "-I=" ~ runtimeDir,
            "-c",
            smoke,
            "-of=" ~ ofile,
        ];
        r.cmd ~= "\n# fallback host:\n" ~ cmd.joinCmd();
        cr = execute(cmd);
        r.compileStatus = cr.status;
        r.compileOut ~= "\n--- host fallback ---\n" ~ cr.output;
    }
    r.ok = r.compileStatus == 0;
    return r;
}

private string joinCmd(string[] cmd)
{
    string s;
    foreach (i, a; cmd)
    {
        if (i)
            s ~= " ";
        s ~= a;
    }
    return s;
}
