/++
Timestamp
+/
module mir.timestamp;

private alias isDigit = (dchar c) => uint(c - '0') < 10;
import mir.serde: serdeIgnore, serdeRegister;

version(D_Exceptions)
///
class DateTimeException : Exception
{
    ///
    @nogc @safe pure nothrow this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable nextInChain = null)
    {
        super(msg, file, line, nextInChain);
    }

    /// ditto
    @nogc @safe pure nothrow this(string msg, Throwable nextInChain, string file = __FILE__, size_t line = __LINE__)
    {
        super(msg, file, line, nextInChain);
    }
}

version(D_Exceptions)
{
    private static immutable InvalidMonth = new DateTimeException("Timestamp: Invalid Month");
    private static immutable InvalidDay = new DateTimeException("Timestamp: Invalid Day");
    private static immutable InvalidISOString = new DateTimeException("Timestamp: Invalid ISO String");
    private static immutable InvalidISOExtendedString = new DateTimeException("Timestamp: Invalid ISO Extended String");
    private static immutable InvalidYamlString = new DateTimeException("Timestamp: Invalid YAML String");
    private static immutable InvalidString = new DateTimeException("Timestamp: Invalid String");
    private static immutable ExpectedDuration = new DateTimeException("Timestamp: Expected Duration");
}

/++
Timestamp

Note: The component values in the binary encoding are always in UTC or local time with unknown offset,
while components in the text encoding are in a some timezone with known offset.
This means that transcoding requires a conversion between UTC and a timezone.

`Timestamp` precision is up to picosecond (second/10^12).
+/
@serdeRegister
struct Timestamp
{
    import std.traits: isSomeChar;

    ///
    enum Precision : ubyte
    {
        ///
        year,
        ///
        month,
        ///
        day,
        ///
        minute,
        ///
        second,
        ///
        fraction,
    }

@serdeIgnore:

    ///
    this(scope const(char)[] str) @safe pure @nogc
    {
        this = fromString(str);
    }

    ///
    version (mir_test)
    @safe pure @nogc unittest
    {
        assert(Timestamp("2010-07-04") == Timestamp(2010, 7, 4));
        assert(Timestamp("20100704") == Timestamp(2010, 7, 4));
        assert(Timestamp(2021, 01, 29, 12, 42, 44).withOffset(7 * 60 + 30) == Timestamp.fromISOString("20210129T201244+0730"));
        static assert(Timestamp(2021, 01, 29,  4, 42, 44).withOffset(- (7 * 60 + 30)) == Timestamp.fromISOExtString("2021-01-28T21:12:44-07:30"));

        assert(Timestamp("T0740") == Timestamp.onlyTime(7, 40));
        assert(Timestamp("T074030Z") == Timestamp.onlyTime(7, 40, 30).withOffset(0));
        assert(Timestamp("T074030.056") == Timestamp.onlyTime(7, 40, 30, -3, 56));

        assert(Timestamp("07:40") == Timestamp.onlyTime(7, 40));
        assert(Timestamp("07:40:30") == Timestamp.onlyTime(7, 40, 30));
        assert(Timestamp("T07:40:30.056Z") == Timestamp.onlyTime(7, 40, 30, -3, 56).withOffset(0));
    }

    private short _offset = short.min;

    /++
    If the time in UTC is known, but the offset to local time is unknown, this can be represented with an offset of “-00:00”.
    This differs semantically from an offset of “Z” or “+00:00”, which imply that UTC is the preferred reference point for the specified time.
    RFC2822 describes a similar convention for email.
    +/
    /++
    Timezone offset in minutes
    +/
    short offset()() const @safe pure nothrow @nogc @property
    {
        return isLocalTime ? 0 : _offset;
    }

    ///
    void offset()(ushort offset) @safe pure nothrow @nogc @property
    {
        _offset = offset;
    }

    /++
    Returns: true if it is a local time
    +/
    bool isLocalTime()() const @safe pure nothrow @nogc @property
    {
        return _offset == _offset.min;
    }

    /++
    +/
    void setLocalTimezone()() @safe pure nothrow @nogc @property
    {
        _offset = _offset.min;
    }


    /++
    Year
    +/
    short year;
    /++
    +/
    Precision precision;

    /++
    Month
    
    If the value equals to thero then this and all the following members are undefined.
    +/
    ubyte month;
    /++
    Day
    
    If the value equals to thero then this and all the following members are undefined.
    +/
    ubyte day;
    /++
    Hour
    +/
    ubyte hour;

    version(D_Ddoc)
    {
    
        /++
        Minute

        Note: the field is implemented as property.
        +/
        ubyte minute;
        /++
        Second

        Note: the field is implemented as property.
        +/
        ubyte second;
        /++
        Fraction

        The `fractionExponent` and `fractionCoefficient` denote the fractional seconds of the timestamp as a decimal value
        The fractional seconds’ value is `coefficient * 10 ^ exponent`.
        It must be greater than or equal to zero and less than 1.
        A missing coefficient defaults to zero.
        Fractions whose coefficient is zero and exponent is greater than -1 are ignored.
        
        'fractionCoefficient' allowed values are [0 ... 10^12-1].
        'fractionExponent' allowed values are [-12 ... 0].

        Note: the fields are implemented as property.
        +/
        byte fractionExponent;
        /// ditto
        ulong fractionCoefficient;
    }
    else
    {
        import mir.bitmanip: bitfields;
        version (LittleEndian)
        {

            mixin(bitfields!(
                    ubyte, "minute", 8,
                    ubyte, "second", 8,
                    byte, "fractionExponent", 8,
                    ulong, "fractionCoefficient", 40,
            ));
        }
        else
        {
            mixin(bitfields!(
                    ulong, "fractionCoefficient", 40,
                    byte, "fractionExponent", 8,
                    ubyte, "second", 8,
                    ubyte, "minute", 8,
            ));
        }
    }

    ///
    @safe pure nothrow @nogc
    this(short year)
    {
        this.year = year;
        this.precision = Precision.year;
    }

    ///
    @safe pure nothrow @nogc
    this(short year, ubyte month)
    {
        this.year = year;
        this.month = month;
        this.precision = Precision.month;
    }

    ///
    @safe pure nothrow @nogc
    this(short year, ubyte month, ubyte day)
    {
        this.year = year;
        this.month = month;
        this.day = day;
        this.precision = Precision.day;
    }

    ///
    @safe pure nothrow @nogc
    this(short year, ubyte month, ubyte day, ubyte hour, ubyte minute)
    {
        this.year = year;
        this.month = month;
        this.day = day;
        this.hour = hour;
        this.minute = minute;
        this.precision = Precision.minute;
    }

