module walk;

import std.algorithm : canFind, endsWith, filter, map, sort;
import std.array : array, replace;
import std.file : dirEntries, exists, SpanMode;
import std.path : baseName, buildPath, dirSeparator, extension, relativePath;

/// A source file relative to a runtime root, POSIX separators.
struct RelFile
{
    string rel;  /// e.g. core/memory.d
    string abs;
}

bool isSourceName(string name)
{
    auto ext = extension(name);
    return ext == ".d" || ext == ".di";
}

bool skipDirName(string name)
{
    switch (name)
    {
    case ".git", "test", "tests", "changelog", "__dummy":
        return true;
    default:
        return false;
    }
}

bool skipFileName(string name)
{
    switch (name)
    {
    case "test_runner.d", "importc.h":
        return true;
    default:
        return name.endsWith(".dd") || name.endsWith(".c") || name.endsWith(".S")
            || name.endsWith(".asm") || name.endsWith(".obj");
    }
}

private RelFile[] collectUnder(string root, string prefix)
{
    RelFile[] outp;
    if (!exists(root))
        return outp;
    foreach (e; dirEntries(root, SpanMode.depth))
    {
        if (e.isDir)
            continue;
        auto relFromRoot = relativePath(e.name, root).replace(dirSeparator, "/");
        bool skipped;
        foreach (part; relFromRoot.splitPosix)
        {
            if (skipDirName(part))
            {
                skipped = true;
                break;
            }
        }
        if (skipped || skipFileName(baseName(e.name)) || !isSourceName(e.name))
            continue;
        auto rel = prefix.length ? prefix ~ "/" ~ relFromRoot : relFromRoot;
        outp ~= RelFile(rel, e.name);
    }
    return outp;
}

private string[] splitPosix(string p)
{
    import std.array : split;
    return p.split('/');
}

/// LDC 1.36 in-tree: runtime/druntime/src + runtime/phobos/{std,etc}
RelFile[] walkLdc136(string ldcRoot)
{
    import paths : ldcDruntimeSrc, ldcPhobosRoot;
    RelFile[] files;
    files ~= collectUnder(ldcDruntimeSrc(ldcRoot), "");
    auto ph = ldcPhobosRoot(ldcRoot);
    files ~= collectUnder(buildPath(ph, "std"), "std");
    files ~= collectUnder(buildPath(ph, "etc"), "etc");
    files.sort!((a, b) => a.rel < b.rel);
    return files;
}

/// Merged import/ tree (LDC Windows package 1.42+).
RelFile[] walkImportTree(string importRoot)
{
    auto files = collectUnder(importRoot, "");
    files.sort!((a, b) => a.rel < b.rel);
    return files;
}

RelFile[] walkLibwasmRuntime(string libwasmRoot)
{
    import paths : libwasmRuntime;
    auto files = collectUnder(libwasmRuntime(libwasmRoot), "");
    files.sort!((a, b) => a.rel < b.rel);
    return files;
}

RelFile[] walkLibwasmKernel(string libwasmRoot)
{
    import paths : libwasmRtKernel;
    auto files = collectUnder(libwasmRtKernel(libwasmRoot), "libwasm/rt");
    files.sort!((a, b) => a.rel < b.rel);
    return files;
}

RelFile* findRel(RelFile[] files, string rel)
{
    foreach (ref f; files)
        if (f.rel == rel)
            return &f;
    return null;
}
