module rt.util.typeinfo;
pragma(msg, "typeinfo");

static import core.internal.hash;

private struct _Complex(T) { T re; T im; }

enum __c_complex_float : _Complex!float;
enum __c_complex_double : _Complex!double;
enum __c_complex_real : _Complex!real;  // This is why we don't use stdc.config

alias d_cfloat = __c_complex_float;
alias d_cdouble = __c_complex_double;
alias d_creal = __c_complex_real;

enum isComplex(T) = is(T == d_cfloat) || is(T == d_cdouble) || is(T == d_creal);
// Three-way compare for integrals: negative if `lhs < rhs`, positive if `lhs > rhs`, 0 otherwise.
pragma(inline, true)
private int cmp3(T)(const T lhs, const T rhs)
if (__traits(isIntegral, T))
{
    static if (T.sizeof < int.sizeof)
        // Taking the difference will always fit in an int.
        return int(lhs) - int(rhs);
    else
        return (lhs > rhs) - (lhs < rhs);
}

// Three-way compare for real fp types. NaN is smaller than all valid numbers.
// Code is small and fast, see https://godbolt.org/z/fzb877
pragma(inline, true)
private int cmp3(T)(const T d1, const T d2)
if (is(T == float) || is(T == double) || is(T == real))
{
    if (d2 != d2)
        return d1 == d1; // 0 if both ar NaN, 1 if d1 is valid and d2 is NaN.
    // If d1 is NaN, both comparisons are false so we get -1, as needed.
    return (d1 > d2) - !(d1 >= d2);
}

// Three-way compare for complex types.
pragma(inline, true)
private int cmp3(T)(const T f1, const T f2)
if (isComplex!T)
{
    if (int result = cmp3(f1.re, f2.re))
        return result;
    return cmp3(f1.im, f2.im);
}

// Reduces to `T` if `cond` is `true` or `U` otherwise. Consider moving elsewhere if useful.
private template Select(bool cond, T, U)
{
    static if (cond) alias Select = T;
    else alias Select = U;
}

/*
TypeInfo information for built-in types.

A `Base` type may be specified, which must be a type with the same layout, alignment, hashing, and
equality comparison as type `T`. This saves on code size because parts of `Base` will be reused. Example:
`char` and `ubyte`. The implementation assumes `Base` and `T` hash the same, swap
the same, have the same ABI flags, and compare the same for equality. For ordering comparisons, we detect
during compilation whether they have different signedness and override appropriately. For initializer, we
detect if we need to override. The overriding initializer should be nonzero.
*/
private class TypeInfoGeneric(T, Base = T) : Select!(is(T == Base), TypeInfo, TypeInfoGeneric!Base)
if (T.sizeof == Base.sizeof && T.alignof == Base.alignof)
{
    const: nothrow: pure: @trusted:

    // Returns the type name.
    override string toString() const pure nothrow @safe { return T.stringof; }

    // `getHash` is the same for `Base` and `T`, introduce it just once.
    static if (is(T == Base))
        override size_t getHash(scope const void* p)
        {
            return hashOf(*cast(const T *)p);
        }

    // `equals` is the same for `Base` and `T`, introduce it just once.
    static if (is(T == Base))
        override bool equals(in void* p1, in void* p2)
        {
            return *cast(const T *)p1 == *cast(const T *)p2;
        }

    // `T` and `Base` may have different signedness, so this function is introduced conditionally.
    static if (is(T == Base) || (__traits(isIntegral, T) && T.max != Base.max))
        override int compare(in void* p1, in void* p2)
        {
            return cmp3(*cast(const T*) p1, *cast(const T*) p2);
        }

    static if (is(T == Base))
        override @property size_t tsize()
        {
            return T.sizeof;
        }

    static if (is(T == Base))
        override @property size_t talign()
        {
            return T.alignof;
        }

    // Override initializer only if necessary.
    static if (is(T == Base) || T.init != Base.init)
        override const(void)[] initializer()
        {
            static if (__traits(isZeroInit, T))
            {
                return (cast(void *)null)[0 .. T.sizeof];
            }
            else
            {
                static immutable T[1] c;
                return c;
            }
        }

    // `swap` is the same for `Base` and `T`, so introduce only once.
    static if (is(T == Base))
        override void swap(void *p1, void *p2)
        {
            auto t = *cast(T *) p1;
            *cast(T *)p1 = *cast(T *)p2;
            *cast(T *)p2 = t;
        }

    static if (is(T == Base) || RTInfo!T != RTInfo!Base)
        override @property immutable(void)* rtInfo()
        {
            return RTInfo!T;
        }

    static if (is(T == Base))
    {
        static if ((__traits(isFloating, T) && T.mant_dig != 64) ||
                   (isComplex!T && T.re.mant_dig != 64))
            // FP types except 80-bit X87 are passed in SIMD register.
            override @property uint flags() const { return 2; }
    }
}