    ///
    @safe pure nothrow @nogc
    this(short year, ubyte month, ubyte day, ubyte hour, ubyte minute, ubyte second)
    {
        this.year = year;
        this.month = month;
        this.day = day;
        this.hour = hour;
        this.day = day;
        this.minute = minute;
        this.second = second;
        this.precision = Precision.second;
    }

    ///
    @safe pure nothrow @nogc
    this(short year, ubyte month, ubyte day, ubyte hour, ubyte minute, ubyte second, byte fractionExponent, ulong fractionCoefficient)
    {
        this.year = year;
        this.month = month;
        this.day = day;
        this.hour = hour;
        this.day = day;
        this.minute = minute;
        this.second = second;
        assert(fractionExponent < 0);
        this.fractionExponent = fractionExponent;
        this.fractionCoefficient = fractionCoefficient;
        this.precision = Precision.fraction;
    }

    ///
    @safe pure nothrow @nogc
    static Timestamp onlyTime(ubyte hour, ubyte minute)
    {
        return Timestamp(0, 0, 0, hour, minute);
    }

    ///
    @safe pure nothrow @nogc
    static Timestamp onlyTime(ubyte hour, ubyte minute, ubyte second)
    {
        return Timestamp(0, 0, 0, hour, minute, second);
    }

    ///
    @safe pure nothrow @nogc
    static Timestamp onlyTime(ubyte hour, ubyte minute, ubyte second, byte fractionExponent, ulong fractionCoefficient)
    {
        return Timestamp(0, 0, 0, hour, minute, second, fractionExponent, fractionCoefficient);
    }

    ///
    this(Date)(const Date datetime)
        if (Date.stringof == "Date" || Date.stringof == "date")
    {
        static if (__traits(hasMember, Date, "yearMonthDay"))
            with(datetime.yearMonthDay) this(year, cast(ubyte)month, day);
        else
            with(datetime) this(year, month, day);
    }

    ///
    version (mir_test)
    @safe unittest {
        import mir.date : Date;
        auto dt = Date(1982, 4, 1);
        Timestamp ts = dt;
        assert(ts.opCmp(ts) == 0);
        assert(dt.toISOExtString == ts.toString);
        assert(dt == cast(Date) ts);
    }

    ///
    version (mir_test)
    @safe unittest {
        import std.datetime.date : Date;
        auto dt = Date(1982, 4, 1);
        Timestamp ts = dt;
        assert(dt.toISOExtString == ts.toString);
        assert(dt == cast(Date) ts);
    }

    ///
    this(TimeOfDay)(const TimeOfDay timeOfDay)
        if (TimeOfDay.stringof == "TimeOfDay")
    {
        with(timeOfDay) this = onlyTime(hour, minute, second);
    }

    ///
    version (mir_test)
    @safe unittest {
        import mir.test: should;
        import std.datetime.date : TimeOfDay;
        auto dt = TimeOfDay(7, 14, 30);
        Timestamp ts = dt;
        (dt.toISOExtString ~ "-00:00").should == ts.toString;
        assert(dt == cast(TimeOfDay) ts);
    }

    ///
    this(DateTime)(const DateTime datetime)
        if (DateTime.stringof == "DateTime")
    {
        with(datetime) this(year, cast(ubyte)month, day, hour, minute, second);
    }

    ///
    version (mir_test)
    @safe unittest {
        import std.datetime.date : DateTime;
        auto dt = DateTime(1982, 4, 1, 20, 59, 22);
        Timestamp ts = dt;
        assert(dt.toISOExtString ~ "-00:00" == ts.toString);
        assert(dt == cast(DateTime) ts);
    }

    ///
    this(SysTime)(const SysTime systime) pure
        if (SysTime.stringof == "SysTime")
    {
        import std.datetime.timezone : LocalTime;
        auto offset = assumePureSafe(()=>systime.utcOffset)();
        auto isLocal = systime.timezone is LocalTime();
        auto thisTimes = isLocal ? systime + offset : systime.toUTC;
        this = fromUnixTime(thisTimes.toUnixTime);
        this.fractionExponent = -7;
        this.fractionCoefficient = assumePureSafe(()=>thisTimes.fracSecs)().total!"hnsecs";
        this.precision = Precision.fraction;
        if (!isLocal)
           this.offset = cast(short) offset.total!"minutes";
    }

    ///
    version (mir_test)
    @safe unittest {
        import core.time : hnsecs, minutes;
        import std.datetime.date : DateTime;
        import std.datetime.timezone : SimpleTimeZone;
        import std.datetime.systime : SysTime;

        auto dt = DateTime(1982, 4, 1, 20, 59, 22);
        auto tz = new immutable SimpleTimeZone(-330.minutes);
        auto st = SysTime(dt, 1234567.hnsecs, tz);
        Timestamp ts = st;

        assert(st.toISOExtString == ts.toString);
        assert(st == cast(SysTime) ts);
    }

    /++
    Creates a fake timestamp from a Duration using `total!"hnsecs"` method.
    For positive and zero timestamps the format is
        `wwww-dd-88Thh:mm:ss.nnnnnnn`
        and for negative timestamps
        `wwww-dd-99Thh:mm:ss.nnnnnnn`.
    +/
    this(Duration)(const Duration duration)
        if (Duration.stringof == "Duration")
    {
        auto hnsecs = duration.total!"hnsecs";
        ulong abs = hnsecs < 0 ? -hnsecs : hnsecs;
        precision = Precision.fraction;
        day = hnsecs >= 0 ? 88 : 99;
        fractionExponent = -7;
        fractionCoefficient = abs % 10_000_000U;
        abs /= 10_000_000U;
        second = abs % 60;
        abs /= 60;
        minute = abs % 60;
        abs /= 60;
        hour = abs % 24;
        abs /= 24;
        month = abs % 7;
        abs /= 7;
        year = cast(typeof(year)) abs;
    }

    ///
    version (mir_test)
    @safe unittest {
        import core.time : Duration, weeks, days, hours, minutes, seconds, hnsecs;

        auto duration = 5.weeks + 2.days + 7.hours + 40.minutes + 4.seconds + 9876543.hnsecs;
        Timestamp ts = duration;

        assert(ts.toISOExtString == `0005-02-88T07:40:04.9876543-00:00`);
        assert(duration == cast(Duration) ts);

        duration = -duration;
        ts = Timestamp(duration);
        assert(ts.toISOExtString == `0005-02-99T07:40:04.9876543-00:00`);
        assert(duration == cast(Duration) ts);

        assert(Timestamp(Duration.zero).toISOExtString == `0000-00-88T00:00:00.0000000-00:00`);
    }

