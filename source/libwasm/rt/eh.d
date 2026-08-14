/// Wasm exception runtime for LDC master (`useWasmEH` / try_table).
/// Mirrors the WebAssembly slice of LDC `rt/dwarfeh.d` without libunwind.
module libwasm.rt.eh;

version (WebAssembly):

import ldc.intrinsics;

extern (C):

// Itanium codes the wasm landing-pad path still uses.
enum _URC_HANDLER_FOUND = 6;
enum _URC_CONTINUE_UNWIND = 8;

struct UnwindException
{
    align(8):
    ulong exceptionClass;
    void function(int, UnwindException*) cleanup;
    size_t private1;
    size_t private2;
}

struct ExceptionHeader
{
    Throwable object;
    UnwindException exceptionObject;
    ExceptionHeader* next;

    __gshared ExceptionHeader storage;
    __gshared ExceptionHeader* stack;

    static ExceptionHeader* create(Throwable o) @nogc nothrow
    {
        auto eh = &storage;
        if (eh.object !is null)
        {
            // Second in-flight exception: overwrite storage. Nested throw
            // during catch is rare in the SPA; full calloc is later.
            eh.object = null;
        }
        eh.object = o;
        eh.exceptionObject.exceptionClass = 0x444D4400; // 'DMD\0' nibble
        eh.next = null;
        return eh;
    }

    static ExceptionHeader* toHeader(UnwindException* eo) @nogc nothrow
    {
        return cast(ExceptionHeader*)(cast(void*) eo - ExceptionHeader.exceptionObject.offsetof);
    }

    void push() @nogc nothrow
    {
        next = stack;
        stack = &this;
    }

    static ExceptionHeader* pop() @nogc nothrow
    {
        auto eh = stack;
        if (eh !is null)
            stack = eh.next;
        return eh;
    }
}

/// Filled by LLVM-generated landing pads before `_Unwind_CallPersonality`.
struct LandingPadContext
{
    size_t lpadIndex;
    size_t lsda;
    size_t selector;
}

export __gshared LandingPadContext __wasm_lpad_context;

/// DtoThrow. On LDC 1.43+ this is a real wasm `throw` of tag 0
/// (`__cpp_exception`) so `catchpad` / `try_table` can catch it.
export void _d_throw_exception(Throwable throwable)
{
    static if (__VERSION__ >= 2113)
    {
        auto eh = ExceptionHeader.create(throwable);
        eh.push();
        llvm_wasm_throw(0, &eh.exceptionObject);
    }
    else
    {
        // 1.36 / 1.42: LLVM does not emit catchable wasm throw.
        extern (C) void captureException(string exception);
        captureException(throwable.toString());
        assert(0, "libwasm: throw without wasm-eh");
    }
}

/// LLVM wasm landing pad: set selector then `llvm.wasm.get.ehselector`.
/// Selector 1 matches the first `llvm.eh.typeid.for` catch type, which is
/// enough for `catch (Exception)` / `catch (Throwable)` as the only clause.
/// Multi-type LSDA scan is the next increment (`scanLSDA` in dwarfeh.d).
export int _Unwind_CallPersonality(UnwindException* exceptionObject)
{
    __wasm_lpad_context.selector = 0;
    if (exceptionObject is null)
        return _URC_CONTINUE_UNWIND;
    __wasm_lpad_context.selector = 1;
    return _URC_HANDLER_FOUND;
}

export Throwable _d_eh_enter_catch(UnwindException* exceptionObject)
{
    auto eh = ExceptionHeader.toHeader(exceptionObject);
    auto o = eh.object;
    eh.object = null;
    if (eh is ExceptionHeader.pop())
    { /* single-slot header; leave storage clean */ }
    return o;
}

/// Referenced by IR personality; wasm EH does not call it at runtime.
export int __gxx_wasm_personality_v0(int, int, ulong, void*, void*)
{
    return _URC_CONTINUE_UNWIND;
}

export void _d_delThrowable(Throwable) { }
