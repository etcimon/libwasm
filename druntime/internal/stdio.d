module druntime.internal.stdio;

pragma(msg, "stdio");
// Authors:   tspike (github.com/tspike2k)
// Copyright: Copyright (c) 2020
// License:   Boost Software License 1.0 (https://www.boost.org/LICENSE_1_0.txt)

/+
TODO:
 - Testing on Windows

 - Formatting of classes

 - Better documentation (explain the reasononing behind decisions, that ranges serve as an abstract output policy, better usage info, etc)

 - Better handling of structs with anonymous union members (see format() in Phobos and search for `#{overlap`)?

 - Remove printing to a file? It's a little out of scope, isn't it? And formatting a string directly to a file is very naive. Typically, you want to buffer up output before flushing to a file.
   Then again, allowing that does give us the ability to write to stdout/stderr easily, so perhaps we should keep this.

 - Format specifier for left-padding with char __c__ for minimum of __n__ chars)?

 - Format specifier for converting a string to lowercase/uppercase?

 - toPrintIndex should probably be allowed for structs as well as unions. This way we can have a tagged union type
   that would store the type outside of the union members.

 - It seems that Phobos convention tends to provide toString methods that take OutputRanges and format directly into them.
   Perhaps we should look into supporting this somehow? Obviously, the toString method would need to be marked as "nothrow @nogc",
   so maybe that's a bit too much to ask for people to do? Then again, if it's there, we could use it. We'll see.
+/

// NOTE: The order of members returned by __traits(allMembers) is not guaranteed to be in the order they appear in the struct definition.
// However, it SEEMS that the .tupleof property is expected (perhaps even required) to be ordered this way. This behavior appears to be expected by
// some code in Phobos, so we'll rely on this behavior. Should this break in the future, we're going to have to make some changes.
//
// See here for some discussions on this topic:
// https://forum.dlang.org/thread/bug-19036-3@https.issues.dlang.org%2F
// https://forum.dlang.org/thread/odpdhayvxaglheqcntwj@forum.dlang.org
// https://forum.dlang.org/post/stvphdwgugrlcgfkbyxc@forum.dlang.org

public @nogc nothrow pure:

enum ToPrint; // TODO: Do we still need this? We could force everything with specific requirements to supply a toString method.

private
{
    // Library configuration options:
    enum outputStructAndUnionNames = false; // Determines if formatting a struct or a union should output the name of the data type in the resulting text.
    enum assertOnTruncation        = false; // Trigger an assertion when formatting to a buffer results in a string larger than the buffer size

}

char[] format(Args...)(const(char)[] fmt, char[] buffer, Args args)
{
    ArrayRange range;
    range.buffer = buffer[];
    assert(buffer.length > 0); // TODO: Should we allow this and just return if the buffer is empty?

    format(fmt, range, args);
    range.buffer[range.bytesWritten] = '\0';
    return range.buffer[0..range.bytesWritten];
}

void format(Dest, Args...)(const(char)[] fmt, ref Dest dest, Args args)
if(!isArray!Dest)
{
    // TODO: Can this be simplified by using slices instead of fmtCursor/fmtCopyToBufferIndex?
    size_t fmtCursor = 0;
    size_t fmtCopyToBufferIndex = 0;

    enum outputPolicy = `dest.put(fmt[fmtCopyToBufferIndex .. fmtCursor]);`;

    while(fmtCursor < fmt.length)
    {
        if (fmt[fmtCursor] == '{')
        {
            if (fmtCursor < fmt.length - 1 && fmt[fmtCursor+1] == '{')
            {
                fmtCursor++;
                mixin(outputPolicy);
                fmtCursor++;
                fmtCopyToBufferIndex = fmtCursor;
            }
            else
            {
                mixin(outputPolicy);

                fmtCursor++;
                size_t commandStart = fmtCursor;
                size_t commandEnd   = fmtCursor;
                while(fmtCursor < fmt.length)
                {
                    if (fmt[fmtCursor] == '}')
                    {
                        commandEnd = fmtCursor;
                        fmtCursor++;
                        break;
                    }
                    fmtCursor++;
                }

                fmtCopyToBufferIndex = fmtCursor;

                auto formatCommand = fmt[commandStart .. commandEnd];

                auto argIndex = eatAndReturnArgIndex(formatCommand);
                assert(argIndex < args.length, "ERR: Format index exceeds length of provided arguments.");
                auto formatSpec = getFormatSpec(formatCommand);

                // NOTE: Variadic template argument indexing based on std.format.getNth(...) from Phobos.
                outer: switch(argIndex)
                {
                    static foreach(i, _; Args)
                    {
                        case i:
                        {
                            formatArg(args[i], formatSpec, dest);
                        } break outer;
                    }

                    default:
                    {
                        assert(0,"ERR: Unable to access variadic argument.");
                    } 
                }
            }
        }
        else
            fmtCursor++;
    }
    fmtCursor = fmt.length;

    mixin(outputPolicy);
}