    /++
    Decomposes Timestamp to an algebraic type.
    Supported types up to T.stringof equivalence:

    $(UL
    $(LI `Year`)
    $(LI `YearMonth`)
    $(LI `YearMonthDay`)
    $(LI `Date`)
    $(LI `date`)
    $(LI `TimeOfDay`)
    $(LI `DateTime`)
    $(LI `SysTime`)
    $(LI `Timestamp` as fallback type)
    )


    Throws: an exception if timestamp cannot be converted to an algebraic type and there is no `Timestamp` type in the Algebraic set.
    +/
    T opCast(T)() const
        if (__traits(hasMember, T, "AllowedTypes"))
    {
        foreach (AT; T.AllowedTypes)
            static if (AT.stringof == "Year")
                if (precision == precision.year)
                    return T(opCast!AT);

        foreach (AT; T.AllowedTypes)
            static if (AT.stringof == "YearMonth")
                if (precision == precision.month)
                    return T(opCast!AT);

        foreach (AT; T.AllowedTypes)
            static if (AT.stringof == "Duration")
                if (isDuration)
                    return T(opCast!AT);

        foreach (AT; T.AllowedTypes)
            static if (AT.stringof == "YearMonthDay" || AT.stringof == "Date" ||  AT.stringof == "date")
                if (precision == precision.day)
                    return T(opCast!AT);

        foreach (AT; T.AllowedTypes)
            static if (AT.stringof == "TimeOfDay")
                if (isOnlyTime)
                    return T(opCast!AT);

        if (!isOnlyTime && precision >= precision.day)
        {
            foreach (AT; T.AllowedTypes)
                static if (AT.stringof == "DateTime")
                    if (offset == 0 && precision <= precision.second)
                        return T(opCast!AT);

            foreach (AT; T.AllowedTypes)
                static if (AT.stringof == "SysTime")
                    return T(opCast!AT);
        }

        import std.meta: staticIndexOf;
        static if (staticIndexOf!(Timestamp, T.AllowedTypes) < 0)
        {
            static immutable exc = new Exception("Cannot cast Timestamp to " ~ T.stringof);
            throw exc;
        }
        else
        {
            return T(this);
        }
    }

    ///
    version (mir_test)
    @safe unittest
    {
        import core.time : hnsecs, minutes, Duration;
        import mir.algebraic;
        import mir.date: Date; // Can be other Date type as well
        import std.datetime.date : TimeOfDay, DateTime;
        import std.datetime.systime : SysTime;
        import std.datetime.timezone: UTC, SimpleTimeZone;

        alias A = Variant!(Date, TimeOfDay, DateTime, Duration, SysTime, Timestamp, string); // non-date-time types is OK
        assert(cast(A) Timestamp(1023) == Timestamp(1023)); // Year isn't represented in the algebraic, use fallback type
        assert(cast(A) Timestamp.onlyTime(7, 40, 30) == TimeOfDay(7, 40, 30));
        assert(cast(A) Timestamp(1982, 4, 1, 20, 59, 22) == DateTime(1982, 4, 1, 20, 59, 22));

        auto dt = DateTime(1982, 4, 1, 20, 59, 22);
        auto tz = new immutable SimpleTimeZone(-330.minutes);
        auto st = SysTime(dt, 1234567.hnsecs, tz);
        assert(cast(A) Timestamp(st) == st);
    }

    /++
    Casts timestamp to a date-time type.

    Supported types up to T.stringof equivalence:

    $(UL
    $(LI `Year`)
    $(LI `YearMonth`)
    $(LI `YearMonthDay`)
    $(LI `Date`)
    $(LI `date`)
    $(LI `TimeOfDay`)
    $(LI `DateTime`)
    $(LI `SysTime`)
    )
    +/
    T opCast(T)() const
        if (
            T.stringof == "Year"
         || T.stringof == "YearMonth"
         || T.stringof == "YearMonthDay"
         || T.stringof == "Date"
         || T.stringof == "date"
         || T.stringof == "TimeOfDay"
         || T.stringof == "Duration"
         || T.stringof == "DateTime"
         || T.stringof == "SysTime")
    {
        static if (T.stringof == "YearMonth")
        {
            return T(year, month);
        }
        else
        static if (T.stringof == "Date" || T.stringof == "date" || T.stringof == "YearMonthDay")
        {
            return T(year, month, day);
        }
        else
        static if (T.stringof == "DateTime")
        {
            return T(year, month, day, hour, minute, second);
        }
        else
        static if (T.stringof == "TimeOfDay")
        {
            return T(hour, minute, second);
        }
        else
        static if (T.stringof == "SysTime")
        {
            import core.time : hnsecs, minutes;
            import std.datetime.date: DateTime;
            import std.datetime.systime: SysTime;
            import std.datetime.timezone: UTC, LocalTime, SimpleTimeZone;
            auto ret = SysTime.fromUnixTime(toUnixTime, UTC()) + getFraction!7.hnsecs;
            if (isLocalTime)
            {
                ret = ret.toLocalTime;
                ret -= assumePureSafe(()=>ret.utcOffset)();
            }
            else
            if (offset)
            {
                ret.timezone = new immutable SimpleTimeZone(offset.minutes);
            }
            return ret;
        }
        else
        static if (T.stringof == "Duration")
        {
            if (!isDuration)
                throw ExpectedDuration;
            auto coeff = ((((long(year) * 7 + month) * 24 + hour) * 60 + minute) * 60 + second) * 10_000_000 + getFraction!7;
            if (isNegativeDuration)
                coeff = -coeff;

            import mir.conv: to;
            import core.time: hnsecs;
            return coeff.hnsecs.to!T;
        }
    }

    /++
    +/
    long getFraction(int digits)() @property const @safe pure nothrow @nogc
        if (digits >= 1 && digits <= 12)
    {
        long coeff;
        if (fractionCoefficient)
        {
            coeff = fractionCoefficient;
            int exp = fractionExponent;
            while (exp > -digits)
            {
                exp--;
                coeff *= 10;
            }
            while (exp < -digits)
            {
                exp++;
                coeff /= 10;
            }
        }
        return coeff;
    }

    /++
    Returns: true if timestamp represent a time only value.
    +/
    bool isOnlyTime() @property const @safe pure nothrow @nogc
    {
        return precision > Precision.day && day == 0;
    }

