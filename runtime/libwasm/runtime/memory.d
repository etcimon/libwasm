module libwasm.runtime.memory;
@nogc nothrow:
extern(C) @safe {
  void[] FL_allocate(size_t);
  void[] FL_reallocate(void[], size_t);
  void FL_deallocate(void[]);
}

extern (C) export void * memcpy(void * destination, const void * source, size_t num) {
  foreach(i; 0..num) {
    (cast(ubyte*)destination)[i] = (cast(ubyte*)source)[i];
  }
  return destination;
}

extern (C) export void * memset(void* ptr, ubyte value, size_t num) {

  ubyte val = cast(ubyte)value;
  ubyte* p = cast(ubyte*)ptr;
  foreach(i;0..num)
    p[i] = val;
  return ptr;
}

extern(C) export
  int memcmp(void*a,void*b,size_t cnt) {
    foreach(i;0..cnt) {
      if ((cast(byte*)a)[i] < (cast(byte*)b)[i])
        return -1;
      if ((cast(byte*)a)[i] > (cast(byte*)b)[i])
        return 1;
    }
    return 0;
  }
  
extern(C):
  export void* memmove(void*dest,void*src,size_t num) {
    if (num == 0) return dest;
    ubyte[] tmp = cast(ubyte[])FL_allocate(num);
    foreach(i; 0..num) {
      *cast(ubyte*)&tmp[i] = *cast(ubyte*)&src[i];
    }
    foreach(i; 0..num) {
      *cast(ubyte*)&dest[i] = *cast(ubyte*)&tmp[i];
    }
    FL_deallocate(tmp);
    return dest;
  }
// per-element array init routines

void _d_array_init_i16(ushort* a, size_t n, ushort v)
{
    auto p = a;
    auto end = a+n;
    while (p !is end)
        *p++ = v;
}

void _d_array_init_i32(uint* a, size_t n, uint v)
{
    auto p = a;
    auto end = a+n;
    while (p !is end)
        *p++ = v;
}

void _d_array_init_i64(ulong* a, size_t n, ulong v)
{
    auto p = a;
    auto end = a+n;
    while (p !is end)
        *p++ = v;
}

void _d_array_init_float(float* a, size_t n, float v)
{
    auto p = a;
    auto end = a+n;
    while (p !is end)
        *p++ = v;
}

void _d_array_init_double(double* a, size_t n, double v)
{
    auto p = a;
    auto end = a+n;
    while (p !is end)
        *p++ = v;
}

void _d_array_init_real(real* a, size_t n, real v)
{
    auto p = a;
    auto end = a+n;
    while (p !is end)
        *p++ = v;
}

void _d_array_init_cfloat(cfloat* a, size_t n, cfloat v)
{
    auto p = a;
    auto end = a+n;
    while (p !is end)
        *p++ = v;
}

void _d_array_init_cdouble(cdouble* a, size_t n, cdouble v)
{
    auto p = a;
    auto end = a+n;
    while (p !is end)
        *p++ = v;
}

void _d_array_init_creal(creal* a, size_t n, creal v)
{
    auto p = a;
    auto end = a+n;
    while (p !is end)
        *p++ = v;
}

void _d_array_init_pointer(void** a, size_t n, void* v)
{
    auto p = a;
    auto end = a+n;
    while (p !is end)
        *p++ = v;
}

void _d_array_init_mem(void* a, size_t na, void* v, size_t nv)
{
    auto p = a;
    auto end = a + na*nv;
    while (p !is end) {
      memcpy(p,v,nv);
      p += nv;
    }
}

deprecated("since ldc 1.14.0")
size_t _d_array_cast_len(size_t len, size_t elemsz, size_t newelemsz)
{
    if (newelemsz == 1) {
        return len*elemsz;
    }
    else if ((len*elemsz) % newelemsz) {
      assert(0);
    }
    return (len*elemsz)/newelemsz;
}

