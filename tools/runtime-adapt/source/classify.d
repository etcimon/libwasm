module classify;

import kernel;
import parseutil;
import walk;

import std.algorithm : canFind, map, sort;
import std.array : appender, array;
import std.digest.sha : sha1Of;
import std.file : read, readText;
import std.format : format;

enum Kind
{
    identical,   /// same text after newline normalize
    adapted,     /// both exist, different; keep libwasm body
    stubAdapt,   /// adapted and looks like a stub/shrink
    extra,       /// only in libwasm (e.g. core/sys/wasi)
    missing,     /// only in LDC — omitted kernel / not yet ported
}

string kindName(Kind k)
{
    final switch (k)
    {
    case Kind.identical: return "identical";
    case Kind.adapted: return "adapted";
    case Kind.stubAdapt: return "stub-adapt";
    case Kind.extra: return "extra";
    case Kind.missing: return "missing";
    }
}

struct FileRow
{
    string rel;
    Kind kind;
    KernelGroup group;
    string ldcPath;
    string oursPath;
    ulong ldcBytes;
    ulong oursBytes;
    ParseFacts ldcParse;
    ParseFacts oursParse;
    string action; /// generate: copy-ldc | copy-libwasm | omit
    string note;
}

struct Inventory
{
    FileRow[] rows;
    RelFile[] kernelRt; /// source/libwasm/rt
    string[] parseFailures;
}

private string digestOf(string text)
{
    import std.digest : toHexString;
    return sha1Of(cast(const(ubyte)[]) text).toHexString.idup;
}

Inventory classifyTrees(RelFile[] ldcFiles, RelFile[] oursFiles, RelFile[] kernelRt)
{
    Inventory inv;
    inv.kernelRt = kernelRt;

    bool[string] seen;
    foreach (lf; ldcFiles)
    {
        seen[lf.rel] = true;
        FileRow row;
        row.rel = lf.rel;
        row.ldcPath = lf.abs;
        row.group = classifyPath(lf.rel);
        auto ours = findRel(oursFiles, lf.rel);
        string ldcText;
        try
            ldcText = normalizeSource(readText(lf.abs));
        catch (Exception e)
            ldcText = "";
        row.ldcBytes = ldcText.length;
        row.ldcParse = parseDSource(ldcText, lf.rel);

        if (ours is null)
        {
            row.kind = Kind.missing;
            row.action = "omit";
            row.note = omitRationale(row.group);
            if (row.group == KernelGroup.ctfeKeep)
                row.note = "CTFE/SPA graph expected this — port or stub";
        }
        else
        {
            row.oursPath = ours.abs;
            string oursText;
            try
                oursText = normalizeSource(readText(ours.abs));
            catch (Exception e)
                oursText = "";
            row.oursBytes = oursText.length;
            row.oursParse = parseDSource(oursText, ours.rel);
            if (digestOf(ldcText) == digestOf(oursText))
            {
                row.kind = Kind.identical;
                row.action = "copy-ldc";
                row.note = "byte-identical after newline normalize; regenerate from LDC 1.36";
            }
            else
            {
                auto stub = looksStubbed(oursText, row.ldcBytes, row.oursBytes);
                row.kind = stub ? Kind.stubAdapt : Kind.adapted;
                row.action = "copy-libwasm";
                if (looksAdapted(row.oursParse, row.ldcParse))
                    row.note = "CRuntime_LIBWASM / WebAssembly adaptation";
                else if (stub)
                    row.note = "shrunk or stub-marked vs LDC 1.36";
                else
                    row.note = "content differs; keep current libwasm body";
            }
        }
        if (!row.ldcParse.parsed && row.ldcPath.length)
            inv.parseFailures ~= lf.rel ~ " (ldc): " ~ row.ldcParse.error;
        if (row.oursPath.length && !row.oursParse.parsed)
            inv.parseFailures ~= lf.rel ~ " (libwasm): " ~ row.oursParse.error;
        inv.rows ~= row;
    }

    foreach (of; oursFiles)
    {
        if (of.rel in seen)
            continue;
        FileRow row;
        row.rel = of.rel;
        row.oursPath = of.abs;
        row.group = classifyPath(of.rel);
        string oursText;
        try
            oursText = normalizeSource(readText(of.abs));
        catch (Exception e)
            oursText = "";
        row.oursBytes = oursText.length;
        row.oursParse = parseDSource(oursText, of.rel);
        row.kind = Kind.extra;
        row.action = "copy-libwasm";
        row.note = "libwasm-only (not in LDC 1.36 tree)";
        inv.rows ~= row;
    }
    inv.rows.sort!((a, b) => a.rel < b.rel);
    return inv;
}

