module libwasm.bindings.WindowOrWorkerGlobalScope;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.CacheStorage;
import libwasm.bindings.Function;
import libwasm.bindings.IDBFactory;
import libwasm.bindings.ImageBitmap;
import libwasm.bindings.Request;
import libwasm.bindings.Response;

@safe:
nothrow:

struct WindowOrWorkerGlobalScope {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string origin()() {
    return Object_Getter__string(this.handle, "origin");
  }
  string btoa()(string btoa) {
    return Object_Call_string__string(this.handle, "btoa", btoa);
  }
  string atob()(string atob) {
    return Object_Call_string__string(this.handle, "atob", atob);
  }
  int setTimeout(T2)(Function handler, int timeout /* = 0 */, scope auto ref T2 arguments) {
    // Any
    Handle _handle_arguments = getOrCreateHandle(arguments);
    auto result = WindowOrWorkerGlobalScope_setTimeout__Handle_int_Handle(this.handle, handler, timeout, _handle_arguments);
    dropHandle!(T2)(_handle_arguments);
    return result;
  }
  int setTimeout(T2)(string handler, int timeout /* = 0 */, scope auto ref T2 unused) {
    // Any
    Handle _handle_unused = getOrCreateHandle(unused);
    auto result = WindowOrWorkerGlobalScope_setTimeout__string_int_Handle(this.handle, handler, timeout, _handle_unused);
    dropHandle!(T2)(_handle_unused);
    return result;
  }
  void clearTimeout()(int handle /* = 0 */) {
    Object_Call_int__void(this.handle, "clearTimeout", handle);
  }
  void clearTimeout()() {
    Object_Call__void(this.handle, "clearTimeout");
  }
  int setInterval(T2)(Function handler, int timeout /* = 0 */, scope auto ref T2 arguments) {
    // Any
    Handle _handle_arguments = getOrCreateHandle(arguments);
    auto result = WindowOrWorkerGlobalScope_setInterval__Handle_int_Handle(this.handle, handler, timeout, _handle_arguments);
    dropHandle!(T2)(_handle_arguments);
    return result;
  }
  int setInterval(T2)(string handler, int timeout /* = 0 */, scope auto ref T2 unused) {
    // Any
    Handle _handle_unused = getOrCreateHandle(unused);
    auto result = WindowOrWorkerGlobalScope_setInterval__string_int_Handle(this.handle, handler, timeout, _handle_unused);
    dropHandle!(T2)(_handle_unused);
    return result;
  }
  void clearInterval()(int handle /* = 0 */) {
    Object_Call_int__void(this.handle, "clearInterval", handle);
  }
  void clearInterval()() {
    Object_Call__void(this.handle, "clearInterval");
  }
  auto createImageBitmap()(scope ref ImageBitmapSource aImage) {
    return JsPromise!(ImageBitmap)(Serialize_Object_VarArgCall!Handle(this.handle, "createImageBitmap", "SumType!(Handle,Handle,Handle,Handle,Handle,Handle,Handle,Handle)", tuple(libwasm.sumtype.match!(((ref aImage.Types[0] v) => 0),((ref aImage.Types[1] v) => 1),((ref aImage.Types[2] v) => 2),((ref aImage.Types[3] v) => 3),((ref aImage.Types[4] v) => 4),((ref aImage.Types[5] v) => 5),((ref aImage.Types[6] v) => 6),((ref aImage.Types[7] v) => 7))(aImage),tuple(libwasm.sumtype.match!(((ref aImage.Types[0] v) => cast(Handle)v.handle),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => cast(Handle)v.handle),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => cast(Handle)v.handle),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => cast(Handle)v.handle),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => cast(Handle)v.handle),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => cast(Handle)v.handle),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => cast(Handle)v.handle),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => cast(Handle)v.handle))(aImage)))));
  }
  auto createImageBitmap()(scope ref ImageBitmapSource aImage, int aSx, int aSy, int aSw, int aSh) {
    return JsPromise!(ImageBitmap)(Serialize_Object_VarArgCall!Handle(this.handle, "createImageBitmap", "SumType!(Handle,Handle,Handle,Handle,Handle,Handle,Handle,Handle);int;int;int;int", tuple(libwasm.sumtype.match!(((ref aImage.Types[0] v) => 0),((ref aImage.Types[1] v) => 1),((ref aImage.Types[2] v) => 2),((ref aImage.Types[3] v) => 3),((ref aImage.Types[4] v) => 4),((ref aImage.Types[5] v) => 5),((ref aImage.Types[6] v) => 6),((ref aImage.Types[7] v) => 7))(aImage),tuple(libwasm.sumtype.match!(((ref aImage.Types[0] v) => cast(Handle)v.handle),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => cast(Handle)v.handle),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => cast(Handle)v.handle),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => cast(Handle)v.handle),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => cast(Handle)v.handle),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => cast(Handle)v.handle),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => cast(Handle)v.handle),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => cast(Handle)v.handle))(aImage)), aSx, aSy, aSw, aSh)));
  }
  auto fetch()(scope ref RequestInfo input, scope ref RequestInit init) {
    return JsPromise!(Response)(Serialize_Object_VarArgCall!Handle(this.handle, "fetch", "SumType!(Handle,string);Handle", tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => 0),((string v) => 1))(input),tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(input),libwasm.sumtype.match!(((ref input.Types[0] v) => string.init),((string v) => v))(input)), cast(Handle)init.handle)));
  }
  auto fetch()(scope ref RequestInfo input) {
    return JsPromise!(Response)(Serialize_Object_VarArgCall!Handle(this.handle, "fetch", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => 0),((string v) => 1))(input),tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(input),libwasm.sumtype.match!(((ref input.Types[0] v) => string.init),((string v) => v))(input)))));
  }
  bool isSecureContext()() {
    return Object_Getter__bool(this.handle, "isSecureContext");
  }
  auto indexedDB()() {
    return Optional!(IDBFactory)(Object_Getter__OptionalHandle(this.handle, "indexedDB"));
  }
  auto caches()() {
    return CacheStorage(Object_Getter__Handle(this.handle, "caches"));
  }
}


extern (C) int WindowOrWorkerGlobalScope_setTimeout__Handle_int_Handle(Handle, Function, int, Handle);
extern (C) int WindowOrWorkerGlobalScope_setTimeout__string_int_Handle(Handle, string, int, Handle);
extern (C) int WindowOrWorkerGlobalScope_setInterval__Handle_int_Handle(Handle, Function, int, Handle);
extern (C) int WindowOrWorkerGlobalScope_setInterval__string_int_Handle(Handle, string, int, Handle);