/*
TypeInfo information for arrays of built-in types.

A `Base` type may be specified, which must be a type with the same layout, alignment, hashing, and
equality comparison as type `T`. This saves on code size because parts of `Base` will be reused. Example:
`char` and `ubyte`. The implementation assumes `Base` and `T` hash the same, swap
the same, have the same ABI flags, and compare the same for equality. For ordering comparisons, we detect
during compilation whether they have different signedness and override appropriately. For initializer, we
detect if we need to override. The overriding initializer should be nonzero.
*/
private class TypeInfoArrayGeneric(T, Base = T) : Select!(is(T == Base), TypeInfo_Array, TypeInfoArrayGeneric!Base)
{
    static if (is(T == Base))
        override bool opEquals(const Object o) const @safe nothrow { return TypeInfo.opEquals(cast(const TypeInfo) o); }

    alias opEquals = typeof(super).opEquals;
    alias opEquals = TypeInfo.opEquals;

    override string toString() const { return (T[]).stringof; }

    static if (is(T == Base))
        override size_t getHash(scope const void* p) @trusted const
        {
            return hashOf(*cast(const T[]*) p);
        }

    static if (is(T == Base))
        override bool equals(in void* p1, in void* p2) const
        {
            // Just reuse the builtin.
            return *cast(const(T)[]*) p1 == *cast(const(T)[]*) p2;
        }

    static if (is(T == Base) || (__traits(isIntegral, T) && T.max != Base.max))
        override int compare(in void* p1, in void* p2) const
        {
            // Can't reuse __cmp in object.d because that handles NaN differently.
            // (Q: would it make sense to unify behaviors?)
            // return __cmp(*cast(const T[]*) p1, *cast(const T[]*) p2);
            auto lhs = *cast(const T[]*) p1;
            auto rhs = *cast(const T[]*) p2;
            size_t len = lhs.length;
            if (rhs.length < len)
                len = rhs.length;
            for (size_t u = 0; u < len; u++)
            {
                if (int result = cmp3(lhs.ptr[u], rhs.ptr[u]))
                    return result;
            }
            return cmp3(lhs.length, rhs.length);        }

    override @property inout(TypeInfo) next() inout
    {
        return cast(inout) typeid(T);
    }
}

////////////////////////////////////////////////////////////////////////////////
// Predefined TypeInfos
////////////////////////////////////////////////////////////////////////////////

// void
class TypeInfo_v : TypeInfoGeneric!ubyte
{
    const: nothrow: pure: @trusted:

    override string toString() const pure nothrow @safe { return "void"; }

    override size_t getHash(scope const void* p)
    {
        assert(0);
    }

    override @property uint flags() nothrow pure
    {
        return 1;
    }
}

