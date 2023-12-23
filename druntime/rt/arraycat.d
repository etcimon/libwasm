/**
 * Implementation of array copy support routines.
 *
 * Copyright: Copyright Digital Mars 2004 - 2016.
 * License:   Distributed under the
 *            $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost Software License 1.0).
 * Authors:   Walter Bright, Sean Kelly
 * Source:    $(DRUNTIMESRC rt/_arraycat.d)
 */

module rt.arraycat;

private
{
    import core.stdc.string;
    debug(PRINTF) import core.stdc.stdio;
}

extern (C) @trusted nothrow:

version (LDC)
{
    void _d_array_slice_copy(void* dst, size_t dstlen, void* src, size_t srclen, size_t elemsz)
    {
        import ldc.intrinsics : llvm_memcpy;
        if (dstlen != 0) assert(dst, "Error in _d_array_slice_copy");
        if (dstlen != 0) assert(src, "Error in _d_array_slice_copy");
        if (dstlen != srclen)
            assert(0, "Error in _d_array_slice_copy");
        else if (dst+dstlen*elemsz <= src || src+srclen*elemsz <= dst) {
            llvm_memcpy!size_t(dst, src, dstlen * elemsz, 0);
        } else assert(0, "Error in _d_array_slice_copy");
    }
}
else
{
    void[] _d_arraycopy(size_t size, void[] from, void[] to)
    {
        if (dstlen != 0) assert(dst,"Error in _d_arraycopy");
        if (dstlen != 0) assert(src,"Error in _d_arraycopy");
        if (dstlen != srclen)
            assert(0, "Error in _d_arraycopy");
        else if (dst+dstlen*elemsz <= src || src+srclen*elemsz <= dst) {            
            memcpy(to.ptr, from.ptr, to.length * size);
        } else {
            assert(0,"Error in _d_arraycopy");
        }
        return to;
    }
}
