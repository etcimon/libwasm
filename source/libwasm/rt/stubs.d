module libwasm.rt.stubs;

import std.typecons : Ternary;

extern (C)
  pragma(mangle, "_D3std8typecons7Ternary6__ctorMFNaNbNcNiNfbZSQBrQBqQBk")
  auto ternaryModuleConstructor(bool b, Ternary* t) {
    (cast(ubyte*)t)[0] = b << 1;
    return t;
  }