    ///
    int opCmp(Timestamp rhs) const @safe pure nothrow @nogc
    {
        import std.meta: AliasSeq;
        static foreach (member; [
            "year",
            "month",
            "day",
            "hour",
            "minute",
            "second",
        ])
            if (auto d = int(__traits(getMember, this, member)) - int(__traits(getMember, rhs, member)))
                return d;
        int frel = this.fractionExponent;
        int frer = rhs.fractionExponent;
        ulong frcl = this.fractionCoefficient;
        ulong frcr = rhs.fractionCoefficient;
        while(frel > frer)
        {
            frel--;
            frcl *= 10;
        }
        while(frer > frel)
        {
            frer--;
            frcr *= 10;
        }
        if (frcl < frcr) return -1;
        if (frcl > frcr) return +1;
        if (auto d = int(this.fractionExponent) - int(rhs.fractionExponent))
            return d;
        return int(this.offset) - int(rhs.offset);
    }

    /++
    Attaches local offset, doesn't adjust other fields.
    Local-time offsets may be represented as either `hour*60+minute` offsets from UTC,
    or as the zero to denote a local time of UTC. They are required on timestamps with time and are not allowed on date values.
    +/
    @safe pure nothrow @nogc const
    Timestamp withOffset(short minutes)
    {
        assert(-24 * 60 <= minutes && minutes <= 24 * 60, "Offset absolute value should be less or equal to 24 * 60");
        assert(precision >= Precision.minute, "Offsets are not allowed on date values.");
        Timestamp ret = this;
        ret.offset = minutes;
        return ret;
    }

    version(D_BetterC){} else
    private string toStringImpl(alias fun)() const @safe pure nothrow
    {
        import mir.appender: UnsafeArrayBuffer;
        char[64] buffer = void;
        auto w = UnsafeArrayBuffer!char(buffer);
        fun(w);
        return w.data.idup;
    }

    /++
    Converts this $(LREF Timestamp) to a string with the format `yyyy-mm-ddThh:mm:ss[.mmm]±hh:mm`.

    If `w` writer is set, the resulting string will be written directly
    to it.

    Returns:
        A `string` when not using an output range; `void` otherwise.
    +/
    alias toString = toISOExtString;

    ///
    version (mir_test)
    @safe pure nothrow unittest
    {
        import mir.test;
        Timestamp.init.toString.should == "0000T";
        Timestamp(2010, 7, 4).toString.should == "2010-07-04";
        Timestamp(1998, 12, 25).toString.should == "1998-12-25";
        Timestamp(0, 1, 5).toString.should == "0000-01-05";
        Timestamp(-4, 1, 5).toString.should == "-0004-01-05";

        // yyyy-mm-ddThh:mm:ss[.mmm]±hh:mm
        Timestamp(2021).toString.should == "2021T";
        Timestamp(2021, 01).toString.should == "2021-01T";
        Timestamp(2021, 01, 29).toString.should == "2021-01-29";
        Timestamp(2021, 01, 29, 19, 42).withOffset(0).toString.should == "2021-01-29T19:42Z";
        Timestamp(2021, 01, 29, 12, 42, 44).withOffset(7 * 60).toString.should == "2021-01-29T19:42:44+07";
        Timestamp(2021, 01, 29, 12, 42, 44).withOffset(7 * 60 + 30).toString.should == "2021-01-29T20:12:44+07:30";

        Timestamp.onlyTime(7, 40).toString.should == "07:40-00:00";
        Timestamp.onlyTime(7, 40, 30).toString.should == "07:40:30-00:00";
        Timestamp.onlyTime(7, 40, 30, -3, 56).withOffset(0).toString.should == "07:40:30.056Z";
    }

    ///
    version (mir_test)
    @safe unittest
    {
        // Test A.D.
        assert(Timestamp(9, 12, 4).toISOExtString == "0009-12-04");
        assert(Timestamp(99, 12, 4).toISOExtString == "0099-12-04");
        assert(Timestamp(999, 12, 4).toISOExtString == "0999-12-04");
        assert(Timestamp(9999, 7, 4).toISOExtString == "9999-07-04");
        assert(Timestamp(10000, 10, 20).toISOExtString == "+10000-10-20");

        // Test B.C.
        assert(Timestamp(0, 12, 4).toISOExtString == "0000-12-04");
        assert(Timestamp(-9, 12, 4).toISOExtString == "-0009-12-04");
        assert(Timestamp(-99, 12, 4).toISOExtString == "-0099-12-04");
        assert(Timestamp(-999, 12, 4).toISOExtString == "-0999-12-04");
        assert(Timestamp(-9999, 7, 4).toISOExtString == "-9999-07-04");
        assert(Timestamp(-10000, 10, 20).toISOExtString == "-10000-10-20");

        assert(Timestamp.onlyTime(7, 40).toISOExtString == "07:40-00:00");
        assert(Timestamp.onlyTime(7, 40, 30).toISOExtString == "07:40:30-00:00");
        assert(Timestamp.onlyTime(7, 40, 30, -3, 56).toISOExtString == "07:40:30.056-00:00");

        const cdate = Timestamp(1999, 7, 6);
        immutable idate = Timestamp(1999, 7, 6);
        assert(cdate.toISOExtString == "1999-07-06");
        assert(idate.toISOExtString == "1999-07-06");
    }

    /// ditto
    alias toISOExtString = toISOStringImp!true;

    /++
    Converts this $(LREF Timestamp) to a string with the format `YYYYMMDDThhmmss±hhmm`.

    If `w` writer is set, the resulting string will be written directly
    to it.

    Returns:
        A `string` when not using an output range; `void` otherwise.
    +/
    alias toISOString = toISOStringImp!false;

    ///
    version (mir_test)
    @safe pure nothrow unittest
    {
        import mir.test;
        Timestamp.init.toISOString.should == "0000T";
        Timestamp(2010, 7, 4).toISOString.should == "20100704";
        Timestamp(1998, 12, 25).toISOString.should == "19981225";
        Timestamp(0, 1, 5).toISOString.should == "00000105";
        Timestamp(-4, 1, 5).toISOString.should == "-00040105";

        // YYYYMMDDThhmmss±hhmm
        Timestamp(2021).toISOString.should == "2021T";
        Timestamp(2021, 01).toISOString.should == "2021-01T"; // always extended
        Timestamp(2021, 01, 29).toISOString.should == "20210129";
        Timestamp(2021, 01, 29, 19, 42).toISOString.should == "20210129T1942";
        Timestamp(2021, 01, 29, 12, 42, 44).withOffset(7 * 60).toISOString.should == "20210129T194244+07";
        Timestamp(2021, 01, 29, 12, 42, 44).withOffset(7 * 60 + 30).toISOString.should == "20210129T201244+0730";
        static assert(Timestamp(2021, 01, 29, 12, 42, 44).withOffset(7 * 60 + 30).toISOString == "20210129T201244+0730");

        assert(Timestamp.onlyTime(7, 40).toISOString == "T0740");
        assert(Timestamp.onlyTime(7, 40, 30).toISOString == "T074030");
        assert(Timestamp.onlyTime(7, 40, 30, -3, 56).toISOString == "T074030.056");
    }