struct Counts
{
    int identical, adapted, stubAdapt, extra, missing;
}

Counts countKinds(const FileRow[] rows)
{
    Counts c;
    foreach (r; rows)
    {
        final switch (r.kind)
        {
        case Kind.identical: c.identical++; break;
        case Kind.adapted: c.adapted++; break;
        case Kind.stubAdapt: c.stubAdapt++; break;
        case Kind.extra: c.extra++; break;
        case Kind.missing: c.missing++; break;
        }
    }
    return c;
}

struct GroupCount
{
    KernelGroup group;
    int missing;
    int adapted;
    int identical;
    int extra;
}

GroupCount[] countGroups(const FileRow[] rows)
{
    GroupCount[KernelGroup] m;
    foreach (g; __traits(allMembers, KernelGroup))
    {
        auto gg = mixin("KernelGroup." ~ g);
        m[gg] = GroupCount(gg);
    }
    foreach (r; rows)
    {
        final switch (r.kind)
        {
        case Kind.missing: m[r.group].missing++; break;
        case Kind.adapted:
        case Kind.stubAdapt: m[r.group].adapted++; break;
        case Kind.identical: m[r.group].identical++; break;
        case Kind.extra: m[r.group].extra++; break;
        }
    }
    return m.byValue.array.sort!((a, b) => a.group < b.group).array;
}

/// Upgrade map: LDC 1.42+ import/ vs current libwasm, using 1.36 as the baseline.
struct UpgradeRow
{
    string rel;
    string verdict; /// keep | rebase-from-new | reapply-adapt | stub-or-port | drop
    string note;
}

UpgradeRow[] upgradeMap(const FileRow[] base, RelFile[] newFiles)
{
    UpgradeRow[] outp;
    bool[string] inNew;
    foreach (nf; newFiles)
        inNew[nf.rel] = true;

    foreach (r; base)
    {
        UpgradeRow u;
        u.rel = r.rel;
        const present = (r.rel in inNew) !is null;
        if (r.kind == Kind.missing)
        {
            u.verdict = present ? "still-omit-or-stub" : "drop";
            u.note = omitRationale(r.group);
        }
        else if (r.kind == Kind.extra)
        {
            u.verdict = "keep";
            u.note = "libwasm-only; carry forward";
        }
        else if (r.kind == Kind.identical)
        {
            u.verdict = present ? "rebase-from-new" : "keep";
            u.note = present
                ? "was identical to 1.36; take newest LDC body and re-parse"
                : "disappeared upstream";
        }
        else
        {
            u.verdict = present ? "reapply-adapt" : "keep";
            u.note = present
                ? "re-apply CRuntime_LIBWASM / no-GC / no-ModuleInfo edits onto newest LDC"
                : "upstream dropped it; keep libwasm body";
        }
        outp ~= u;
    }
    foreach (nf; newFiles)
    {
        bool found;
        foreach (r; base)
            if (r.rel == nf.rel)
            {
                found = true;
                break;
            }
        if (found)
            continue;
        UpgradeRow u;
        u.rel = nf.rel;
        u.verdict = "stub-or-port";
        u.note = "new in newest LDC import/; frontend may require it — stub or port";
        u.note = omitRationale(classifyPath(nf.rel)) ~ "; " ~ u.note;
        outp ~= u;
    }
    outp.sort!((a, b) => a.rel < b.rel);
    return outp;
}

string[] missingByGroup(const FileRow[] rows, KernelGroup g)
{
    string[] s;
    foreach (r; rows)
        if (r.kind == Kind.missing && r.group == g)
            s ~= r.rel;
    return s;
}
