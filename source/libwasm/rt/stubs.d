module libwasm.rt.stubs;

import std.typecons : Ternary;
version(WebAssembly):
import ldc.intrinsics;
extern(C) long getTimeStamp();
extern(C) void captureException(string exception);
// 1.36 pin named this time_result_t; 1.43 WASI/Posix timespec does not.
private struct TimeSpec
{
    long tv_sec;
    long tv_nsec;
}
extern(C) export TimeSpec clock_gettime(int clk_id, scope void* tp) {
  import libwasm.types : getTimeStamp;
  return TimeSpec(cast(long)getTimeStamp(), 0);
}