    ///
    long toUnixTime() const @safe pure nothrow @nogc
    {
        import mir.date: Date;
        long result;
        if (!isDuration && !isOnlyTime)
        {
            enum fistDay = Date.trustedCreate(1970, 1, 1);
            result = Date.trustedCreate(year, month ? month : 1, day ? day : 1) - fistDay;
            result *= 24;
        }
        result += hour;
        result *= 60;
        result += minute;
        result *= 60;
        result += second;
        return result;
    }

    ///
    version(mir_test)
    @safe pure nothrow @nogc unittest
    {
        assert(Timestamp(1970, 1, 1).toUnixTime == 0);
        assert(Timestamp(2007, 12, 22, 8, 14, 45).toUnixTime == 1_198_311_285);
        assert(Timestamp(2007, 12, 22, 8, 14, 45).withOffset(90).toUnixTime == 1_198_311_285);
        assert(Timestamp(1969, 12, 31, 23, 59, 59).toUnixTime == -1);
    }

    ///
    static Timestamp fromUnixTime(long time) @safe pure nothrow @nogc
    {
        import mir.date: Date;
        auto days = time / (24 * 60 * 60); 
        time -= days * (24 * 60 * 60);
        if (time < 0)
        {
            days--;
            time += 24 * 60 * 60;
        }
        assert(time >= 0);
        auto second = time % 60;
        time /= 60;
        auto minute = time % 60;
        time /= 60;
        auto hour = cast(ubyte) time;
        enum fistDay = Date.trustedCreate(1970, 1, 1);
        with((fistDay + cast(int)days).yearMonthDay)
            return Timestamp(year, cast(ubyte)month, day, hour, cast(ubyte)minute, cast(ubyte)second);
    }

    ///
    version(mir_test)
    @safe pure nothrow @nogc unittest
    {
        import mir.format;
        assert(Timestamp.fromUnixTime(0) == Timestamp(1970, 1, 1, 0, 0, 0));
        assert(Timestamp.fromUnixTime(1_198_311_285) == Timestamp(2007, 12, 22, 8, 14, 45));
        assert(Timestamp.fromUnixTime(-1) == Timestamp(1969, 12, 31, 23, 59, 59));
    }

    /// Helpfer for time zone offsets
    void addMinutes(short minutes) @safe pure nothrow @nogc
    {
        int totalMinutes = minutes + (this.minute + this.hour * 60u);
        auto h = totalMinutes / 60;

        int dayShift;

        while (totalMinutes < 0)
        {
            totalMinutes += 24 * 60;
            dayShift--;
        }

        while (totalMinutes >= 24 * 60)
        {
            totalMinutes -= 24 * 60;
            dayShift++;
        }

        if (dayShift)
        {
            import mir.date: Date;
            auto ymd = (Date.trustedCreate(year, month, day) + dayShift).yearMonthDay;
            year = ymd.year;
            month = cast(ubyte)ymd.month;
            day = ymd.day;
        }

        hour = cast(ubyte) (totalMinutes / 60);
        minute = cast(ubyte) (totalMinutes % 60);
    }

    template toISOStringImp(bool ext)
    {
        version(D_BetterC){} else
        string toISOStringImp() const @safe pure nothrow
        {
            return toStringImpl!toISOStringImp;
        }

        /// ditto
        void toISOStringImp(W)(ref scope W w) const scope
            // if (isOutputRange!(W, char))
        {
            import mir.format: printZeroPad;
            // yyyy-mm-ddThh:mm:ss[.mmm]±hh:mm
            Timestamp t = this;

            if (t.offset)
            {
                assert(-24 * 60 <= t.offset && t.offset <= 24 * 60, "Offset absolute value should be less or equal to 24 * 60");
                assert(precision >= Precision.minute, "Offsets are not allowed on date values.");
                t.addMinutes(t.offset);
            }

            if (!t.isOnlyTime)
            {
                if (t.year >= 10_000)
                    w.put('+');
                printZeroPad(w, t.year, t.year >= 0 ? t.year < 10_000 ? 4 : 5 : t.year > -10_000 ? 5 : 6);
                if (precision == Precision.year)
                {
                    w.put('T');
                    return;
                }
                if (ext || precision == Precision.month) w.put('-');

                printZeroPad(w, cast(uint)t.month, 2);
                if (precision == Precision.month)
                {
                    w.put('T');
                    return;
                }
                static if (ext) w.put('-');

                printZeroPad(w, t.day, 2);
                if (precision == Precision.day)
                    return;
            }

            if (!ext || !t.isOnlyTime)
                w.put('T');

            printZeroPad(w, t.hour, 2);
            static if (ext) w.put(':');
            printZeroPad(w, t.minute, 2);

            if (precision >= Precision.second)
            {
                static if (ext) w.put(':');
                printZeroPad(w, t.second, 2);

                if (precision > Precision.second && (t.fractionExponent < 0 || t.fractionCoefficient))
                {
                    w.put('.');
                    printZeroPad(w, t.fractionCoefficient, -int(t.fractionExponent));
                }
            }

            if (t.isLocalTime)
            {
                static if (ext)
                    w.put("-00:00");
                return;
            }

            if (t.offset == 0)
            {
                w.put('Z');
                return;
            }

            bool sign = t.offset < 0;
            uint absoluteOffset = !sign ? t.offset : -int(t.offset);
            uint offsetHour = absoluteOffset / 60u;
            uint offsetMinute = absoluteOffset % 60u;

            w.put(sign ? '-' : '+');
            printZeroPad(w, offsetHour, 2);
            if (offsetMinute)
            {
                static if (ext) w.put(':');
                printZeroPad(w, offsetMinute, 2);
            }
        }
    }

