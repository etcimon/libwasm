// Minimal entry for --carry --verify. Implicitly imports object.d
// from -I runtime-v<ldcV> under -d-version=CRuntime_LIBWASM.
// A class forces ldc2 to check TypeInfo_Class field count against
// the compiler (pin 1.36 object.d fails this on LDC 1.42).
class SmokeProbe
{
    int x;
}

extern (C) void _start()
{
    auto ci = SmokeProbe.classinfo;
    cast(void) ci;
}