void formatArg(Type, Dest)(ref Type t, in FormatSpec spec, ref Dest dest)
if(!isArray!Dest)
{
    alias T = Unqual!Type;

    // NOTE: Used to detect anonymous unions
    size_t getHighestOffsetUntil(T)(size_t memberCutoffIndex)
    if(is(T == struct) || is(T == union))
    {
        size_t result = 0;
        static foreach(i; 0 .. t.tupleof.length)
        {
            if(i < memberCutoffIndex)
            {
                result = result < t.tupleof[i].offsetof ? t.tupleof[i].offsetof : result;
            }
        }
        return result;
    }

    static if (is(T == enum))
    {
        outer: final switch(t)
        {
            static foreach (i, member; EnumMembers!T)
            {
                case EnumMembers!T[i]:
                {
                    dest.put(__traits(identifier, EnumMembers!T[i]));
                } break outer;
            }
        }
    }
    else static if(is(T == bool))
    {
        if(t)
        {
            dest.put("true");
        }
        else
        {
            dest.put("false");
        }
    }
    else static if (isIntegral!T)
    {
        char[30] intBuffer;
        auto result = intToString(intBuffer, t, spec.flags, spec.leadingZeroes);
        dest.put(result);
    }
    else static if (is(T == char))
    {
        char[1] temp = t;
        dest.put(temp);
    }
    else static if (is(T == float) || is(T == double))
    {
        char[512] buffer;
        auto result = doubleToString(buffer, t, spec.flags, spec.precision == 0 ? 6 : spec.precision, spec.leadingZeroes);
        dest.put(result);
    }
    else static if(isCString!T)
    {
        size_t srcLength = 0;
        while(t[srcLength] != '\0') srcLength++;
        dest.put(t[0 .. srcLength]);
    }
    else static if(isCharArray!T)
    {
        size_t endIndex = t.length;
        foreach(i; 0 .. t.length)
        {
            if(t[i] == '\0')
            {
                endIndex = i;
                break;
            }
        }
        dest.put(t[0 .. endIndex]);
    }
    else static if(isInputRange!T)
    {
        static assert(!isInfinite!T);

        dest.put("[");
        size_t i = 0;
        foreach(ref v; t)
        {
            if(i > 0) dest.put(", ");
            formatArg(v, spec, dest);
            i++;
        }
        dest.put("]");
    }
    else static if(is(T == struct))
    {
        static if(outputStructAndUnionNames) dest.put(T.stringof);
        dest.put("(");

        foreach(i, member; t.tupleof)
        {
            static if(i == 0 || t.tupleof[i].offsetof > getHighestOffsetUntil!T(i))
            {
                static if(i > 0) dest.put(", ");

                enum surroundWithQuotes = useQuotes!(typeof(member));
                static if(surroundWithQuotes) dest.put("\"");
                formatArg(member, spec, dest);
                static if(surroundWithQuotes) dest.put("\"");
            }
        }
        dest.put(")");
    }
    else static if(is(T == union))
    {
        alias taggedToPrintMembers = getSymbolsByUDA!(T, ToPrint);
        static if (taggedToPrintMembers.length > 0)
        {
            static if(outputStructAndUnionNames) dest.put(T.stringof);
            dest.put("(");
            static foreach(i, member; taggedToPrintMembers)
            {{
                enum surroundWithQuotes = useQuotes!(typeof(member));
                static if(surroundWithQuotes) dest.put("\"");
                formatArg(t.tupleof[i], spec, dest);
                static if(surroundWithQuotes) dest.put("\"");
                static if (i < taggedToPrintMembers.length - 1) dest.put(", ");
            }}
            dest.put(")");
        }
        else static if(__traits(hasMember, T, "toPrintIndex"))
        {
            outer: switch(t.toPrintIndex())
            {
                static foreach(i, m; T.tupleof)
                {
                    case i:
                    {
                        enum surroundWithQuotes = useQuotes!(typeof(m));
                        static if(surroundWithQuotes) dest.put("\"");
                        formatArg(t.tupleof[i], spec, dest);
                        static if(surroundWithQuotes) dest.put("\"");
                    } break outer;
                }

                default: assert(0, "Invalid toPrintIndex value."); break outer;
            }
        }
        else
        {
            static if (outputStructAndUnionNames) dest.put(T.stringof);
            dest.put("(");
            foreach(i, member; t.tupleof)
            {
                static if(i == 0 || t.tupleof[i].offsetof > getHighestOffsetUntil!T(i))
                {
                    static if(i > 0) dest.put(", ");

                    enum surroundWithQuotes = useQuotes!(typeof(member));
                    static if(surroundWithQuotes) dest.put("\"");
                    formatArg(t.tupleof[i], spec, dest);
                    static if(surroundWithQuotes) dest.put("\"");
                }
            }
            dest.put(")");
        }
    }
    else static if(isArray!T)
    {
        dest.put("[");

        foreach(i; 0 .. t.length)
        {
            formatArg(t[i], spec, dest);
            if (i < t.length - 1)
            {
                dest.put(", ");
            }
        }

        dest.put("]");
    }
    else static if (isPointer!T)
    {
        char[30] intBuffer;
        auto result = intToString(intBuffer, cast(size_t)t, FmtFlag.Hex, size_t.sizeof);
        dest.put(result);
    }
    else
    {
        pragma(msg, "ERR in print.formatArg(...): Unhandled type " ~ T.stringof);
        static assert(0);
    }
}

enum FmtFlag : ubyte
{
    None       = 0,
    Hex        = 1 << 0,
    HexUp      = 1 << 1,
    Comma      = 1 << 2,
    ENot       = 1 << 3,
    ENotUp     = 1 << 4,
    Sign       = 1 << 5,
}