// All integrals.
class TypeInfo_h : TypeInfoGeneric!ubyte {}
class TypeInfo_b : TypeInfoGeneric!(bool, ubyte) {}
class TypeInfo_g : TypeInfoGeneric!(byte, ubyte) {}
class TypeInfo_a : TypeInfoGeneric!(char, ubyte) {}
class TypeInfo_t : TypeInfoGeneric!ushort {}
class TypeInfo_s : TypeInfoGeneric!(short, ushort) {}
class TypeInfo_u : TypeInfoGeneric!(wchar, ushort) {}
class TypeInfo_w : TypeInfoGeneric!(dchar, uint) {}
class TypeInfo_k : TypeInfoGeneric!uint {}
class TypeInfo_i : TypeInfoGeneric!(int, uint) {}
class TypeInfo_m : TypeInfoGeneric!ulong {}
class TypeInfo_l : TypeInfoGeneric!(long, ulong) {}
static if (is(cent)) class TypeInfo_zi : TypeInfoGeneric!cent {}
static if (is(ucent)) class TypeInfo_zk : TypeInfoGeneric!ucent {}

// All simple floating-point types.
class TypeInfo_f : TypeInfoGeneric!float {}
class TypeInfo_d : TypeInfoGeneric!double {}
class TypeInfo_e : TypeInfoGeneric!real {}

// Arrays of all integrals.
class TypeInfo_Ah : TypeInfoArrayGeneric!ubyte {}
class TypeInfo_Ab : TypeInfoArrayGeneric!(bool, ubyte) {}
class TypeInfo_Ag : TypeInfoArrayGeneric!(byte, ubyte) {}
class TypeInfo_Aa : TypeInfoArrayGeneric!(char, ubyte) {}
class TypeInfo_Axa : TypeInfoArrayGeneric!(const char) {}
class TypeInfo_Aya : TypeInfoArrayGeneric!(immutable char)
{
    // Must override this, otherwise "string" is returned.
    override string toString() const { return "immutable(char)[]"; }
}
class TypeInfo_At : TypeInfoArrayGeneric!ushort {}
class TypeInfo_As : TypeInfoArrayGeneric!(short, ushort) {}
class TypeInfo_Au : TypeInfoArrayGeneric!(wchar, ushort) {}
class TypeInfo_Ak : TypeInfoArrayGeneric!uint {}
class TypeInfo_Ai : TypeInfoArrayGeneric!(int, uint) {}
class TypeInfo_Aw : TypeInfoArrayGeneric!(dchar, uint) {}
class TypeInfo_Am : TypeInfoArrayGeneric!ulong {}
class TypeInfo_Al : TypeInfoArrayGeneric!(long, ulong) {}

// Arrays of all simple floating-point types.
class TypeInfo_Af : TypeInfoArrayGeneric!float {}
class TypeInfo_Ad : TypeInfoArrayGeneric!double {}
class TypeInfo_Ae : TypeInfoArrayGeneric!real {}

// void[] is a bit different, behaves like ubyte[] for comparison purposes.
class TypeInfo_Av : TypeInfo_Ah
{
    override string toString() const { return "void[]"; }

    override @property inout(TypeInfo) next() inout
    {
        return cast(inout) typeid(void);
    }

    unittest
    {
        assert(typeid(void[]).toString == "void[]");
        assert(typeid(void[]).next == typeid(void));
    }
}
// typeof(null)
class TypeInfo_n : TypeInfo
{
    const: pure: @nogc: nothrow: @safe:

    override string toString() { return "typeof(null)"; }

    override size_t getHash(scope const void*) { return 0; }

    override bool equals(in void*, in void*) { return true; }

    override int compare(in void*, in void*) { return 0; }

    override @property size_t tsize() { return typeof(null).sizeof; }

    override const(void)[] initializer() @trusted { return (cast(void *)null)[0 .. size_t.sizeof]; }

    override void swap(void*, void*) {}

    override @property immutable(void)* rtInfo() { return rtinfoNoPointers; }
}
