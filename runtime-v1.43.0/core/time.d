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
