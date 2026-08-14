module kernel;

/// Taxonomy of LDC files that libwasm omits or replaces so druntime/Phobos
/// can run without an OS/GC kernel. JS then compensates events, time, GC
/// hooks, and (target) exceptions.

enum KernelGroup
{
    none,
    gc,
    thread,
    bootstrap,
    eh,
    os,
    libc,
    phobosIo,
    phobosConc,
    phobosMath,
    phobosOther,
    ctfeKeep, /// modules libwasm already ports for CTFE / SPA compile()
}

struct JsStub
{
    string name;
    string role;
}

/// JS `env` imports that replace kernel services. Asserts already abort
/// through `onAssertErrorMsg`. Exceptions should follow the same shape
/// (decode D string(s) from linear memory, then abort) when wasm-eh lands.
immutable JsStub[] jsKernelStubs = [
    JsStub("onAssertErrorMsg", "assert abort — current model for all fatal errors"),
    JsStub("onUnittestErrorMsg", "unittest → same as assert"),
    JsStub("captureException", "D throw → JS on 1.36/1.42; 1.43+ uses llvm_wasm_throw in rt/eh.d"),
    JsStub("gc_init_nothrow", "no-op GC kernel"),
    JsStub("gc_term", "no-op GC kernel"),
    JsStub("gc_enable", "no-op GC kernel"),
    JsStub("gc_disable", "no-op GC kernel"),
    JsStub("gc_extend", "no-op GC kernel"),
    JsStub("gc_reserve", "identity; no real reserve"),
    JsStub("gc_addRange", "no-op conservative-scan register"),
    JsStub("gc_removeRange", "no-op"),
    JsStub("gc_addRoot", "no-op"),
    JsStub("free", "no-op; WasmAllocator does not reclaim"),
    JsStub("_Unwind_Resume", "Itanium unwind — stub for wasm-eh landing"),
    JsStub("_d_delThrowable", "Throwable recycle — no-op"),
    JsStub("getTimeStamp", "clock_gettime replacement (lodash now)"),
    JsStub("libwasm_await__void", "asyncify yield; not EH but kernel-like"),
    JsStub("snprintf", "libc printf subset"),
];

/// D symbols implemented in source/libwasm/rt instead of LDC rt/
immutable string[] dKernelReplacements = [
    "_d_throw_exception",
    "clock_gettime",
    "gc_malloc",
    "gc_calloc",
    "gc_qalloc",
    "gc_realloc",
    "_d_allocmemory",
    "wasm_malloc",
    "wasm_free",
    "wasm_realloc",
    "memset",
    "memcpy",
    "memmove",
    "memcmp",
    "allocString",
];