char[] intToString(T)(ref char[30] buffer, T num, FmtFlag flags = FmtFlag.None, ubyte leadingZeroes = 0)
if(isIntegral!T)
{
    Unqual!T n = num;

    assert(leadingZeroes < buffer.length - 3, "Integer precision must leave enough room in the buffer for at least three characters.");

    static if (isSigned!T)
    {
        // TODO; Does this play well with displaying negative numbers in hex? Is it NORMAL to display negative numbers using hex?
        
        auto abs(Num)(Num x) @nogc nothrow pure
        if (isIntegral!Num || (is(typeof(Num.init >= 0)) && is(typeof(-Num.init))))
        {
            static if (isFloatingPoint!(Num))
                return fabs(x);
            else
            {
                static if (isIntegral!Num)
                    return x >= 0 ? x : cast(Num) -x;
                else
                    return x >= 0 ? x : -x;
            }
        }
        F sgn(F)(F x) @safe pure nothrow @nogc
        if (isFloatingPoint!F || isIntegral!F)
        {
            // @@@TODO@@@: make this faster
            return x > 0 ? 1 : x < 0 ? -1 : x;
        }
        T sign = cast(T)sgn(n);
        n = abs(n); // NOTE: Strip off the sign to prevent the mod operator from giving us a negative array index.
    }

    ubyte base = (flags & FmtFlag.Hex) || (flags & FmtFlag.HexUp) ? 16 : 10;
    auto intToCharTable = (flags & FmtFlag.HexUp) ? intToCharTableUpper[] : intToCharTableLower[];

    size_t bufferFill = buffer.length;
    size_t place = bufferFill;
    size_t loops = 0;
    while(true)
    {
        if(place == 0) break;
        place--;
        loops++;

        auto c = intToCharTable[cast(size_t)(n % base)];
        buffer[place] = c;
        n /= base;

        if ((flags & FmtFlag.Comma) && base == 10 && loops % 3 == 0 && n != 0)
        {
            buffer[--place] = ',';
        }

        if(n == 0)
        {
            {
                auto spaceWritten = buffer.length - place;
                if(leadingZeroes > spaceWritten)
                {
                    auto zeroesToWrite = leadingZeroes - spaceWritten;
                    buffer[place - zeroesToWrite .. place] = '0';
                    place -= zeroesToWrite;
                }
            }

            // TODO: printf doesn't prepend hex values with 0x. Should we actually do this? If the user wants that, they can do it trivially enough.
            // Perhaps this should be it's own flag? Or maybe a library customization option?
            if(base == 16)
            {
                buffer[--place] = 'x';
                buffer[--place] = '0';
            }

            static if (isSigned!T)
            {
                if (sign < 0)
                {
                    buffer[--place] = '-';
                }
                else if(flags & FmtFlag.Sign)
                {
                    buffer[--place] = '+';
                }
            }
            else
            {
                if(flags & FmtFlag.Sign)
                {
                    buffer[--place] = '+';
                }
            }

            bufferFill = place;
            break;
        }
    }

    return buffer[bufferFill .. $];
}

uint stringToUint(const(char)[] str)
{
    uint result = 0;
    uint n = 0;
    foreach_reverse(ref c; str)
    {
        result += (c - '0') * (10 ^^ n);
        n++;
    }
    return result;
}

