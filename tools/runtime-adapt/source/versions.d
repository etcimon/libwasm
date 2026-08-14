// Version ladder for carrying 1.36.0 libwasm adaptations onto N±n LDC stock.
// Pin is v1.36.0. Constraints are one closed interval per minor.

module versions;

import std.string : startsWith, strip;

/// Consecutive LDC minor tags. `--consecutive` walks adjacent pairs.
immutable string[] consecutiveTags = [
    "v1.30.0", "v1.31.0", "v1.32.0", "v1.33.0", "v1.34.0", "v1.35.0",
    "v1.36.0", "v1.37.0", "v1.38.0", "v1.39.0", "v1.40.0", "v1.41.0", "v1.42.0",
    "v1.43.0",
];

enum pinTag = "v1.36.0";
enum defaultVersionWindow = 12;

/// LDC 1.43+ implements wasm EH (`useWasmEH` / `ExceptionModel=Wasm`).
/// Carry emits exception-using Phobos (numeric, json, regex, …) on these
/// tags. 1.36 / 1.42 stay on the pre-EH omit set.
bool isEhCapableTag(string tag)
{
    auto t = tag.strip;
    if (!t.length)
        return false;
    if (t == "master" || t == "MASTER")
        return true;
    if (t.startsWith("v") || t.startsWith("V"))
        t = t[1 .. $];
    // 1.MINOR[.patch…]
    if (t.length < 3 || t[0] != '1' || t[1] != '.')
        return false;
    int minor;
    size_t i = 2;
    while (i < t.length && t[i] >= '0' && t[i] <= '9')
    {
        minor = minor * 10 + (t[i] - '0');
        ++i;
    }
    return i > 2 && minor >= 43;
}

string latestMinorTag()
{
    return consecutiveTags[$ - 1];
}

string[] tagWindow(size_t window = defaultVersionWindow, string latest = "")
{
    if (!window)
        return null;
    auto end = latest.length ? latest : latestMinorTag();
    size_t hi = size_t.max;
    foreach (i, t; consecutiveTags)
        if (t == end)
            hi = i;
    if (hi == size_t.max)
        return [end];
    auto lo = (hi + 1 >= window) ? hi + 1 - window : 0;
    return consecutiveTags[lo .. hi + 1].dup;
}

string[] tagRange(string from, string to)
{
    if (!from.length)
        from = consecutiveTags[0];
    if (!to.length)
        to = latestMinorTag();
    size_t lo = size_t.max, hi = size_t.max;
    foreach (i, t; consecutiveTags)
    {
        if (t == from)
            lo = i;
        if (t == to)
            hi = i;
    }
    if (lo == size_t.max || hi == size_t.max || lo > hi)
        return [from, to];
    return consecutiveTags[lo .. hi + 1].dup;
}

string tagToDirName(string tag)
{
    auto t = tag.strip;
    if (t.startsWith("v"))
        t = t[1 .. $];
    return "ldc-" ~ t;
}

unittest
{
    assert(consecutiveTags[6] == pinTag);
    assert(tagRange("v1.35.0", "v1.37.0") == ["v1.35.0", "v1.36.0", "v1.37.0"]);
    assert(!isEhCapableTag("v1.36.0"));
    assert(!isEhCapableTag("v1.42.0"));
    assert(isEhCapableTag("v1.43.0"));
    assert(isEhCapableTag("1.43.0-git-1218a47"));
    assert(isEhCapableTag("master"));
}
