module paths;

import std.file : exists, getcwd, thisExePath;
import std.path : absolutePath, baseName, buildNormalizedPath, buildPath, dirName;

struct Roots
{
    string libwasm;
    string ldc;
    string newImport; /// optional LDC 1.42+ import/ (upgrade map)
    string outDir;
    string reportMd;
    string reportJson;
    string ldcTag = "v1.36.0"; /// stock tag for --carry
    string stockRoot;          /// override clone or import/ tree
}

string findLibwasmRoot()
{
    string[] candidates = [getcwd()];
    auto cwd = getcwd();
    if (baseName(cwd) == "runtime-adapt" && baseName(dirName(cwd)) == "tools")
        candidates ~= dirName(dirName(cwd));

    auto p = dirName(thisExePath); // bin/
    foreach (_; 0 .. 5)
    {
        candidates ~= p;
        p = dirName(p);
    }

    foreach (c; candidates)
    {
        if (exists(buildPath(c, "druntime-wasm", "object.d"))
            && exists(buildPath(c, "source", "libwasm")))
            return buildNormalizedPath(c);
    }
    return buildNormalizedPath(cwd);
}

Roots defaultRoots()
{
    Roots r;
    r.libwasm = findLibwasmRoot();
    r.ldc = buildPath(r.libwasm, "tmp", "ldc-1.36.0");
    auto guess42 = buildNormalizedPath(r.libwasm, "..", "..", "riscv-dev",
        "toolchains", "ldc2-1.42.0-windows-x64", "import");
    if (exists(buildPath(guess42, "object.d")))
        r.newImport = guess42;
    r.outDir = buildPath(r.libwasm, "tmp", "generated-druntime-wasm");
    r.reportMd = buildPath(r.libwasm, "tmp", "runtime-adapt-report.md");
    r.reportJson = buildPath(r.libwasm, "tmp", "runtime-adapt-report.json");
    return r;
}

string ldcDruntimeSrc(string ldcRoot)
{
    return buildPath(ldcRoot, "runtime", "druntime", "src");
}

string ldcPhobosRoot(string ldcRoot)
{
    return buildPath(ldcRoot, "runtime", "phobos");
}

string libwasmRuntime(string libwasmRoot)
{
    return buildPath(libwasmRoot, "druntime-wasm");
}

/// Carry product: libwasm/runtime-v1.36.0
string runtimeVersionDir(string libwasmRoot, string tag)
{
    auto t = tag;
    if (t.length && t[0] != 'v' && t[0] != 'V')
        t = "v" ~ t;
    return buildPath(libwasmRoot, "runtime-" ~ t);
}

string libwasmRtKernel(string libwasmRoot)
{
    return buildPath(libwasmRoot, "source", "libwasm", "rt");
}

string jsGlueSlideshow(string libwasmRoot)
{
    return buildNormalizedPath(libwasmRoot, "..", "..", "riscv-dev",
        "slideshow3dai", "src-ts", "modules", "libwasm.ts");
}

string jsGlueExample(string libwasmRoot)
{
    return buildPath(libwasmRoot, "examples", "dom-ts", "src-ts", "modules", "libwasm.ts");
}

void requireExists(string path, string what)
{
    import std.exception : enforce;
    enforce(exists(path), what ~ " not found: " ~ path);
}

string abs(string p)
{
    return buildNormalizedPath(absolutePath(p));
}