////
//
// Floating point to string conversion code based on stb_sprintf.
// Original author Jeff Roberts. Further developed by Sean Barrett and many others.
// https://github.com/nothings/stb/
// License: Public domain
//
////
char[] doubleToString(return ref char[512] buf, double fv, FmtFlag flags = FmtFlag.None, ubyte precision = 6, ubyte leadingZeroes = 0)
{
    //char const *h;
    char[512] num = 0;
    stbsp__uint32 l, n, cs; // l == length
    stbsp__uint64 n64;

    stbsp__int32 fw, pr, tz; // pr == precision?
    stbsp__uint32 fl;

    stbsp__int32 dp; // decimal position

    char[8] tail = 0;
    char[8] lead = 0;
    char* s;
    char *sn;
    char* bf = buf.ptr;

    if(flags & FmtFlag.Comma) fl |= STBSP__TRIPLET_COMMA;
    if(flags & FmtFlag.Sign)  fl |= STBSP__LEADINGPLUS;
    fl |= STBSP__LEADINGZERO;

    pr = precision;
    fw = leadingZeroes;

    void stbsp__cb_buf_clamp(T, U)(ref T cl, ref U v) {
        pragma(inline, true);
         cl = v;
         /*if (callback) {                                \
            int lg = STB_SPRINTF_MIN - (int)(bf - buf); \
            if (cl > lg)                                \
               cl = lg;                                 \
         }*/
    }

    void stbsp__chk_cb_buf(size_t bytes){
        /*if (callback) {               \
           stbsp__chk_cb_bufL(bytes); \
        } */
    }

    if((flags & FmtFlag.Hex) || (flags & FmtFlag.HexUp)) // NOTE: Hex float formatting
    {
        auto h = (flags & FmtFlag.HexUp) ? intToCharTableUpper : intToCharTableLower;

        // read the double into a string
        if (stbsp__real_to_parts(cast(stbsp__int64*)&n64, &dp, fv))
            fl |= STBSP__NEGATIVE;

        s = num.ptr + 64;

        stbsp__lead_sign(fl, lead.ptr);

        if (dp == -1023)
            dp = (n64) ? -1022 : 0;
        else
            n64 |= ((cast(stbsp__uint64)1) << 52);
        n64 <<= (64 - 56);
        if (pr < 15)
            n64 += (((cast(stbsp__uint64)8) << 56) >> (pr * 4));
        // add leading chars

        lead[1 + lead[0]] = '0';
        lead[2 + lead[0]] = 'x';
        lead[0] += 2;

        *s++ = h[(n64 >> 60) & 15];
        n64 <<= 4;
        if (pr)
            *s++ = stbsp__period;
        sn = s;

        // print the bits
        n = pr;
        if (n > 13)
            n = 13;
        if (pr > cast(stbsp__int32)n)
            tz = pr - n;
        pr = 0;
        while (n--) {
            *s++ = h[(n64 >> 60) & 15];
            n64 <<= 4;
        }

        // print the expo
        tail[1] = h[17];
        if (dp < 0) {
            tail[2] = '-';
            dp = -dp;
        } else
            tail[2] = '+';
        n = (dp >= 1000) ? 6 : ((dp >= 100) ? 5 : ((dp >= 10) ? 4 : 3));
        tail[0] = cast(char)n;
        for (;;) {
            tail[n] = '0' + dp % 10;
            if (n <= 3)
               break;
            --n;
            dp /= 10;
        }

        dp = cast(int)(s - sn);
        l = cast(int)(s - (num.ptr + 64));
        s = num.ptr + 64;
        cs = 1 + (3 << 24);
        goto scopy;
    }
    else if((flags & FmtFlag.ENot) || (flags & FmtFlag.ENotUp)) // NOTE: Scientific notation
    {
        auto h = (flags & FmtFlag.ENotUp) ? intToCharTableUpper : intToCharTableLower;
        // read the double into a string
        if (stbsp__real_to_str(&sn, &l, num.ptr, &dp, fv, pr | 0x80000000))
            fl |= STBSP__NEGATIVE;
doexpfromg:
        tail[0] = 0;
        stbsp__lead_sign(fl, lead.ptr);
        if (dp == STBSP__SPECIAL) {
            s = cast(char*)sn;
            cs = 0;
            pr = 0;
            goto scopy;
        }
        s = num.ptr + 64;
        // handle leading chars
        *s++ = sn[0];

        if (pr)
            *s++ = stbsp__period;

        // handle after decimal
        if ((l - 1) > cast(stbsp__uint32)pr)
            l = pr + 1;
        for (n = 1; n < l; n++)
            *s++ = sn[n];
        // trailing zeros
        tz = pr - (l - 1);
        pr = 0;
        // dump expo
        tail[1] = h[0xe];
        dp -= 1;
        if (dp < 0) {
            tail[2] = '-';
            dp = -dp;
        } else
            tail[2] = '+';
        n = (dp >= 100) ? 5 : 4;
        tail[0] = cast(char)n;
        for (;;) {
            tail[n] = '0' + dp % 10;
            if (n <= 3)
               break;
            --n;
            dp /= 10;
        }
        cs = 1 + (3 << 24); // how many tens
        goto flt_lead;
    }
    else // NOTE: Regular float formatting
    {
        // read the double into a string
        if (stbsp__real_to_str(&sn, &l, num.ptr, &dp, fv, pr))
            fl |= STBSP__NEGATIVE;

        stbsp__lead_sign(fl, lead.ptr);

        if (dp == STBSP__SPECIAL) {
            s = cast(char *)sn;
            cs = 0;
            pr = 0;
            goto scopy;
        }

        s = num.ptr + 64;

        // handle the three decimal varieties
        if (dp <= 0) {
            stbsp__int32 i;
            // handle 0.000*000xxxx
            *s++ = '0';
            if (pr)
               *s++ = stbsp__period;
            n = -dp;
            if (cast(stbsp__int32)n > pr)
               n = pr;
            i = n;
            while (i) {
               if (((cast(stbsp__uintptr)s) & 3) == 0)
                  break;
               *s++ = '0';
               --i;
            }
            while (i >= 4) {
               *(cast(stbsp__uint32 *)s) = 0x30303030;
               s += 4;
               i -= 4;
            }
            while (i) {
               *s++ = '0';
               --i;
            }
            if (cast(stbsp__int32)(l + n) > pr)
               l = pr - n;
            i = l;
            while (i) {
               *s++ = *sn++;
               --i;
            }
            tz = pr - (n + l);
            cs = 1 + (3 << 24); // how many tens did we write (for commas below)
        } else {
            cs = (fl & STBSP__TRIPLET_COMMA) ? ((600 - cast(stbsp__uint32)dp) % 3) : 0;
            if (cast(stbsp__uint32)dp >= l) {
               // handle xxxx000*000.0
               n = 0;
               for (;;) {
                  if ((fl & STBSP__TRIPLET_COMMA) && (++cs == 4)) {
                     cs = 0;
                     *s++ = stbsp__comma;
                  } else {
                     *s++ = sn[n];
                     ++n;
                     if (n >= l)
                        break;
                  }
               }
               if (n < cast(stbsp__uint32)dp) {
                  n = dp - n;
                  if ((fl & STBSP__TRIPLET_COMMA) == 0) {
                     while (n) {
                        if (((cast(stbsp__uintptr)s) & 3) == 0)
                           break;
                        *s++ = '0';
                        --n;
                     }
                     while (n >= 4) {
                        *(cast(stbsp__uint32 *)s) = 0x30303030;
                        s += 4;
                        n -= 4;
                     }
                  }
                  while (n) {
                     if ((fl & STBSP__TRIPLET_COMMA) && (++cs == 4)) {
                        cs = 0;
                        *s++ = stbsp__comma;
                     } else {
                        *s++ = '0';
                        --n;
                     }
                  }
               }
               cs = cast(int)(s - (num.ptr + 64)) + (3 << 24); // cs is how many tens
               if (pr) {
                  *s++ = stbsp__period;
                  tz = pr;
               }
            } else {
               // handle xxxxx.xxxx000*000
               n = 0;
               for (;;) {
                  if ((fl & STBSP__TRIPLET_COMMA) && (++cs == 4)) {
                     cs = 0;
                     *s++ = stbsp__comma;
                  } else {
                     *s++ = sn[n];
                     ++n;
                     if (n >= cast(stbsp__uint32)dp)
                        break;
                  }
               }
               cs = cast(int)(s - (num.ptr + 64)) + (3 << 24); // cs is how many tens
               if (pr)
                  *s++ = stbsp__period;
               if ((l - dp) > cast(stbsp__uint32)pr)
                  l = pr + dp;
               while (n < l) {
                  *s++ = sn[n];
                  ++n;
               }
               tz = pr - (l - dp);
            }
        }
        pr = 0;

flt_lead:
        // get the length that we copied
        l = cast(stbsp__uint32)(s - (num.ptr + 64));
        s = num.ptr + 64;
        goto scopy;
    }

scopy:
        // get fw=leading/trailing space, pr=leading zeros
        if (pr < cast(stbsp__int32)l)
            pr = l;
        //n = pr + lead[0] + tail[0] + tz; // Original line
        n = pr + tail[0] + tz; // NOTE: For our lib, we want to ignore the leading when calculating the trailing zeroes
        if (fw < cast(stbsp__int32)n)
            fw = n;
        fw -= n;
        pr -= l;

        // handle right justify and leading zeros
        if ((fl & STBSP__LEFTJUST) == 0) {
            if (fl & STBSP__LEADINGZERO) // if leading zeros, everything is in pr
            {
               pr = (fw > pr) ? fw : pr;
               fw = 0;
            } else {
               fl &= ~STBSP__TRIPLET_COMMA; // if no leading zeros, then no commas
            }
        }

        // copy the spaces and/or zeros
        if (fw + pr) {
            stbsp__int32 i;
            stbsp__uint32 c;

            // copy leading spaces (or when doing %8.4d stuff)
            if ((fl & STBSP__LEFTJUST) == 0)
               while (fw > 0) {
                  stbsp__cb_buf_clamp(i, fw);
                  fw -= i;
                  while (i) {
                     if (((cast(stbsp__uintptr)bf) & 3) == 0)
                        break;
                     *bf++ = ' ';
                     --i;
                  }
                  while (i >= 4) {
                     *(cast(stbsp__uint32 *)bf) = 0x20202020;
                     bf += 4;
                     i -= 4;
                  }
                  while (i) {
                     *bf++ = ' ';
                     --i;
                  }
                  stbsp__chk_cb_buf(1);
               }

            // copy leader
            sn = lead.ptr + 1;
            while (lead[0]) {
               stbsp__cb_buf_clamp(i, lead[0]);
               lead[0] -= cast(char)i;
               while (i) {
                  *bf++ = *sn++;
                  --i;
               }
               stbsp__chk_cb_buf(1);
            }

            // copy leading zeros
            c = cs >> 24;
            cs &= 0xffffff;
            cs = (fl & STBSP__TRIPLET_COMMA) ? (cast(stbsp__uint32)(c - ((pr + cs) % (c + 1)))) : 0;
            while (pr > 0) {
               stbsp__cb_buf_clamp(i, pr);
               pr -= i;
               if ((fl & STBSP__TRIPLET_COMMA) == 0) {
                  while (i) {
                     if (((cast(stbsp__uintptr)bf) & 3) == 0)
                        break;
                     *bf++ = '0';
                     --i;
                  }
                  while (i >= 4) {
                     *(cast(stbsp__uint32 *)bf) = 0x30303030;
                     bf += 4;
                     i -= 4;
                  }
               }
               while (i) {
                  if ((fl & STBSP__TRIPLET_COMMA) && (cs++ == c)) {
                     cs = 0;
                     *bf++ = stbsp__comma;
                  } else
                     *bf++ = '0';
                  --i;
               }
               stbsp__chk_cb_buf(1);
            }
        }

        // copy leader if there is still one
        sn = lead.ptr + 1;
        while (lead[0]) {
            stbsp__int32 i;
            stbsp__cb_buf_clamp(i, lead[0]);
            lead[0] -= cast(char)i;
            while (i) {
               *bf++ = *sn++;
               --i;
            }
            stbsp__chk_cb_buf(1);
        }

        // copy the string
        n = l;
        while (n) {
            stbsp__int32 i;
            stbsp__cb_buf_clamp(i, n);
            n -= i;
    /+
            STBSP__UNALIGNED(while (i >= 4) {
               *(stbsp__uint32 volatile *)bf = *(stbsp__uint32 volatile *)s;
               bf += 4;
               s += 4;
               i -= 4;
            })
            +/
            while (i) {
               *bf++ = *s++;
               --i;
            }
            stbsp__chk_cb_buf(1);
        }

        // copy trailing zeros
        while (tz) {
            stbsp__int32 i;
            stbsp__cb_buf_clamp(i, tz);
            tz -= i;
            while (i) {
               if (((cast(stbsp__uintptr)bf) & 3) == 0)
                  break;
               *bf++ = '0';
               --i;
            }
            while (i >= 4) {
               *(cast(stbsp__uint32 *)bf) = 0x30303030;
               bf += 4;
               i -= 4;
            }
            while (i) {
               *bf++ = '0';
               --i;
            }
            stbsp__chk_cb_buf(1);
        }

        // copy tail if there is one
        sn = tail.ptr + 1;
        while (tail[0]) {
            stbsp__int32 i;
            stbsp__cb_buf_clamp(i, tail[0]);
            tail[0] -= cast(char)i;
            while (i) {
               *bf++ = *sn++;
               --i;
            }
            stbsp__chk_cb_buf(1);
         }

         // handle the left justify
        if (fl & STBSP__LEFTJUST)
            if (fw > 0) {
               while (fw) {
                  stbsp__int32 i;
                  stbsp__cb_buf_clamp(i, fw);
                  fw -= i;
                  while (i) {
                     if (((cast(stbsp__uintptr)bf) & 3) == 0)
                        break;
                     *bf++ = ' ';
                     --i;
                  }
                  while (i >= 4) {
                     *(cast(stbsp__uint32 *)bf) = 0x20202020;
                     bf += 4;
                     i -= 4;
                  }
                  while (i--)
                     *bf++ = ' ';
                  stbsp__chk_cb_buf(1);
               }
            }

    return buf[0 .. bf - buf.ptr];
}

