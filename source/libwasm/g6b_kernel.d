// Copyright (c) 2026 Etienne Cimon
// SPDX-License-Identifier: MIT
//
// G6LC BIOS adaptation: JS Object_Call_* imports become D stubs that call
// the g6b-wasm Host (`env.set_inner_text`, `env.fetch`).
//
// Lives on the `g6lc_bios` branch of etcimon/libwasm, checked out as the
// g6lc_bios/libwasm submodule. Compiled only under `version (G6LC_G6B)`, which
// substitutes this module for the default extern(C) import block in
// libwasm.types — see architecture/LIBWASM-ABI.md for the bounded import set
// the g6b kernel host actually implements.
module libwasm.g6b_kernel;

nothrow:
@safe:

import optional;
import libwasm.bindings.EventHandler : EventHandler, EventHandlerNonNull;


extern (C)
{
    void set_inner_text(uint id_ptr, uint id_len, uint val_ptr, uint val_len);
    uint fetch(uint url_ptr, uint url_len);
    uint holyc(uint ptr, uint len);
    void register_endpoint(uint path_ptr, uint path_len, uint method_ptr, uint method_len);
    void console_log(uint ptr, uint len);
    void set_visible(uint id_ptr, uint id_len, int on);

    // libwasm await status ABI — the host records settlement after Asyncify
    // rewind and D reads it with `libwasmAwaitFailed`/`libwasmAwaitError`.
    int libwasm_await_supported();
    int libwasm_await_failed();
    string libwasm_await_error();
    string libwasm_await_value();
    void libwasm_note_await_fail(uint handle);
    void libwasm_note_await_ok(uint handle);

    // libwasm object/handle string ABI — host owns the object table.
    string libwasm_get__string(uint handle);
    uint libwasm_add__string(string value);

    // B61 object lifetime. `struct JsHandle` frees on destruct and copies by
    // reference, so the host table is refcounted; handles 1 (staging DOM root)
    // and 2 (BoardSpec scope) are roots and are never freed.
    uint libwasm_add__object();
    void libwasm_removeObject(uint handle);
    uint libwasm_copyObjectRef(uint handle);

    // B62 scalar box/unbox.  These are host imports; the g6b-wasm runtime
    // provides the object table and the interpreter dispatches the i64/f32/f64
    // widths through the typed import path.
    uint libwasm_add__bool(bool value);
    uint libwasm_add__int(int value);
    uint libwasm_add__uint(uint value);
    uint libwasm_add__long(long value);
    uint libwasm_add__ulong(ulong value);
    uint libwasm_add__short(short value);
    uint libwasm_add__ushort(ushort value);
    uint libwasm_add__float(float value);
    uint libwasm_add__double(double value);
    uint libwasm_add__byte(byte value);
    uint libwasm_add__ubyte(ubyte value);
    uint libwasm_add__ints(int[] values);
    uint libwasm_add__uints(uint[] values);

    // g6b DOM event host boundary (B70).
    void add_event_listener(uint target_ptr, uint target_len,
                            uint type_ptr, uint type_len,
                            int listener, int capture);
    void remove_event_listener(int listener);
    int dispatch_event(uint target_ptr, uint target_len,
                       uint type_ptr, uint type_len,
                       uint detail_ptr, uint detail_len);

    bool libwasm_get__bool(uint handle);
    int libwasm_get__int(uint handle);
    uint libwasm_get__uint(uint handle);
    long libwasm_get__long(uint handle);
    ulong libwasm_get__ulong(uint handle);
    short libwasm_get__short(uint handle);
    ushort libwasm_get__ushort(uint handle);
    float libwasm_get__float(uint handle);
    double libwasm_get__double(uint handle);
    byte libwasm_get__byte(uint handle);
    ubyte libwasm_get__ubyte(uint handle);

    // B67 Lodash. `struct Lodash` ships a JSON command buffer here; the host
    // runs it on the first-party g6b-js backend. A D delegate iteratee is
    // dispatched back into this module through the indirect function table,
    // so no host JS evaluator exists or is needed.
    string ldexec_Handle__string(uint, string, bool delegate(), void delegate(uint));
    long ldexec_Handle__long(uint, string, bool delegate(), void delegate(uint));
    double ldexec_Handle__double(uint, string, bool delegate(), void delegate(uint));
    uint ldexec_Handle__Handle(uint, string, bool delegate(), void delegate(uint));

    string ldexec_string__string(string, string, bool delegate(), void delegate(uint), bool);
    long ldexec_string__long(string, string, bool delegate(), void delegate(uint), bool);
    double ldexec_string__double(string, string, bool delegate(), void delegate(uint), bool);
    uint ldexec_string__Handle(string, string, bool delegate(), void delegate(uint), bool);

    string ldexec_long__string(long, string, bool delegate(), void delegate(uint));
    long ldexec_long__long(long, string, bool delegate(), void delegate(uint));
    double ldexec_long__double(long, string, bool delegate(), void delegate(uint));
    uint ldexec_long__Handle(long, string, bool delegate(), void delegate(uint));
}

