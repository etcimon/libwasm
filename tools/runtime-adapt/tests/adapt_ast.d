module adapt_ast;

import adapt;
import filecmp;
import kernel;
import principles;

import std.algorithm : canFind;

unittest
{
    enum tiny = q"D
module object;

alias size_t = ulong;
D";
    auto r = adaptSource(tiny, "object.d", "v1.36.0", AdaptMode.overlay);
    assert(r.ok, r.error);
    assert(r.applied.canFind("object.crt-gate"));
    assert(r.output.canFind("CRuntime_LIBWASM"));
    auto again = adaptSource(r.output, "object.d", "v1.42.0", AdaptMode.overlay);
    assert(again.ok);
    assert(!again.applied.canFind("object.crt-gate"), "idempotent CRT gate");
}

unittest
{
    enum life = q"D
module rt.lifetime;
extern (C) void* _d_allocmemory(size_t sz)
{
    return null;
}
D";
    // body is already null; splice still replaces the braces
    auto r = adaptSource(life, "rt/lifetime.d", "v1.36.0", AdaptMode.overlay);
    assert(r.ok, r.error);
    assert(r.applied.canFind("hook._d_allocmemory"));
    assert(r.output.canFind("WasmAllocator"));
}

unittest
{
    enum timed = q"D
module core.stdc.time;
version (Posix)
    public import core.sys.posix.stdc.time;
else version (Windows)
    public import core.sys.windows.stdc.time;
else
    static assert(0, "unsupported system");
D";
    auto r = adaptSource(timed, "core/stdc/time.d", "v1.42.0", AdaptMode.overlay);
    assert(r.ok, r.error);
    assert(r.applied.canFind("stdc.time-wasi"));
    assert(r.output.canFind("core.sys.wasi.time"));
}

unittest
{
    enum sel = q"D
module object;
public import core.internal.entrypoint : _d_cmain;
D";
    auto r = adaptSource(sel, "object.d", "v1.42.0", AdaptMode.overlay);
    assert(r.ok, r.error);
    assert(r.applied.canFind("drop-import.core.internal.entrypoint"));
    assert(!r.output.canFind("_d_cmain"));
}

unittest
{
    assert(selectAction("object.d", KernelGroup.none) == EmitAction.astOverlay);
    assert(selectAction("core/thread/osthread.d", KernelGroup.thread) == EmitAction.omit);
    assert(selectAction("std/traits.d", KernelGroup.ctfeKeep) == EmitAction.takeStock);
    // Pre-EH omit; 1.43+ wasm EH keeps exception-using Phobos.
    assert(selectAction("std/numeric.d", KernelGroup.phobosMath) == EmitAction.omit);
    assert(selectAction("std/numeric.d", KernelGroup.phobosMath, "v1.43.0")
        == EmitAction.takeStock);
    assert(selectAction("std/json.d", KernelGroup.phobosOther, "v1.43.0")
        == EmitAction.takeStock);
    assert(selectAction("std/stdio.d", KernelGroup.phobosIo, "v1.43.0")
        == EmitAction.omit);
    assert(selectAction("rt/dwarfeh.d", KernelGroup.eh, "v1.43.0")
        == EmitAction.omit);
}

unittest
{
    auto c = classifyFile("object.d", "stock\n", "pin\n", "stock\n");
    assert(c.klass == "missed-libwasm");
    auto c2 = classifyFile("object.d", "gen\n", "pin\n", "pin\n");
    assert(c2.klass == "adapt-delta");
}
