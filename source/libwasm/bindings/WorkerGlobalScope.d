module libwasm.bindings.WorkerGlobalScope;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.CacheStorage;
import libwasm.bindings.Crypto;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.Function;
import libwasm.bindings.IDBFactory;
import libwasm.bindings.ImageBitmap;
import libwasm.bindings.Performance;
import libwasm.bindings.Request;
import libwasm.bindings.Response;
import libwasm.bindings.WindowOrWorkerGlobalScope;
import libwasm.bindings.WorkerLocation;
import libwasm.bindings.WorkerNavigator;

@safe:
nothrow:

struct WorkerGlobalScope {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto self()() {
    return WorkerGlobalScope(Object_Getter__Handle(this._parent, "self"));
  }
  auto location()() {
    return WorkerLocation(Object_Getter__Handle(this._parent, "location"));
  }
  auto navigator()() {
    return WorkerNavigator(Object_Getter__Handle(this._parent, "navigator"));
  }
  void importScripts()(string urls) {
    Object_Call_string__void(this._parent, "importScripts", urls);
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, OnErrorEventHandlerNonNull)) {
    WorkerGlobalScope_onerror_Set(this._parent, !onerror.empty, onerror.front);
  }
  OnErrorEventHandler onerror()() {
    return WorkerGlobalScope_onerror_Get(this._parent);
  }
  void onoffline(T0)(scope auto ref Optional!(T0) onoffline) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onoffline", !onoffline.empty, onoffline.front);
  }
  EventHandler onoffline()() {
    return Object_Getter__EventHandler(this._parent, "onoffline");
  }
  void ononline(T0)(scope auto ref Optional!(T0) ononline) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "ononline", !ononline.empty, ononline.front);
  }
  EventHandler ononline()() {
    return Object_Getter__EventHandler(this._parent, "ononline");
  }
  void dump()(string str) {
    Object_Call_string__void(this._parent, "dump", str);
  }
  void dump()() {
    Object_Call__void(this._parent, "dump");
  }
  auto performance()() {
    return Performance(Object_Getter__Handle(this._parent, "performance"));
  }
  auto getJSTestingFunctions()() {
    return JsObject(Object_Getter__Handle(this._parent, "getJSTestingFunctions"));
  }
  auto crypto()() {
    return Crypto(Object_Getter__Handle(this._parent, "crypto"));
  }
  string origin()() {
    return Object_Getter__string(this._parent, "origin");
  }
  string btoa()(string btoa) {
    return Object_Call_string__string(this._parent, "btoa", btoa);
  }
  string atob()(string atob) {
    return Object_Call_string__string(this._parent, "atob", atob);
  }
  int setTimeout(T2)(Function handler, int timeout /* = 0 */, scope auto ref T2 arguments) {
    // Any
    Handle _handle_arguments = getOrCreateHandle(arguments);
    auto result = WindowOrWorkerGlobalScope_setTimeout__Handle_int_Handle(this._parent, handler, timeout, _handle_arguments);
    dropHandle!(T2)(_handle_arguments);
    return result;
  }
  int setTimeout(T2)(string handler, int timeout /* = 0 */, scope auto ref T2 unused) {
    // Any
    Handle _handle_unused = getOrCreateHandle(unused);
    auto result = WindowOrWorkerGlobalScope_setTimeout__string_int_Handle(this._parent, handler, timeout, _handle_unused);
    dropHandle!(T2)(_handle_unused);
    return result;
  }
  void clearTimeout()(int handle /* = 0 */) {
    Object_Call_int__void(this._parent, "clearTimeout", handle);
  }
  void clearTimeout()() {
    Object_Call__void(this._parent, "clearTimeout");
  }
  int setInterval(T2)(Function handler, int timeout /* = 0 */, scope auto ref T2 arguments) {
    // Any
    Handle _handle_arguments = getOrCreateHandle(arguments);
    auto result = WindowOrWorkerGlobalScope_setInterval__Handle_int_Handle(this._parent, handler, timeout, _handle_arguments);
    dropHandle!(T2)(_handle_arguments);
    return result;
  }
  int setInterval(T2)(string handler, int timeout /* = 0 */, scope auto ref T2 unused) {
    // Any
    Handle _handle_unused = getOrCreateHandle(unused);
    auto result = WindowOrWorkerGlobalScope_setInterval__string_int_Handle(this._parent, handler, timeout, _handle_unused);
    dropHandle!(T2)(_handle_unused);
    return result;
  }
  void clearInterval()(int handle /* = 0 */) {
    Object_Call_int__void(this._parent, "clearInterval", handle);
  }
  void clearInterval()() {
    Object_Call__void(this._parent, "clearInterval");
  }
  auto createImageBitmap()(scope ref ImageBitmapSource aImage) {
    return JsPromise!(ImageBitmap)(Serialize_Object_VarArgCall!Handle(this._parent, "createImageBitmap", "SumType!(Handle,Handle,Handle,Handle,Handle,Handle,Handle,Handle)", tuple(libwasm.sumtype.match!(((ref aImage.Types[0] v) => 0),((ref aImage.Types[1] v) => 1),((ref aImage.Types[2] v) => 2),((ref aImage.Types[3] v) => 3),((ref aImage.Types[4] v) => 4),((ref aImage.Types[5] v) => 5),((ref aImage.Types[6] v) => 6),((ref aImage.Types[7] v) => 7))(aImage),tuple(libwasm.sumtype.match!(((ref aImage.Types[0] v) => cast(Handle)v.handle),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => cast(Handle)v.handle),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => cast(Handle)v.handle),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => cast(Handle)v.handle),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => cast(Handle)v.handle),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => cast(Handle)v.handle),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => cast(Handle)v.handle),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => cast(Handle)v.handle))(aImage)))));
  }
  auto createImageBitmap()(scope ref ImageBitmapSource aImage, int aSx, int aSy, int aSw, int aSh) {
    return JsPromise!(ImageBitmap)(Serialize_Object_VarArgCall!Handle(this._parent, "createImageBitmap", "SumType!(Handle,Handle,Handle,Handle,Handle,Handle,Handle,Handle);int;int;int;int", tuple(libwasm.sumtype.match!(((ref aImage.Types[0] v) => 0),((ref aImage.Types[1] v) => 1),((ref aImage.Types[2] v) => 2),((ref aImage.Types[3] v) => 3),((ref aImage.Types[4] v) => 4),((ref aImage.Types[5] v) => 5),((ref aImage.Types[6] v) => 6),((ref aImage.Types[7] v) => 7))(aImage),tuple(libwasm.sumtype.match!(((ref aImage.Types[0] v) => cast(Handle)v.handle),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => cast(Handle)v.handle),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => cast(Handle)v.handle),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => cast(Handle)v.handle),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => cast(Handle)v.handle),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => cast(Handle)v.handle),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => cast(Handle)v.handle),((ref aImage.Types[7] v) => Handle.init))(aImage),libwasm.sumtype.match!(((ref aImage.Types[0] v) => Handle.init),((ref aImage.Types[1] v) => Handle.init),((ref aImage.Types[2] v) => Handle.init),((ref aImage.Types[3] v) => Handle.init),((ref aImage.Types[4] v) => Handle.init),((ref aImage.Types[5] v) => Handle.init),((ref aImage.Types[6] v) => Handle.init),((ref aImage.Types[7] v) => cast(Handle)v.handle))(aImage)), aSx, aSy, aSw, aSh)));
  }
  auto fetch()(scope ref RequestInfo input, scope ref RequestInit init) {
    return JsPromise!(Response)(Serialize_Object_VarArgCall!Handle(this._parent, "fetch", "SumType!(Handle,string);Handle", tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => 0),((string v) => 1))(input),tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(input),libwasm.sumtype.match!(((ref input.Types[0] v) => string.init),((string v) => v))(input)), cast(Handle)init.handle)));
  }
  auto fetch()(scope ref RequestInfo input) {
    return JsPromise!(Response)(Serialize_Object_VarArgCall!Handle(this._parent, "fetch", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => 0),((string v) => 1))(input),tuple(libwasm.sumtype.match!(((ref input.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(input),libwasm.sumtype.match!(((ref input.Types[0] v) => string.init),((string v) => v))(input)))));
  }
  bool isSecureContext()() {
    return Object_Getter__bool(this._parent, "isSecureContext");
  }
  auto indexedDB()() {
    return recastOpt!(IDBFactory)(Object_Getter__OptionalHandle(this._parent, "indexedDB"));
  }
  auto caches()() {
    return CacheStorage(Object_Getter__Handle(this._parent, "caches"));
  }
}


extern (C) void WorkerGlobalScope_onerror_Set(Handle, bool, OnErrorEventHandlerNonNull);
extern (C) OnErrorEventHandler WorkerGlobalScope_onerror_Get(Handle);