private:

import std.traits;
import core.stdc.string : memcpy;

alias ArrayTarget(T : U[], U) = U;
enum bool isCString(T) = is(T == char*) || is(T == const(char)*) || is(T == immutable(char)*);
enum bool isCharArray(T) = isArray!T && (is(ArrayTarget!(T) == char) || is(ArrayTarget!(T) == immutable char) || is(ArrayTarget!(T) == const char));

template useQuotes(T)
{
    enum useQuotes = isCharArray!T || isCString!T;
}

struct ArrayRange
{
    nothrow @nogc pure:

    char[] buffer;
    uint bytesWritten;

    void put(const(char)[] source)
    {
        auto dest = buffer[bytesWritten .. $-1]; // NOTE: Leave at least one char at the end to place the null terminator.
        static if (assertOnTruncation) assert(source.length <= dest.length, "Buffer truncation during text formatting.");

        size_t bytesToCopy = source.length;
        if(dest.length < bytesToCopy)
            bytesToCopy = dest.length;

        // Issue #1: Using memcpy rather than the built-in slice copy operator for compatability with LDC when using the -betterC switch.
        // https://github.com/tspike2k/djinnprint/issues/1
        memcpy(dest.ptr, source.ptr, bytesToCopy);
        bytesWritten += bytesToCopy;
    }
}

