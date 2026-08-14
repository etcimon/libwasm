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

  /// LDC `new C()`: alloc only (`DtoNewClass` writes the initializer).
  extern (C) export Object _d_allocclass(const ClassInfo ci)
  {
    auto n = ci.initializer.length;
    if (!n)
      n = (void*).sizeof;
    return cast(Object) wasm_malloc(n);
  }

  extern (C) export Object _d_newclass(const ClassInfo ci)
  {
    auto init = ci.initializer;
    auto o = _d_allocclass(ci);
    if (init.length)
      (cast(void*) o)[0 .. init.length] = init[];
    return o;
  }

  /// Frontend C ABI for `new T[]`. Stock rt/lifetime is not on the
  /// 1.43 sourcePaths graph; these keep Phobos arrays on WasmAllocator.
  extern (C) export void[] _d_newarrayU(const TypeInfo ti, size_t length)
  {
    if (ti is null || length == 0)
      return null;
    auto next = ti.next;
    auto sz = next is null ? (void*).sizeof : next.tsize;
    if (!sz)
      return null;
    auto p = wasm_malloc(sz * length);
    return p[0 .. length];
  }

  extern (C) export void[] _d_newarrayT(const TypeInfo ti, size_t length)
  {
    auto r = _d_newarrayU(ti, length);
    if (r.ptr !is null && ti !is null && ti.next !is null)
      memset(r.ptr, 0, ti.next.tsize * length);
    return r;
  }

  extern (C) export byte[] _d_arrayappendcTX(const TypeInfo ti, return ref byte[] px, size_t n)
  {
    auto sz = (ti is null || ti.next is null) ? 1 : ti.next.tsize;
    auto newlen = px.length + n;
    auto p = cast(byte*) wasm_malloc(sz * newlen);
    if (px.length && px.ptr !is null)
      memcpy(p, px.ptr, sz * px.length);
    px = p[0 .. newlen];
    return px;
  }

  extern (C) export void[] _d_arrayappendcd(ref byte[] x, dchar c)
  {
    char[4] buf = void;
    size_t n;
    if (c < 0x80)
    {
      buf[0] = cast(char) c;
      n = 1;
    }
    else if (c < 0x800)
    {
      buf[0] = cast(char)(0xC0 | (c >> 6));
      buf[1] = cast(char)(0x80 | (c & 0x3F));
      n = 2;
    }
    else if (c < 0x10000)
    {
      buf[0] = cast(char)(0xE0 | (c >> 12));
      buf[1] = cast(char)(0x80 | ((c >> 6) & 0x3F));
      buf[2] = cast(char)(0x80 | (c & 0x3F));
      n = 3;
    }
    else
    {
      buf[0] = cast(char)(0xF0 | (c >> 18));
      buf[1] = cast(char)(0x80 | ((c >> 12) & 0x3F));
      buf[2] = cast(char)(0x80 | ((c >> 6) & 0x3F));
      buf[3] = cast(char)(0x80 | (c & 0x3F));
      n = 4;
    }
    auto old = x.length;
    _d_arrayappendcTX(typeid(char[]), x, n);
    x[old .. old + n] = cast(byte[]) buf[0 .. n];
    return x;
  }

  extern (C) export void _d_array_slice_copy(void* dst, size_t dstlen, void* src, size_t srclen, size_t elemsz)
  {
    memcpy(dst, src, dstlen * elemsz);
  }

  extern (C) export void* malloc(size_t n)
  {
    return wasm_malloc(n);
  }

  extern (C) export void free(void*)
  {
  }

  extern (C) export void* memchr(const void* s, int c, size_t n)
  {
    auto p = cast(const(ubyte)*) s;
    foreach (i; 0 .. n)
      if (p[i] == cast(ubyte) c)
        return cast(void*)(p + i);
    return null;
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