private void g6b_text(string id, string val) @trusted
{
    set_inner_text(cast(uint) id.ptr, cast(uint) id.length, cast(uint) val.ptr, cast(uint) val.length);
}

public uint g6b_fetch(string url) @trusted
{
    return fetch(cast(uint) url.ptr, cast(uint) url.length);
}

public uint g6b_holyc(string line) @trusted
{
    return holyc(cast(uint) line.ptr, cast(uint) line.length);
}

public void g6b_register(string path, string method) @trusted
{
    register_endpoint(cast(uint) path.ptr, cast(uint) path.length,
                      cast(uint) method.ptr, cast(uint) method.length);
}

extern (C) uint getRoot()
{
    return 1;
}

extern (C)
{
    void doLog(uint) { assert(0); }
    void libwasm_await__void(uint);
    // libwasm_copyObjectRef is a host import in the first extern(C) block.
    uint libasync_promise_all__promise(uint h);
    uint libasync_promise_any__promise(uint h);
    uint libasync_promise_allsettled__promise(uint h);
    void libwasm_unset__function(string);
    // B63: libwasm_get__field and libwasm_get_idx__field are declared in
    // libwasm/types.d and are dispatched by the g6b-wasm Host. The typed
    // Object_Getter__* / Object_Call__* core below are now host imports.
    // B65 VarArgCall/JSON and B66 EventHandler/Timer are now host imports.
    // B68 promise combinators and typed array Create are host imports;
    // getTimeStamp and a first-party Moment core are landed.
    uint libwasm_moment_now();
    uint libwasm_moment_from_millis(long);

    // B72 browser-instance globals: `console`, `window`, `document`.
    // Returns 0 when unavailable; the caller must check before use. With a
    // handle, the existing Object_Call_* family reaches the members.
    uint libwasm_global(string);

    // B69 bounded ES6 Map host surface.
    uint libwasm_map_create();
    void libwasm_map_set(uint, string, string);
    Optional!string libwasm_map_get__OptionalString(uint, string);
    bool libwasm_map_has(uint, string);
    void libwasm_map_delete(uint, string);
    void libwasm_map_clear(uint);

    uint Int8Array_Create(byte[]);
    uint Int32Array_Create(int[]);
    uint Uint8Array_Create(ubyte[]);
    uint Float32Array_Create(float[]);
    uint DataView_Create(ubyte[]);

    void Static_Call_string__void(string, string, string) { assert(0); }
    void Object_Call__void(uint, string);
    void Object_Call_string__void(uint, string, string);
    void Object_Call_uint__void(uint, string, uint);
    void Object_Call_int__void(uint, string, int);
    void Object_Call_bool__void(uint, string, bool);
    void Object_Call_double__void(uint, string, double);
    void Object_Call_float__void(uint, string, float);
    void Object_Call_Handle__void(uint, string, uint);
    void Object_Call_string_string__void(uint, string, string, string);
    void Object_Call_double_double__void(uint, string, double, double);

    uint Object_Call_string__Handle(uint, string, string);
    uint Object_Call_uint__Handle(uint, string, uint);
    uint Object_Call_int__Handle(uint, string, int);
    uint Object_Call_bool__Handle(uint, string, bool);
    uint Object_Call_Handle__Handle(uint, string, uint);
    uint Object_Call_string_string__Handle(uint, string, string, string);
    uint Object_Call_string__uint(uint, string, string);
    int Object_Call_string__int(uint, string, string);
    double Object_Call_string__double(uint, string, string);

    Optional!string Object_Getter__OptionalString(uint, string);
    Optional!uint Object_Getter__OptionalUint(uint, string);
    Optional!double Object_Getter__OptionalDouble(uint, string);
    Optional!bool Object_Getter__OptionalBool(uint, string);
    Optional!string Object_Call_string__OptionalString(uint, string, string);
    Optional!uint Object_Call_string__OptionalHandle(uint, string, string);
    Optional!uint Object_Call_uint__OptionalHandle(uint, string, uint);
    Optional!uint Object_Call_int__OptionalHandle(uint, string, int);
    Optional!uint Object_Call_bool__OptionalHandle(uint, string, bool);
    EventHandler Object_Getter__EventHandler(uint, string);

    // String/Handle getters are now host imports; the g6b DOM kernel owns
    // element creation, and JS-side object lookups are served by the object
    // table.
    string Object_Getter__string(uint, string);
    uint Object_Getter__Handle(uint, string);
    Optional!uint Object_Getter__OptionalHandle(uint, string);
    // libwasm_get__string / libwasm_add__string are host imports in the
    // first extern(C) block; do not define them here.
    void libwasm_set__function(string, int, int);
    int setTimeout(int, int, int);
    void Object_Call_EventHandler__void(uint, string, bool, scope EventHandlerNonNull);
    void Object_VarArgCall__void(uint, string, string, string);

    int Object_Getter__int(uint, string);
    uint Object_Getter__uint(uint, string);
    ushort Object_Getter__ushort(uint, string);
    bool Object_Getter__bool(uint, string);
    float Object_Getter__float(uint, string);
    double Object_Getter__double(uint, string);
    bool Object_Call_string__bool(uint, string, string);
    string Object_Call_string__string(uint, string, string);
    string Object_Call_uint__string(uint, string, uint);
    string Object_Call_uint_uint__string(uint, string, uint, uint);

    bool Object_VarArgCall__bool(uint, string, string, string);
    string Object_VarArgCall__string(uint, string, string, string);
    int Object_VarArgCall__int(uint, string, string, string);
    uint Object_VarArgCall__uint(uint, string, string, string);
    short Object_VarArgCall__short(uint, string, string, string);
    ushort Object_VarArgCall__ushort(uint, string, string, string);
    uint Object_VarArgCall__Handle(uint, string, string, string);
    float Object_VarArgCall__float(uint, string, string, string);
    double Object_VarArgCall__double(uint, string, string, string);
    long Object_VarArgCall__long(uint, string, string, string);
    ulong Object_VarArgCall__ulong(uint, string, string, string);
    long getTimeStamp();

    uint JSON_parse_string(string);
    string JSON_stringify(uint);

    int setInterval(int, int, int);
    void clearTimeout(int);
    void clearInterval(int);

    // libwasm_add__object / libwasm_removeObject are host imports in the
    // first extern(C) block; do not define them here.
    void Static_Call_Handle__void(string, string, uint) { assert(0); }
}

// libc / GC kernel surface: druntime-wasm keeps these as `env.*` imports for
// the JS harness. In the g6b cell there is no JS kernel, so they are inert
// D definitions. `false`/empty results pick the conservative druntime path
// (array ops reallocate; errno stays 0; formatting writes nothing).
extern (C)
{
    bool gc_expandArrayUsed(void[] slice, size_t newUsed, bool atomic) { assert(0); }
    bool gc_shrinkArrayUsed(void[] slice, size_t existingUsed, bool atomic) { assert(0); }

    // ABI twin of druntime core.memory.BlkInfo_ (private to druntime).
    struct G6bBlkInfo { void* base; size_t size; uint attr; }

    pragma(mangle, "gc_query")
    G6bBlkInfo g6b_gc_query(return scope void* p) { assert(0); }

    __gshared int g6b_errno;

    ref int _errno() @system { return g6b_errno; }

    real strtold(inout(char)* nptr, inout(char)** endptr) @system
    {
        assert(0);
    }

    int snprintf(char* s, size_t n, const(char)* format, ...) @system
    {
        assert(0);
    }
}