immutable char[] intToCharTableLower = "0123456789abcdefxp";
immutable char[] intToCharTableUpper = "0123456789ABCDEFXP";

size_t length(const(char*) s)
{
    size_t result = 0;

    while(s[result] != '\0')
    {
        result++;
    }

    return result;
}

bool isDigit(char c)
{
    return (c >= '0') && (c <= '9');
}

struct FormatSpec
{
    FmtFlag flags;
    ubyte precision;
    ubyte leadingZeroes;
}

uint eatAndReturnArgIndex(ref inout(char)[] commandStr)
{
    assert(isDigit(commandStr[0]), "Format command must start with numeric argument index.");
    uint argIndex = 0;
    uint end = 0;
    while(end < commandStr.length && isDigit(commandStr[end]))
    {
        end++;
    }
    argIndex = stringToUint(commandStr[0 .. end]);

    commandStr = commandStr[end .. $];
    return argIndex;
}

FormatSpec getFormatSpec(in char[] commandStr)
{
    FormatSpec result;

    uint eatStringToUint(ref const(char)* place, const(char)* end)
    {
        pragma(inline, true)
        auto start = place;
        while(place < end && isDigit(*place))
        {
            place++;
        }
        return stringToUint(start[0 .. place - start]);
    }

    const(char)* place = commandStr.ptr;
    const(char)* end   = commandStr.ptr + commandStr.length;
    while(place < end)
    {
        switch(*place)
        {
            case 'x':
                result.flags |= FmtFlag.Hex;
                place++;
                break;

            case 'X':
                result.flags |= FmtFlag.HexUp;
                place++;
                break;

            case 'e':
                result.flags |= FmtFlag.ENot;
                place++;
                break;

            case 'E':
                result.flags |= FmtFlag.ENotUp;
                place++;
                break;

            case ',':
                result.flags |= FmtFlag.Comma;
                place++;
                break;

            case '+':
                result.flags |= FmtFlag.Sign;
                place++;
                break;

            case 'p':
            {
                place++;
                assert(place < end && isDigit(*place), "Number expected after precision token (p) in format specifier.");
                result.precision = cast(ubyte)eatStringToUint(place, end);
            } break;

            case 'z':
            {
                place++;
                assert(place < end && isDigit(*place), "Number expected after leading-zeroes token (z) in format specifier.");
                result.leadingZeroes = cast(ubyte)eatStringToUint(place, end);
            } break;

            default: assert(0, "Unrecognized format specifier");
        }
    }

    return result;
}

void stbsp__lead_sign(stbsp__uint32 fl, char *sign)
{
   sign[0] = 0;
   if (fl & STBSP__NEGATIVE) {
      sign[0] = 1;
      sign[1] = '-';
   } else if (fl & STBSP__LEADINGSPACE) {
      sign[0] = 1;
      sign[1] = ' ';
   } else if (fl & STBSP__LEADINGPLUS) {
      sign[0] = 1;
      sign[1] = '+';
   }
}

// get float info
stbsp__int32 stbsp__real_to_parts(stbsp__int64 *bits, stbsp__int32 *expo, double value)
{
   double d;
   stbsp__int64 b = 0;

   // load value and round at the frac_digits
   d = value;

   STBSP__COPYFP(b, d);

   *bits = b & (((cast(stbsp__uint64)1) << 52) - 1);
   *expo = cast(stbsp__int32)(((b >> 52) & 2047) - 1023);

   return cast(stbsp__int32)(cast(stbsp__uint64) b >> 63);
}

alias stbsp__uint16 = ushort;
alias stbsp__int32 = int;
alias stbsp__uint32 = uint;
alias stbsp__int64 = long;
alias stbsp__uint64 = ulong;
alias stbsp__uintptr = size_t;

enum STBSP__LEFTJUST = 1;
enum STBSP__LEADINGPLUS = 2;
enum STBSP__LEADINGSPACE = 4;
enum STBSP__LEADING_0X = 8;
enum STBSP__LEADINGZERO = 16;
enum STBSP__INTMAX = 32;
enum STBSP__TRIPLET_COMMA = 64;
enum STBSP__NEGATIVE = 128;
enum STBSP__METRIC_SUFFIX = 256;
enum STBSP__HALFWIDTH = 512;
enum STBSP__METRIC_NOSPACE = 1024;
enum STBSP__METRIC_1024 = 2048;
enum STBSP__METRIC_JEDEC = 4096;
enum STBSP__SPECIAL = 0x7000;

immutable char stbsp__period = '.';
immutable char stbsp__comma = ',';

immutable double[23] stbsp__bot = [
   1e+000, 1e+001, 1e+002, 1e+003, 1e+004, 1e+005, 1e+006, 1e+007, 1e+008, 1e+009, 1e+010, 1e+011,
   1e+012, 1e+013, 1e+014, 1e+015, 1e+016, 1e+017, 1e+018, 1e+019, 1e+020, 1e+021, 1e+022
];

immutable double[22] stbsp__negbot = [
   1e-001, 1e-002, 1e-003, 1e-004, 1e-005, 1e-006, 1e-007, 1e-008, 1e-009, 1e-010, 1e-011,
   1e-012, 1e-013, 1e-014, 1e-015, 1e-016, 1e-017, 1e-018, 1e-019, 1e-020, 1e-021, 1e-022
];

