// Three-way compare: stock-N / generated (stock+splices) / pin (druntime-wasm 1.36).
//
//   match          generated == pin
//   adapt-delta    we changed stock the pin left as stock (over-splice)
//   missed-libwasm stock==generated, pin has a libwasm hunk we did not apply
//   text-diff      all three differ

module filecmp;

import std.array : split;

struct FileCmp
{
    string rel;
    string klass; /// match | adapt-delta | missed-libwasm | extra | missing | text-diff
    bool textsEqual;
    bool stockEqualsPin;
    bool stockEqualsGen;
    size_t genLen;
    size_t pinLen;
    size_t stockLen;
    int firstDiffLine;
    string genLine;
    string pinLine;
}

FileCmp classifyFile(string rel, string genTxt, string pinTxt, string stockTxt)
{
    FileCmp c;
    c.rel = rel;
    c.genLen = genTxt.length;
    c.pinLen = pinTxt.length;
    c.stockLen = stockTxt.length;
    c.textsEqual = genTxt.length && genTxt == pinTxt;
    c.stockEqualsPin = stockTxt.length && stockTxt == pinTxt;
    c.stockEqualsGen = stockTxt.length && stockTxt == genTxt;
    firstHunk(genTxt, pinTxt, c.firstDiffLine, c.genLine, c.pinLine);
    if (c.textsEqual)
        c.klass = "match";
    else if (!genTxt.length)
        c.klass = "missing";
    else if (!pinTxt.length)
        c.klass = "extra";
    else if (c.stockEqualsPin && !c.stockEqualsGen)
        c.klass = "adapt-delta";
    else if (c.stockEqualsGen && !c.stockEqualsPin)
        c.klass = "missed-libwasm";
    else
        c.klass = "text-diff";
    return c;
}

void firstHunk(string a, string b, ref int line, ref string al, ref string bl)
{
    auto la = a.split("\n");
    auto lb = b.split("\n");
    auto n = la.length < lb.length ? la.length : lb.length;
    foreach (i; 0 .. n)
    {
        if (la[i] != lb[i])
        {
            line = cast(int)(i + 1);
            al = clip(la[i], 80);
            bl = clip(lb[i], 80);
            return;
        }
    }
    if (la.length != lb.length)
        line = cast(int) n + 1;
}

private string clip(string s, size_t n)
{
    return s.length <= n ? s : s[0 .. n] ~ "…";
}

string renderFileCmp(const FileCmp[] cmps, string tag)
{
    import std.array : appender;
    import std.format : format;
    int match, missed, delta, extra, missing, diff;
    foreach (c; cmps)
    {
        if (c.klass == "match")
            match++;
        else if (c.klass == "missed-libwasm")
            missed++;
        else if (c.klass == "adapt-delta")
            delta++;
        else if (c.klass == "extra")
            extra++;
        else if (c.klass == "missing")
            missing++;
        else
            diff++;
    }
    auto buf = appender!string();
    buf.put(format("# FILE-CMP %s — generated vs pin druntime-wasm\n\n", tag));
    buf.put(format("- match %s  missed-libwasm %s  adapt-delta %s  extra %s  missing %s  text-diff %s\n\n",
        match, missed, delta, extra, missing, diff));
    buf.put("| path | class | gen | pin | first hunk |\n");
    buf.put("|---|---|---:|---:|---|\n");
    foreach (c; cmps)
    {
        if (c.klass == "match")
            continue;
        buf.put(format("| `%s` | %s | %s | %s | L%s |\n",
            c.rel, c.klass, c.genLen, c.pinLen, c.firstDiffLine));
    }
    return buf.data;
}
