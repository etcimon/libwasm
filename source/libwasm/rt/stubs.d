module libwasm.rt.stubs;

import std.typecons : Ternary;

pragma(mangle, "_D3std8typecons7Ternary6__ctorMFNaNbNcNiNfbZSQBrQBqQBk")
auto ternaryModuleConstructor(bool b, Ternary* t) {
  (cast(ubyte*)t)[0] = b << 1;
  return t;
}

version (LDC)
pragma(mangle, "_D4core5bitop3bsrFNaNbNiNfkZi")
pure int bsr(uint v) {
    import ldc.intrinsics;
    return cast(int) (typeof(v).sizeof * 8 - 1 - llvm_ctlz(v, true));
}