    /++
    Creates a $(LREF Timestamp) from a string with the format `YYYYMMDDThhmmss±hhmm
    or its leading part allowed by the standard.

    or its leading part allowed by the standard.

    Params:
        str = A string formatted in the way that $(LREF .Timestamp.toISOExtString) formats dates.
        value = (optional) result value.

    Throws:
        $(LREF DateTimeException) if the given string is
        not in the correct format. Two arguments overload is `nothrow`.
    Returns:
        `bool` on success for two arguments overload, and the resulting timestamp for single argument overdload.
    +/
    alias fromISOString = fromISOStringImpl!false;

    ///
    version (mir_test)
    @safe unittest
    {
        assert(Timestamp.fromISOString("20100704") == Timestamp(2010, 7, 4));
        assert(Timestamp.fromISOString("19981225") == Timestamp(1998, 12, 25));
        assert(Timestamp.fromISOString("00000105") == Timestamp(0, 1, 5));
        // assert(Timestamp.fromISOString("-00040105") == Timestamp(-4, 1, 5));

        assert(Timestamp(2021) == Timestamp.fromISOString("2021"));
        assert(Timestamp(2021) == Timestamp.fromISOString("2021T"));
        // assert(Timestamp(2021, 01) == Timestamp.fromISOString("2021-01"));
        // assert(Timestamp(2021, 01) == Timestamp.fromISOString("2021-01T"));
        assert(Timestamp(2021, 01, 29) == Timestamp.fromISOString("20210129"));
        assert(Timestamp(2021, 01, 29, 19, 42) == Timestamp.fromISOString("20210129T1942"));
        assert(Timestamp(2021, 01, 29, 19, 42).withOffset(0) == Timestamp.fromISOString("20210129T1942Z"));
        assert(Timestamp(2021, 01, 29, 19, 42, 12) == Timestamp.fromISOString("20210129T194212"));
        assert(Timestamp(2021, 01, 29, 19, 42, 12, -3, 67).withOffset(0) == Timestamp.fromISOString("20210129T194212.067Z"));
        assert(Timestamp(2021, 01, 29, 12, 42, 44).withOffset(7 * 60) == Timestamp.fromISOString("20210129T194244+07"));
        assert(Timestamp(2021, 01, 29, 12, 42, 44).withOffset(7 * 60 + 30) == Timestamp.fromISOString("20210129T201244+0730"));
        static assert(Timestamp(2021, 01, 29, 12, 42, 44).withOffset(7 * 60 + 30) == Timestamp.fromISOString("20210129T201244+0730"));
        static assert(Timestamp(2021, 01, 29,  4, 42, 44).withOffset(- (7 * 60 + 30)) == Timestamp.fromISOString("20210128T211244-0730"));
    }

    version (mir_test)
    @safe unittest
    {
        import std.exception: assertThrown;
        assertThrown!DateTimeException(Timestamp.fromISOString(""));
        assertThrown!DateTimeException(Timestamp.fromISOString("990704"));
        assertThrown!DateTimeException(Timestamp.fromISOString("0100704"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010070"));
        assertThrown!DateTimeException(Timestamp.fromISOString("120100704"));
        assertThrown!DateTimeException(Timestamp.fromISOString("-0100704"));
        assertThrown!DateTimeException(Timestamp.fromISOString("+0100704"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010070a"));
        assertThrown!DateTimeException(Timestamp.fromISOString("20100a04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010a704"));

        assertThrown!DateTimeException(Timestamp.fromISOString("99-07-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("010-07-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-07-0"));
        assertThrown!DateTimeException(Timestamp.fromISOString("12010-07-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("-010-07-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("+010-07-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-07-0a"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-0a-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-a7-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010/07/04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010/7/04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010/7/4"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010/07/4"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-7-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-7-4"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-07-4"));

        assertThrown!DateTimeException(Timestamp.fromISOString("99Jul04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("010Jul04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010Jul0"));
        assertThrown!DateTimeException(Timestamp.fromISOString("12010Jul04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("-010Jul04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("+010Jul04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010Jul0a"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010Jua04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010aul04"));

        assertThrown!DateTimeException(Timestamp.fromISOString("99-Jul-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("010-Jul-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-Jul-0"));
        assertThrown!DateTimeException(Timestamp.fromISOString("12010-Jul-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("-010-Jul-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("+010-Jul-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-Jul-0a"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-Jua-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-Jal-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-aul-04"));

        // assertThrown!DateTimeException(Timestamp.fromISOString("2010-07-04"));
        assertThrown!DateTimeException(Timestamp.fromISOString("2010-Jul-04"));

        assert(Timestamp.fromISOString("19990706") == Timestamp(1999, 7, 6));
        // assert(Timestamp.fromISOString("-19990706") == Timestamp(-1999, 7, 6));
        // assert(Timestamp.fromISOString("+019990706") == Timestamp(1999, 7, 6));
        assert(Timestamp.fromISOString("19990706") == Timestamp(1999, 7, 6));
    }

    // bug# 17801
    version (mir_test)
    @safe unittest
    {
        import std.conv : to;
        import std.meta : AliasSeq;
        static foreach (C; AliasSeq!(char, wchar, dchar))
        {
            static foreach (S; AliasSeq!(C[], const(C)[], immutable(C)[]))
                assert(Timestamp.fromISOString(to!S("20121221")) == Timestamp(2012, 12, 21));
        }
    }

    /++
    Creates a $(LREF Timestamp) from a string with the format `yyyy-mm-ddThh:mm:ss[.mmm]±hh:mm`
    or its leading part allowed by the standard.

    Params:
        str = A string formatted in the way that $(LREF .Timestamp.toISOExtString) formats dates.
        value = (optional) result value.

    Throws:
        $(LREF DateTimeException) if the given string is
        not in the correct format. Two arguments overload is `nothrow`.
    Returns:
        `bool` on success for two arguments overload, and the resulting timestamp for single argument overdload.
    +/
    alias fromISOExtString = fromISOStringImpl!true;


    ///
    version (mir_test)
    @safe unittest
    {
        assert(Timestamp.fromISOExtString("2010-07-04") == Timestamp(2010, 7, 4));
        assert(Timestamp.fromISOExtString("1998-12-25") == Timestamp(1998, 12, 25));
        assert(Timestamp.fromISOExtString("0000-01-05") == Timestamp(0, 1, 5));
        assert(Timestamp.fromISOExtString("-0004-01-05") == Timestamp(-4, 1, 5));

        assert(Timestamp(2021) == Timestamp.fromISOExtString("2021"));
        assert(Timestamp(2021) == Timestamp.fromISOExtString("2021T"));
        assert(Timestamp(2021, 01) == Timestamp.fromISOExtString("2021-01"));
        assert(Timestamp(2021, 01) == Timestamp.fromISOExtString("2021-01T"));
        assert(Timestamp(2021, 01, 29) == Timestamp.fromISOExtString("2021-01-29"));
        assert(Timestamp(2021, 01, 29, 19, 42) == Timestamp.fromISOExtString("2021-01-29T19:42"));
        assert(Timestamp(2021, 01, 29, 19, 42).withOffset(0) == Timestamp.fromISOExtString("2021-01-29T19:42Z"));
        assert(Timestamp(2021, 01, 29, 19, 42, 12) == Timestamp.fromISOExtString("2021-01-29T19:42:12"));
        assert(Timestamp(2021, 01, 29, 19, 42, 12, -3, 67).withOffset(0) == Timestamp.fromISOExtString("2021-01-29T19:42:12.067Z"));
        assert(Timestamp(2021, 01, 29, 12, 42, 44).withOffset(7 * 60) == Timestamp.fromISOExtString("2021-01-29T19:42:44+07"));
        assert(Timestamp(2021, 01, 29, 12, 42, 44).withOffset(7 * 60 + 30) == Timestamp.fromISOExtString("2021-01-29T20:12:44+07:30"));
        static assert(Timestamp(2021, 01, 29, 12, 42, 44).withOffset(7 * 60 + 30) == Timestamp.fromISOExtString("2021-01-29T20:12:44+07:30"));
        static assert(Timestamp(2021, 01, 29,  4, 42, 44).withOffset(- (7 * 60 + 30)) == Timestamp.fromISOExtString("2021-01-28T21:12:44-07:30"));
    }

    /++
    Creates a $(LREF Timestamp) from a YAML string format
    or its leading part allowed by the standard.

    Params:
        str = A string formatted in the way that $(LREF .Timestamp.toISOExtString) formats dates.
        value = (optional) result value.

    Throws:
        $(LREF DateTimeException) if the given string is
        not in the correct format. Two arguments overload is `nothrow`.
    Returns:
        `bool` on success for two arguments overload, and the resulting timestamp for single argument overdload.
    +/
    alias fromYamlString = fromISOStringImpl!(true, true);

    ///
    version (mir_test)
    @safe unittest
    {
        // canonical
        assert(Timestamp.fromYamlString("2001-12-15T02:59:43.1Z") == Timestamp("2001-12-15T02:59:43.1Z"));
        // with lower 't' separator
        assert(Timestamp.fromYamlString("2001-12-14t21:59:43.1-05:30") == Timestamp("2001-12-14T21:59:43.1-05:30"));
        // yaml space separated
        assert(Timestamp.fromYamlString("2001-12-14 21:59:43.1 -5") == Timestamp("2001-12-14T21:59:43.1-05"));
        // no time zone (Z)
        assert(Timestamp.fromYamlString("2001-12-15 2:59:43.10") == Timestamp("2001-12-15T02:59:43.10"));
        // date 00:00:00Z
        assert(Timestamp.fromYamlString("2002-12-14") == Timestamp("2002-12-14"));
    }

    version (mir_test)
    @safe unittest
    {
        import std.exception: assertThrown;

        assertThrown!DateTimeException(Timestamp.fromISOExtString(""));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("990704"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("0100704"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("120100704"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("-0100704"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("+0100704"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010070a"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("20100a04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010a704"));

        assertThrown!DateTimeException(Timestamp.fromISOExtString("99-07-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("010-07-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-07-0"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("12010-07-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("-010-07-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("+010-07-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-07-0a"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-0a-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-a7-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010/07/04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010/7/04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010/7/4"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010/07/4"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-7-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-7-4"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-07-4"));

        assertThrown!DateTimeException(Timestamp.fromISOExtString("99Jul04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("010Jul04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010Jul0"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("12010Jul04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("-010Jul04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("+010Jul04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010Jul0a"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010Jua04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010aul04"));

        assertThrown!DateTimeException(Timestamp.fromISOExtString("99-Jul-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("010-Jul-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-Jul-0"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("12010-Jul-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("-010-Jul-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("+010-Jul-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-Jul-0a"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-Jua-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-Jal-04"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-aul-04"));

        assertThrown!DateTimeException(Timestamp.fromISOExtString("20100704"));
        assertThrown!DateTimeException(Timestamp.fromISOExtString("2010-Jul-04"));

        assert(Timestamp.fromISOExtString("1999-07-06") == Timestamp(1999, 7, 6));
        assert(Timestamp.fromISOExtString("-1999-07-06") == Timestamp(-1999, 7, 6));
        assert(Timestamp.fromISOExtString("+01999-07-06") == Timestamp(1999, 7, 6));
    }

    // bug# 17801
    version (mir_test)
    @safe unittest
    {
        import std.conv : to;
        import std.meta : AliasSeq;
        static foreach (C; AliasSeq!(char, wchar, dchar))
        {
            static foreach (S; AliasSeq!(C[], const(C)[], immutable(C)[]))
                assert(Timestamp.fromISOExtString(to!S("2012-12-21")) == Timestamp(2012, 12, 21));
        }
    }

    /++
    Creates a $(LREF Timestamp) from a string.

    Params:
        str = A string formatted in the way that $(LREF .Timestamp.toISOExtString) and $(LREF .Timestamp.toISOString) format dates, also YAML like spaces seprated strings are accepted. The function is case sensetive.
        value = (optional) result value.

    Throws:
        $(LREF DateTimeException) if the given string is
        not in the correct format. Two arguments overload is `nothrow`.
    Returns:
        `bool` on success for two arguments overload, and the resulting timestamp for single argument overdload.
    +/
    static bool fromString(C)(scope const(C)[] str, out Timestamp value) @safe pure nothrow @nogc
    {
        return fromYamlString(str, value)
            || fromISOString(str, value);
    }

    ///
    version (mir_test)
    @safe pure @nogc unittest
    {
        assert(Timestamp.fromString("2010-07-04") == Timestamp(2010, 7, 4));
        assert(Timestamp.fromString("20100704") == Timestamp(2010, 7, 4));
    }

    /// ditto
    static Timestamp fromString(C)(scope const(C)[] str) @safe pure
        if (isSomeChar!C)
    {
        Timestamp ret;
        if (fromString(str, ret))
            return ret;
        throw InvalidString;
    }

    template fromISOStringImpl(bool ext, bool yaml = false)
    {
        static Timestamp fromISOStringImpl(C)(scope const(C)[] str) @safe pure
            if (isSomeChar!C)
        {
            Timestamp ret;
            if (fromISOStringImpl(str, ret))
                return ret;
            static if (yaml)
                throw InvalidYamlString;
            else
            static if (ext)
                throw InvalidISOExtendedString;
            else
                throw InvalidISOString;
        }

        static bool fromISOStringImpl(C)(scope const(C)[] str, out Timestamp value) @safe pure nothrow @nogc
            if (isSomeChar!C)
        {
            import mir.parse: fromString, parse;

            if (str.length < 4)
                return false;

            static if (ext)
                auto isOnlyTime = (str[0] == 'T' || yaml && (str[0] == 't')) || str[2] == ':';
            else
                auto isOnlyTime = str[0] == 'T' || yaml && (str[0] == 't');

            if (!isOnlyTime)
            {
                // YYYY
                static if (ext)
                {{
                    auto startIsDigit = str.length && str[0].isDigit;
                    auto strOldLength = str.length;
                    if (!parse(str, value.year))
                        return false;
                    auto l = strOldLength - str.length;
                    if ((l == 4) != startIsDigit)
                        return false;
                }}
                else
                {
                    if (str.length < 4 || !str[0].isDigit || !fromString(str[0 .. 4], value.year))
                        return false;
                    str = str[4 .. $];
                }

                value.precision = Precision.year;
                if (str.length == 0 || str == "T")
                    return true;
                
                static if (ext)
                {
                    if (str[0] != '-')
                        return false;
                    str = str[1 .. $];
                }

                // MM
                if (str.length < 2 || !str[0].isDigit || !fromString(str[0 .. 2], value.month))
                    return false;
                str = str[2 .. $];
                value.precision = Precision.month;
                if (str.length == 0 || str.length == 1 && (str[0] == 'T' || (yaml && (str[0] == 't' || str[0] == ' ' || str[0] == '\t'))))
                    return ext;

                static if (ext)
                {
                    if (str[0] != '-')
                        return false;
                    str = str[1 .. $];
                }

                // DD
                if (str.length < 2 || !str[0].isDigit || !fromString(str[0 .. 2], value.day))
                    return false;
                str = str[2 .. $];
                value.precision = Precision.day;
                if (str.length == 0)
                    return true;
            }

            // str isn't empty here
            // T
            if ((str[0] == 'T' || (yaml && (str[0] == 't' || str[0] == ' ' || str[0] == '\t'))))
            {
                str = str[1 .. $];
                // OK, onlyTime requires length >= 3
                if (str.length == 0)
                    return true;
            }
            else 
            {
                if (!(ext && isOnlyTime))
                    return false;
            }

            value.precision = Precision.minute; // we don't have hour precision

            // hh
            if (str.length < 2 || !str[0].isDigit || !fromString(str[0 .. 2], value.hour))
            {
                static if (yaml)
                {
                    if (str.length < 1 || !str[0].isDigit || !fromString(str[0 .. 1], value.hour))
                        return false;
                    else
                        str = str[1 .. $];
                }
                else
                    return false;
            }
            else
                str = str[2 .. $];

            if (str.length == 0)
                return true;

            static if (ext)
            {
                if (str[0] != ':')
                    return false;
                str = str[1 .. $];
            }

            // mm
            {
                uint minute;
                if (str.length < 2 || !str[0].isDigit || !fromString(str[0 .. 2], minute))
                    return false;
                value.minute = cast(ubyte) minute;
                str = str[2 .. $];
                if (str.length == 0)
                    return true;
            }

            static if (ext)
            {
                if (str[0] != ':')
                    goto TZ;
                str = str[1 .. $];
            }

            // ss
            {
                uint second;
                if (str.length < 2 || !str[0].isDigit)
                    goto TZ;
                if (!fromString(str[0 .. 2], second))
                    return false;
                value.second = cast(ubyte) second;
                str = str[2 .. $];
                value.precision = Precision.second;
                if (str.length == 0)
                    return true;
            }

            // .
            if (str[0] != '.')
                goto TZ;
            str = str[1 .. $];
            value.precision = Precision.fraction;

            // fraction
            {
                const strOldLength = str.length;
                ulong fractionCoefficient;
                if (str.length < 1 || !str[0].isDigit || !parse!ulong(str, fractionCoefficient))
                    return false;
                sizediff_t fractionExponent = str.length - strOldLength;
                if (fractionExponent < -12)
                    return false;
                value.fractionExponent = cast(byte)fractionExponent;
                value.fractionCoefficient = fractionCoefficient;
                if (str.length == 0)
                    return true;
            }

        TZ:

            static if (yaml)
            {
                if (str.length && (str[0] == ' ' || str[0] == '\t'))
                    str = str[1 .. $];
            }

            if (str == "Z")
            {
                value.offset = 0;
                return true;
            }

            bool neg = str[0] == '-';

            int hour;
            int minute;
            if (str.length < 3 || str[0].isDigit || !fromString(str[0 .. 3], hour))
            {
                static if (yaml)
                {
                    if (str.length < 2 || str[0].isDigit || !fromString(str[0 .. 2], hour))
                        return false;
                    str = str[2 .. $];
                }
                else
                    return false;
            }
            else
            {
                str = str[3 .. $];
            }

            if (str.length)
            {
                static if (ext)
                {
                    if (str[0] != ':')
                        return false;
                    str = str[1 .. $];
                }
                if (str.length != 2 || !str[0].isDigit || !fromString(str[0 .. 2], minute))
                    return false;
            }

            if (neg && hour == 0 && minute == 0)
                value.setLocalTimezone;
            else
                value.offset = cast(short)(hour * 60 + (hour < 0 ? -minute : minute));
            value.addMinutes(cast(short)-int(value.offset));
            return true;
        }
    }

    ///
    bool isDuration() const @safe pure nothrow @nogc @property
    {
        return day == 88 || day == 99;
    }

    ///
    bool isNegativeDuration() const @safe pure nothrow @nogc @property
    {
        return day == 99;
    }
}

version(mir_test)
unittest
{
    long sec = -2208988800;
    uint nanosec = 0;
    auto ts = Timestamp.fromUnixTime(sec);
    if (nanosec >= 0)
    {
        ts.precision = Timestamp.Precision.fraction;
        ts.fractionCoefficient = nanosec;
        ts.fractionExponent = -9;
    }
    auto ts2 = "1900-01-01T00:00:00.000000000".Timestamp;
    assert(ts == ts2);
}

version(mir_test)
@safe pure unittest
{
    import std.datetime.systime : SysTime;
    import mir.test;
    auto ts = "2001-12-15T2:59:43.1234567".Timestamp;
    // ts.toString.should == "2001-12-15T02:59:43.1234567-00:00";
    auto st = cast(SysTime)ts;
    // st.toISOExtString.should == "2001-12-15T02:59:43.1234567";
    st.Timestamp.should == ts;
}

private auto assumePureSafe(T)(T t) @trusted
    // if (isFunctionPointer!T || isDelegate!T)
{
    import std.traits;
    enum attrs = (functionAttributes!T | FunctionAttribute.pure_ | FunctionAttribute.safe) & ~FunctionAttribute.system;
    return cast(SetFunctionAttributes!(T, functionLinkage!T, attrs)) t;
}