KernelGroup classifyPath(string relPosix)
{
    import std.algorithm : canFind, startsWith;
    auto p = relPosix;
    if (p.startsWith("gc/") || p == "core/memory.d" || p.startsWith("core/internal/gc/")
        || p.startsWith("core/gc/"))
        return KernelGroup.gc;
    if (p.startsWith("core/thread") || p.startsWith("core/sync/") || p == "core/thread.d")
        return KernelGroup.thread;
    if (p.canFind("/deh") || p.canFind("dwarfeh") || p.canFind("ehalloc")
        || p.canFind("eh_msvc") || p == "core/internal/backtrace/unwind.d"
        || p.canFind("backtrace/"))
        return KernelGroup.eh;
    if (p.startsWith("rt/dmain") || p.startsWith("rt/minfo") || p.startsWith("rt/sections")
        || p.startsWith("rt/dso") || p.startsWith("rt/monitor") || p.startsWith("rt/critical")
        || p == "rt/memory.d" || p == "core/runtime.d" || p == "core/internal/entrypoint.d")
        return KernelGroup.bootstrap;
    if (p.startsWith("core/sys/wasi/"))
        return KernelGroup.none;
    if (p.startsWith("core/sys/"))
        return KernelGroup.os;
    if (p.startsWith("core/stdc/") || p.startsWith("core/stdcpp/"))
        return KernelGroup.libc;
    if (p.startsWith("std/stdio") || p.startsWith("std/file") || p.startsWith("std/stdio")
        || p.startsWith("std/process") || p.startsWith("std/socket") || p.startsWith("std/net/")
        || p.startsWith("std/stdio") || p == "std/mmfile.d" || p.startsWith("std/stdio"))
        return KernelGroup.phobosIo;
    if (p.startsWith("std/concurrency") || p.startsWith("std/parallelism")
        || p.startsWith("std/stdio"))
        return KernelGroup.phobosConc;
    if (p.startsWith("std/numeric") || p.startsWith("std/complex")
        || p.startsWith("std/mathspecial") || p.startsWith("std/internal/math/"))
        return KernelGroup.phobosMath;
    if (p.startsWith("std/algorithm") || p.startsWith("std/traits") || p.startsWith("std/meta")
        || p.startsWith("std/format") || p.startsWith("std/range") || p.startsWith("std/array")
        || p.startsWith("std/conv") || p.startsWith("std/typecons") || p.startsWith("std/utf")
        || p.startsWith("std/uni") || p.startsWith("std/functional") || p.startsWith("std/exception")
        || p.startsWith("std/ascii") || p.startsWith("std/bitmanip") || p.startsWith("std/math/")
        || p == "std/math.d" || p.startsWith("std/variant") || p.startsWith("std/typetuple")
        || p.startsWith("std/system") || p.startsWith("std/typecons")
        || p == "std/string.d")
        return KernelGroup.ctfeKeep;
    if (p.startsWith("std/"))
        return KernelGroup.phobosOther;
    return KernelGroup.none;
}

string groupName(KernelGroup g)
{
    final switch (g)
    {
    case KernelGroup.none: return "none";
    case KernelGroup.gc: return "gc";
    case KernelGroup.thread: return "thread";
    case KernelGroup.bootstrap: return "bootstrap";
    case KernelGroup.eh: return "eh";
    case KernelGroup.os: return "os";
    case KernelGroup.libc: return "libc";
    case KernelGroup.phobosIo: return "phobos-io";
    case KernelGroup.phobosConc: return "phobos-conc";
    case KernelGroup.phobosMath: return "phobos-math";
    case KernelGroup.phobosOther: return "phobos-other";
    case KernelGroup.ctfeKeep: return "ctfe-keep";
    }
}

/// Why a missing file does not need a JS stub (omit) vs needs a D stub vs JS hook.
string omitRationale(KernelGroup g)
{
    final switch (g)
    {
    case KernelGroup.none:
        return "not required for the libwasm SPA / CTFE subset";
    case KernelGroup.gc:
        return "GC kernel omitted; WasmAllocator + JS gc_* no-ops + D gc_malloc stubs";
    case KernelGroup.thread:
        return "no OS threads; single-threaded browser worker";
    case KernelGroup.bootstrap:
        return "no _d_run_main / __minfo; mixin Spa!_start + -fno-moduleinfo";
    case KernelGroup.eh:
        return "no dwarf/msvc unwind; 1.43+ libwasm.rt.eh (llvm_wasm_throw), not stock dwarfeh";
    case KernelGroup.os:
        return "no POSIX/Win32; core.sys.wasi + JS clock/DOM instead";
    case KernelGroup.libc:
        return "subset already in druntime-wasm/core/stdc; rest unused";
    case KernelGroup.phobosIo:
        return "no stdio/filesystem; DOM + fetch/JS instead";
    case KernelGroup.phobosConc:
        return "no threads/fibers";
    case KernelGroup.phobosMath:
        return "pre-1.43 omit (no wasm EH); 1.43+ emit numeric/complex/mathspecial/gamma";
    case KernelGroup.phobosOther:
        return "pre-1.43 omit (throwing APIs); 1.43+ emit (json/regex/random/datetime/…)";
    case KernelGroup.ctfeKeep:
        return "should be present — if missing, port or stub";
    }
}