immutable double[22] stbsp__negboterr = [
   -5.551115123125783e-018,  -2.0816681711721684e-019, -2.0816681711721686e-020, -4.7921736023859299e-021, -8.1803053914031305e-022, 4.5251888174113741e-023,
   4.5251888174113739e-024,  -2.0922560830128471e-025, -6.2281591457779853e-026, -3.6432197315497743e-027, 6.0503030718060191e-028,  2.0113352370744385e-029,
   -3.0373745563400371e-030, 1.1806906454401013e-032,  -7.7705399876661076e-032, 2.0902213275965398e-033,  -7.1542424054621921e-034, -7.1542424054621926e-035,
   2.4754073164739869e-036,  5.4846728545790429e-037,  9.2462547772103625e-038,  -4.8596774326570872e-039
];

immutable double[13] stbsp__top = [
   1e+023, 1e+046, 1e+069, 1e+092, 1e+115, 1e+138, 1e+161, 1e+184, 1e+207, 1e+230, 1e+253, 1e+276, 1e+299
];

immutable double[13] stbsp__negtop = [
   1e-023, 1e-046, 1e-069, 1e-092, 1e-115, 1e-138, 1e-161, 1e-184, 1e-207, 1e-230, 1e-253, 1e-276, 1e-299
];

immutable double[13] stbsp__toperr = [
   8388608,
   6.8601809640529717e+028,
   -7.253143638152921e+052,
   -4.3377296974619174e+075,
   -1.5559416129466825e+098,
   -3.2841562489204913e+121,
   -3.7745893248228135e+144,
   -1.7356668416969134e+167,
   -3.8893577551088374e+190,
   -9.9566444326005119e+213,
   6.3641293062232429e+236,
   -5.2069140800249813e+259,
   -5.2504760255204387e+282
];

immutable double[13] stbsp__negtoperr = [
   3.9565301985100693e-040,  -2.299904345391321e-063,  3.6506201437945798e-086,  1.1875228833981544e-109,
   -5.0644902316928607e-132, -6.7156837247865426e-155, -2.812077463003139e-178,  -5.7778912386589953e-201,
   7.4997100559334532e-224,  -4.6439668915134491e-247, -6.3691100762962136e-270, -9.436808465446358e-293,
   8.0970921678014997e-317L
];

immutable stbsp__uint64[20] stbsp__powten = [
   1,
   10,
   100,
   1000,
   10000,
   100000,
   1000000,
   10000000,
   100000000,
   1000000000,
   10000000000UL,
   100000000000UL,
   1000000000000UL,
   10000000000000UL,
   100000000000000UL,
   1000000000000000UL,
   10000000000000000UL,
   100000000000000000UL,
   1000000000000000000UL,
   10000000000000000000UL
];

enum stbsp__uint64 stbsp__tento19th = 1000000000000000000;

struct stbsp__digitpair_t
{
   short temp; // force next field to be 2-byte aligned
   char[201] pair;
}

const stbsp__digitpair_t stbsp__digitpair =
stbsp__digitpair_t(
  0,
   "00010203040506070809101112131415161718192021222324" ~
   "25262728293031323334353637383940414243444546474849" ~
   "50515253545556575859606162636465666768697071727374" ~
   "75767778798081828384858687888990919293949596979899"
);

void stbsp__raise_to_power10(double *ohi, double *olo, double d, stbsp__int32 power) // power can be -323 to +350
{
   double ph, pl;
   if ((power >= 0) && (power <= 22)) {
      stbsp__ddmulthi(ph, pl, d, stbsp__bot[power]);
   } else {
      stbsp__int32 e, et, eb;
      double p2h, p2l;

      e = power;
      if (power < 0)
         e = -e;
      et = (e * 0x2c9) >> 14; /* %23 */
      if (et > 13)
         et = 13;
      eb = e - (et * 23);

      ph = d;
      pl = 0.0;
      if (power < 0) {
         if (eb) {
            --eb;
            stbsp__ddmulthi(ph, pl, d, stbsp__negbot[eb]);
            stbsp__ddmultlos(ph, pl, d, stbsp__negboterr[eb]);
         }
         if (et) {
            stbsp__ddrenorm(ph, pl);
            --et;
            stbsp__ddmulthi(p2h, p2l, ph, stbsp__negtop[et]);
            stbsp__ddmultlo(p2h, p2l, ph, pl, stbsp__negtop[et], stbsp__negtoperr[et]);
            ph = p2h;
            pl = p2l;
         }
      } else {
         if (eb) {
            e = eb;
            if (eb > 22)
               eb = 22;
            e -= eb;
            stbsp__ddmulthi(ph, pl, d, stbsp__bot[eb]);
            if (e) {
               stbsp__ddrenorm(ph, pl);
               stbsp__ddmulthi(p2h, p2l, ph, stbsp__bot[e]);
               stbsp__ddmultlos(p2h, p2l, stbsp__bot[e], pl);
               ph = p2h;
               pl = p2l;
            }
         }
         if (et) {
            stbsp__ddrenorm(ph, pl);
            --et;
            stbsp__ddmulthi(p2h, p2l, ph, stbsp__top[et]);
            stbsp__ddmultlo(p2h, p2l, ph, pl, stbsp__top[et], stbsp__toperr[et]);
            ph = p2h;
            pl = p2l;
         }
      }
   }
   stbsp__ddrenorm(ph, pl);
   *ohi = ph;
   *olo = pl;
}


void STBSP__COPYFP(T, U)(ref T dest, in U src)
{
    pragma(inline, true);
    int cn = void;
    for(cn = 0; cn < 8; cn++)
        (cast(char*)&dest)[cn] = (cast(char*)&src)[cn];
}

void stbsp__ddmulthi(T)(ref T oh, ref T ol, ref T xh, const ref T yh)
{
    pragma(inline, true);
    double ahi = 0, alo, bhi = 0, blo;
    stbsp__int64 bt;
    oh = xh * yh;
    STBSP__COPYFP(bt, xh);
    bt &= ((~cast(stbsp__uint64)0) << 27);
    STBSP__COPYFP(ahi, bt);
    alo = xh - ahi;
    STBSP__COPYFP(bt, yh);
    bt &= ((~cast(stbsp__uint64)0) << 27);
    STBSP__COPYFP(bhi, bt);
    blo = yh - bhi;
    ol = ((ahi * bhi - oh) + ahi * blo + alo * bhi) + alo * blo;
}

