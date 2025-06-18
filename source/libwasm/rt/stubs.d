module libwasm.rt.stubs;

import std.typecons : Ternary;
version(WebAssembly):
import core.stdc.time : time_result_t;
import ldc.intrinsics;
extern(C) long getTimeStamp();
extern(C) void captureException(string exception);
extern(C) export time_result_t clock_gettime(int clk_id, scope void* tp) {
  import libwasm.types : getTimeStamp;
  return time_result_t(cast(ulong)getTimeStamp(), 0);
}

extern(C) export void _d_throw_exception(Throwable throwable) {
  captureException(throwable.toString());
}