@trusted nothrow
size_t _d_arraycast_len(size_t len, size_t elemsz, size_t newelemsz) {
    const size = len * elemsz;
    const newlen = size / newelemsz;
    if (newlen * newelemsz != size)
        assert(0);
    return newlen;
}

// slice copy when assertions are enabled
 void _d_array_slice_copy(void* dst, size_t dstlen, void* src, size_t srclen, size_t elemsz)
 {
   if (dstlen != 0) assert(dst);
   if (dstlen != 0) assert(src);
   if (dstlen != srclen)
     assert(0);
   else if (dst+dstlen*elemsz <= src || src+srclen*elemsz <= dst) {
     version (LDC) {
       import ldc.intrinsics;
       llvm_memcpy!size_t(dst, src, dstlen * elemsz, 0);
     } else
       memcpy(dst, src, dstlen * elemsz);
   }
   else
     assert(0);
 }




 void _d_arraybounds(string file, int line) {
   // bounds check?
 }

  private struct _Complex(T) { T re; T im; }

enum __c_complex_float : _Complex!float;
enum __c_complex_double : _Complex!double;
enum __c_complex_real : _Complex!real;  // This is why we don't use stdc.config

alias d_cfloat = __c_complex_float;
alias d_cdouble = __c_complex_double;
alias d_creal = __c_complex_real;

enum isComplex(T) = is(T == d_cfloat) || is(T == d_cdouble) || is(T == d_creal);

short *_memset16(short *p, short value, size_t count)
{
    short *pstart = p;
    short *ptop;

    for (ptop = &p[count]; p < ptop; p++)
        *p = value;
    return pstart;
}

int *_memset32(int *p, int value, size_t count)
{
version (D_InlineAsm_X86)
{
    asm
    {
        mov     EDI,p           ;
        mov     EAX,value       ;
        mov     ECX,count       ;
        mov     EDX,EDI         ;
        rep                     ;
        stosd                   ;
        mov     EAX,EDX         ;
    }
}
else
{
    int *pstart = p;
    int *ptop;

    for (ptop = &p[count]; p < ptop; p++)
        *p = value;
    return pstart;
}
}

long *_memset64(long *p, long value, size_t count)
{
    long *pstart = p;
    long *ptop;

    for (ptop = &p[count]; p < ptop; p++)
        *p = value;
    return pstart;
}

d_cdouble *_memset128(d_cdouble *p, d_cdouble value, size_t count)
{
    d_cdouble *pstart = p;
    d_cdouble *ptop;

    for (ptop = &p[count]; p < ptop; p++)
        *p = value;
    return pstart;
}

void[] *_memset128ii(void[] *p, void[] value, size_t count)
{
    void[] *pstart = p;
    void[] *ptop;

    for (ptop = &p[count]; p < ptop; p++)
        *p = value;
    return pstart;
}

real *_memset80(real *p, real value, size_t count)
{
    real *pstart = p;
    real *ptop;

    for (ptop = &p[count]; p < ptop; p++)
        *p = value;
    return pstart;
}

d_creal *_memset160(d_creal *p, d_creal value, size_t count)
{
    d_creal *pstart = p;
    d_creal *ptop;

    for (ptop = &p[count]; p < ptop; p++)
        *p = value;
    return pstart;
}

void *_memsetn(void *p, void *value, int count, size_t sizelem)
{   void *pstart = p;
    int i;

    for (i = 0; i < count; i++)
    {
        memcpy(p, value, sizelem);
        p = cast(void *)(cast(char *)p + sizelem);
    }
    return pstart;
}

float *_memsetFloat(float *p, float value, size_t count)
{
    float *pstart = p;
    float *ptop;

    for (ptop = &p[count]; p < ptop; p++)
        *p = value;
    return pstart;
}

double *_memsetDouble(double *p, double value, size_t count)
{
    double *pstart = p;
    double *ptop;

    for (ptop = &p[count]; p < ptop; p++)
        *p = value;
    return pstart;
}