void stbsp__ddmultlo(T)(ref T oh, ref T ol, ref T xh, ref T xl, const ref T yh, const ref T yl)
{
    pragma(inline, true);
    ol = ol + (xh * yl + xl * yh);
}

void stbsp__ddmultlos(T)(ref T oh, ref T ol, const ref T xh, const ref T yl)
{
    pragma(inline, true);
    ol = ol + (xh * yl);
}

void stbsp__ddtoS64(T, U)(ref T ob, const ref U xh, const ref U xl)
{
    pragma(inline, true);
    double ahi = 0, alo, vh, t;
    ob = cast(stbsp__int64)xh;
    vh = cast(double)ob;
    ahi = (xh - vh);
    t = (ahi - xh);
    alo = (xh - (ahi - t)) - (vh + t);
    ob += cast(stbsp__int64)(ahi + alo + xl);
}

void stbsp__ddrenorm(T)(ref T oh, ref T ol)
{
    pragma(inline, true);
    double s;
    s = oh + ol;
    ol = ol - (s - oh);
    oh = s;
}

// given a float value, returns the significant bits in bits, and the position of the
//   decimal point in decimal_pos.  +/-INF and NAN are specified by special values
//   returned in the decimal_pos parameter.
// frac_digits is absolute normally, but if you want from first significant digits (got %g and %e), or in 0x80000000
stbsp__int32 stbsp__real_to_str(char** start, stbsp__uint32* len, char* outp, stbsp__int32* decimal_pos, double value, stbsp__uint32 frac_digits)
{
   double d;
   stbsp__int64 bits = 0;
   stbsp__int32 expo, e, ng, tens;

   d = value;
   STBSP__COPYFP(bits, d);
   expo = cast(stbsp__int32)((bits >> 52) & 2047);
   ng = cast(stbsp__int32)(cast(stbsp__uint64)bits >> 63);
   if (ng)
      d = -d;

   if (expo == 2047) // is nan or inf?
   {
      *start = (bits & (((cast(stbsp__uint64)1) << 52) - 1)) ? cast(char*)"NaN" : cast(char*)"Inf";
      *decimal_pos = STBSP__SPECIAL;
      *len = 3;
      return ng;
   }

   if (expo == 0) // is zero or denormal
   {
      if ((cast(stbsp__uint64) bits << 1) == 0) // do zero
      {
         *decimal_pos = 1;
         *start = outp;
         outp[0] = '0';
         *len = 1;
         return ng;
      }
      // find the right expo for denormals
      {
         stbsp__int64 v = (cast(stbsp__uint64)1) << 51;
         while ((bits & v) == 0) {
            --expo;
            v >>= 1;
         }
      }
   }

   // find the decimal exponent as well as the decimal bits of the value
   {
      double ph, pl;

      // log10 estimate - very specifically tweaked to hit or undershoot by no more than 1 of log10 of all expos 1..2046
      tens = expo - 1023;
      tens = (tens < 0) ? ((tens * 617) / 2048) : (((tens * 1233) / 4096) + 1);

      // move the significant bits into position and stick them into an int
      stbsp__raise_to_power10(&ph, &pl, d, 18 - tens);

      // get full as much precision from double-double as possible
      stbsp__ddtoS64(bits, ph, pl);

      // check if we undershot
      if ((cast(stbsp__uint64)bits) >= stbsp__tento19th)
         ++tens;
   }

   // now do the rounding in integer land
   frac_digits = (frac_digits & 0x80000000) ? ((frac_digits & 0x7ffffff) + 1) : (tens + frac_digits);
   if ((frac_digits < 24)) {
      stbsp__uint32 dg = 1;
      if (cast(stbsp__uint64)bits >= stbsp__powten[9])
         dg = 10;
      while (cast(stbsp__uint64)bits >= stbsp__powten[dg]) {
         ++dg;
         if (dg == 20)
            goto noround;
      }
      if (frac_digits < dg) {
         stbsp__uint64 r;
         // add 0.5 at the right position and round
         e = dg - frac_digits;
         if (cast(stbsp__uint32)e >= 24)
            goto noround;
         r = stbsp__powten[e];
         bits = bits + (r / 2);
         if (cast(stbsp__uint64)bits >= stbsp__powten[dg])
            ++tens;
         bits /= r;
      }
   noround:;
   }

   // kill long trailing runs of zeros
   if (bits) {
      stbsp__uint32 n;
      for (;;) {
         if (bits <= 0xffffffff)
            break;
         if (bits % 1000)
            goto donez;
         bits /= 1000;
      }
      n = cast(stbsp__uint32)bits;
      while ((n % 1000) == 0)
         n /= 1000;
      bits = n;
   donez:;
   }

   // convert to string
   outp += 64;
   e = 0;
   for (;;) {
      stbsp__uint32 n;
      char *o = outp - 8;
      // do the conversion in chunks of U32s (avoid most 64-bit divides, worth it, constant denomiators be damned)
      if (bits >= 100000000) {
         n = cast(stbsp__uint32)(bits % 100000000);
         bits /= 100000000;
      } else {
         n = cast(stbsp__uint32)bits;
         bits = 0;
      }
      while (n) {
         outp -= 2;
         *cast(stbsp__uint16 *)outp = *cast(stbsp__uint16 *)&stbsp__digitpair.pair[(n % 100) * 2];
         n /= 100;
         e += 2;
      }
      if (bits == 0) {
         if ((e) && (outp[0] == '0')) {
            ++outp;
            --e;
         }
         break;
      }
      while (outp != o) {
         *--outp = '0';
         ++e;
      }
   }

   *decimal_pos = tens;
   *start = outp;
   *len = e;
   return ng;
}
