///
module libwasm.rt.allocator;

nothrow:
import std.typecons : Flag, Yes, No;
import std.traits : isFloatingPoint, isIntegral, isSigned, isNumeric;

import memutils.utils;
import memutils.scoped;
import memutils.pool;
import memutils.freelist;
import memutils.hashmap;
import libwasm.rt.allocator;
import libwasm.types;

pragma(LDC_intrinsic, "llvm.maxnum.f#")
T fmax(T)(in T vala, in T valb) if (isFloatingPoint!T);
/++
Iterates the passed arguments and returns the minimum value.
Params: args = The values to select the minimum from. At least two arguments
    must be passed, and they must be comparable with `<`.
Returns: The minimum of the passed-in values.
+/
auto max(T...)(T args) if (T.length >= 2)
{
    //Get "a"
    static if (T.length <= 2)
        alias a = args[0];
    else
        auto a = max(args[0 .. ($ + 1) / 2]);
    alias T0 = typeof(a);

    //Get "b"
    static if (T.length <= 3)
        alias b = args[$ - 1];
    else
        auto b = max(args[($ + 1) / 2 .. $]);
    alias T1 = typeof(b);

    static assert(is(typeof(a < b)), "Invalid arguments: Cannot compare types " ~ T0.stringof ~ " and " ~ T1.stringof ~ ".");

    static if ((isFloatingPoint!T0 && isNumeric!T1) || (isFloatingPoint!T1 && isNumeric!T0))
    {
        return fmax(a, b);
    }
    else
    {
        static if (isIntegral!T0 && isIntegral!T1)
            static assert(isSigned!T0 == isSigned!T1,
                "mir.utility.max is not defined for signed + unsigned pairs because of security reasons."
                    ~ "Please unify type or use a Phobos analog.");
        //Do the "max" proper with a and b
        return a > b ? a : b;
    }
}
/**
The alignment that is guaranteed to accommodate any D object allocation on the
current platform.
*/
enum uint platformAlignment = max(double.alignof, real.alignof);

/**
Check whether a number is an integer power of two.

Note that only positive numbers can be integer powers of two. This
function always return `false` if `x` is negative or zero.

Params:
    x = the number to test

Returns:
    `true` if `x` is an integer power of two.
*/
bool isPowerOf2(X)(const X x) pure @safe nothrow @nogc if (isNumeric!X)
{
    static if (isFloatingPoint!X)
    {
        import std.math : frexp;

        int exp;
        const X sig = frexp(x, exp);

        return (exp != int.min) && (sig is cast(X) 0.5L);
    }
    else
    {
        static if (isSigned!X)
        {
            auto y = cast(typeof(x + 0)) x;
            return y > 0 && !(y & (y - 1));
        }
        else
        {
            auto y = cast(typeof(x + 0u)) x;
            return (y & -y) > (y - 1);
        }
    }
}
/**
Returns `n` rounded up to a multiple of alignment, which must be a power of 2.
*/
@safe @nogc nothrow pure
size_t roundUpToAlignment()(size_t n, uint alignment)
{
    assert(alignment.isPowerOf2);
    immutable uint slack = cast(uint) n & (alignment - 1);
    const result = slack
        ? n + alignment - slack : n;
    assert(result >= n);
    return result;
}

version (WebAssembly)
{

    private __gshared void* begin, current, end;
    struct WasmAllocator
    {
        import libwasm.intrinsics;

    nothrow:
    static:

        enum wasmPageSize = 64 * 1024;
        enum uint alignment = platformAlignment;
        @trusted void init(uint heap_base)
        {
            begin = cast(void*)(heap_base.roundUpToAlignment(alignment));
            current = begin;
            end = cast(void*)(wasmMemorySize * wasmPageSize);
        }

        void[] allocate(size_t n)
        {
            const rounded = n.roundUpToAlignment(alignment);
            if (current + rounded > end)
                grow(1 + rounded / wasmPageSize);
            void* mem = current;
            current += rounded;
            return mem[0 .. rounded];
        }

        bool deallocate(void[] data)
        {
            // we rely on memutils to deallocate stuff
            return true;
        }

        private void grow(size_t pages)
        {
            auto currentPages = wasmMemoryGrow(0);
            current = cast(void*)(currentPages * wasmPageSize);
            wasmMemoryGrow(pages);
            end = cast(void*)((currentPages + pages) * wasmPageSize);
        }
    }

}
/**
   Returns `true` if `ptr` is aligned at `alignment`.
*/
@nogc nothrow pure bool alignedAt(T)(T* ptr, uint alignment)
{
    return cast(size_t) ptr % alignment == 0;
}

// used in libwasm Lodash
@trusted extern (C)
{
    void[] FL_allocate(size_t n)
    {
        return ThreadMemAllocator.allocate(n);
    }

    void[] FL_reallocate(void[] mem, size_t n)
    {
        return ThreadMemAllocator.reallocate(mem, n);
    }

    void FL_deallocate(void[] mem)
    {
        ThreadMemAllocator.deallocate(mem);
    }
}

@trusted extern (C) export @assumeUsed ubyte* allocString(uint bytes)
{
    import memutils.scoped;

    auto ret = PoolStack.top.alloc(bytes + 1);
    *cast(ubyte*)(ret.ptr + ret.length - 1) = '\0'; // always return zero-ended. wrong size can be sent because this is not freed
    return cast(ubyte*) ret.ptr;
}

// implement closures with execution context or PoolStack.top
// references will be held by a ManagedPool
// maybe in some outer scope
extern (C) export void* _d_allocmemory(size_t sz)
{
    import memutils.scoped;

    return PoolStack.top.alloc(sz).ptr;
}

struct ThreadMemAllocator
{
static:
nothrow:
@trusted:
    void[] allocate(size_t n)
    {
        return ThreadMem.alloc!(void[])(n);
    }

    void[] reallocate(void[] data, size_t n, bool free_mem = true)
    {
        if (data.length == 0)
            return allocate(n);
        return ThreadMem.realloc(data, n, free_mem);
    }

    bool deallocate(void[] data, bool free_mem = true)
    {
        ThreadMem.free(data, free_mem);
        return true;
    }
}

struct PoolStackAllocator
{
static:
nothrow:
@trusted:
    void[] allocate(size_t n)
    {
        return PoolStack.top.alloc(n);
    }

    void[] reallocate(void[] data, size_t n, bool free_mem = true)
    {
        if (data.length == 0)
            return allocate(n);
        return PoolStack.top.realloc(data, n, free_mem);
    }

    bool deallocate(void[] data, bool free_mem = true)
    {
        PoolStack.top.free(data, free_mem);
        return true;
    }
}
