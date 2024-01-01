module libwasm.rt.memory;

version (WebAssembly) import libwasm.rt.allocator : WasmAllocator;

version (LDC) import ldc.attributes;
import libwasm.intrinsics;

version (WebAssembly) extern (C) void _d_print_throwable(Throwable t)
{
  import libwasm.bindings.Console;

  console.error(t.toString());
}

nothrow:

extern (C) @safe
{
  void[] FL_allocate(size_t);
  void[] FL_reallocate(void[], size_t);
  void FL_deallocate(void[]);
}

version (WebAssembly)
{
  @safe nothrow void alloc_init(uint heap_base)
  {
    WasmAllocator.init(heap_base);
  }

  extern (C) export void* wasm_malloc(size_t num)
  {
    return WasmAllocator.allocate(num).ptr;
  }

  extern (C) export void wasm_free(void* ptr, size_t size)
  {
    // this doesn't free. Try to un-grow?
    WasmAllocator.deallocate(ptr[0 .. size]);
    import ldc.intrinsics;

    memset(ptr, 0, size);
  }

  extern (C) export void* wasm_realloc(void* ptr, size_t oldsize, size_t size)
  {
    void* ret = WasmAllocator.allocate(size).ptr;
    import ldc.intrinsics;

    memcpy(ret, ptr, oldsize);
    memset(ptr, 0, oldsize);
    return ret;
  }

  extern (C) export void* memset(void* ptr, ubyte value, size_t num)
  {

    ubyte val = cast(ubyte) value;
    ubyte* p = cast(ubyte*) ptr;
    foreach (i; 0 .. num)
      p[i] = val;
    return ptr;
  }
}

version (unittest)
{
  import ldc.intrinsics : llvm_memset;

  @safe nothrow void alloc_init(uint heap_base)
  {
  }

  extern (C) export void* wasm_malloc(size_t num)
  {
    return (new ubyte[num]).ptr;
  }

  extern (C) export void wasm_free(void* ptr, size_t size)
  {
    // this doesn't free. Try to un-grow?
    // WasmAllocator.deallocate(ptr[0 .. size]);
    import ldc.intrinsics;

    llvm_memset(ptr, 0, size);
  }

  extern (C) export void* wasm_realloc(void* ptr, size_t oldsize, size_t size)
  {
    void* ret = wasm_malloc(size);
    import ldc.intrinsics;

    memcpy(ret, ptr, oldsize);
    llvm_memset(ptr, 0, oldsize);
    return ret;
  }
}

extern (C) export void* memcpy(void* destination, const void* source, size_t num)
{
  foreach (i; 0 .. num)
  {
    (cast(ubyte*) destination)[i] = (cast(ubyte*) source)[i];
  }
  return destination;
}

extern (C) export
int memcmp(void* a, void* b, size_t cnt)
{
  foreach (i; 0 .. cnt)
  {
    if ((cast(byte*) a)[i] < (cast(byte*) b)[i])
      return -1;
    if ((cast(byte*) a)[i] > (cast(byte*) b)[i])
      return 1;
  }
  return 0;
}

extern (C):
export void* memmove(void* dest, void* src, size_t num)
{
  ubyte[] tmp = cast(ubyte[]) FL_allocate(num);
  foreach (i; 0 .. num)
  {
    *cast(ubyte*)&tmp[i] = *cast(ubyte*)&src[i];
  }
  foreach (i; 0 .. num)
  {
    *cast(ubyte*)&dest[i] = *cast(ubyte*)&tmp[i];
  }
  FL_deallocate(tmp);
  return dest;
}
// per-element array init routines

// void _d_array_init_i16(ushort* a, size_t n, ushort v)
// {
//     auto p = a;
//     auto end = a+n;
//     while (p !is end)
//         *p++ = v;
// }

// void _d_array_init_i32(uint* a, size_t n, uint v)
// {
//     auto p = a;
//     auto end = a+n;
//     while (p !is end)
//         *p++ = v;
// }

// void _d_array_init_i64(ulong* a, size_t n, ulong v)
// {
//     auto p = a;
//     auto end = a+n;
//     while (p !is end)
//         *p++ = v;
// }

// void _d_array_init_float(float* a, size_t n, float v)
// {
//     auto p = a;
//     auto end = a+n;
//     while (p !is end)
//         *p++ = v;
// }

// void _d_array_init_double(double* a, size_t n, double v)
// {
//     auto p = a;
//     auto end = a+n;
//     while (p !is end)
//         *p++ = v;
// }

// void _d_array_init_real(real* a, size_t n, real v)
// {
//     auto p = a;
//     auto end = a+n;
//     while (p !is end)
//         *p++ = v;
// }

// void _d_array_init_cfloat(cfloat* a, size_t n, cfloat v)
// {
//     auto p = a;
//     auto end = a+n;
//     while (p !is end)
//         *p++ = v;
// }

// void _d_array_init_cdouble(cdouble* a, size_t n, cdouble v)
// {
//     auto p = a;
//     auto end = a+n;
//     while (p !is end)
//         *p++ = v;
// }

// void _d_array_init_creal(creal* a, size_t n, creal v)
// {
//     auto p = a;
//     auto end = a+n;
//     while (p !is end)
//         *p++ = v;
// }

// void _d_array_init_pointer(void** a, size_t n, void* v)
// {
//     auto p = a;
//     auto end = a+n;
//     while (p !is end)
//         *p++ = v;
// }

// void _d_array_init_mem(void* a, size_t na, void* v, size_t nv)
// {
//     auto p = a;
//     auto end = a + na*nv;
//     while (p !is end) {
//       memcpy(p,v,nv);
//       p += nv;
//     }
// }

// deprecated("since ldc 1.14.0")
// size_t _d_array_cast_len(size_t len, size_t elemsz, size_t newelemsz)
// {
//     if (newelemsz == 1) {
//         return len*elemsz;
//     }
//     else if ((len*elemsz) % newelemsz) {
//       assert(0);
//     }
//     return (len*elemsz)/newelemsz;
// }

// @trusted nothrow
// size_t _d_arraycast_len(size_t len, size_t elemsz, size_t newelemsz) {
//     const size = len * elemsz;
//     const newlen = size / newelemsz;
//     if (newlen * newelemsz != size)
//         assert(0);
//     return newlen;
// }

// slice copy when assertions are enabled
//  void _d_array_slice_copy(void* dst, size_t dstlen, void* src, size_t srclen, size_t elemsz)
//  {
//    if (dstlen != 0) assert(dst);
//    if (dstlen != 0) assert(src);
//    if (dstlen != srclen)
//      assert(0);
//    else if (dst+dstlen*elemsz <= src || src+srclen*elemsz <= dst) {
//      version (LDC) {
//        import ldc.intrinsics;
//        llvm_memcpy!size_t(dst, src, dstlen * elemsz, 0);
//      } else
//        memcpy(dst, src, dstlen * elemsz);
//    }
//    else
//      assert(0);
//  }
