module spasm.bindings.WorkerGlobalScope;

import spasm.types;
import spasm.bindings.CacheStorage;
import spasm.bindings.Crypto;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.Function;
import spasm.bindings.IDBFactory;
import spasm.bindings.ImageBitmap;
import spasm.bindings.Performance;
import spasm.bindings.Request;
import spasm.bindings.Response;
import spasm.bindings.WindowOrWorkerGlobalScope;
import spasm.bindings.WorkerLocation;
import spasm.bindings.WorkerNavigator;

@safe:
nothrow:

struct WorkerGlobalScope {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
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
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, OnErrorEventHandler)) {
    WorkerGlobalScope_onerror_Set(this._parent, !onerror.empty, onerror.front);
  }
  OnErrorEventHandler onerror()() {
    return WorkerGlobalScope_onerror_Get(this._parent);
  }
  void onoffline(T0)(scope auto ref Optional!(T0) onoffline) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onoffline", !onoffline.empty, onoffline.front);
  }
  EventHandler onoffline()() {
    return Object_Getter__EventHandler(this._parent, "onoffline");
  }
  void ononline(T0)(scope auto ref Optional!(T0) ononline) if (isTOrPointer!(T0, EventHandler)) {
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
    return Promise!(ImageBitmap)(WindowOrWorkerGlobalScope_createImageBitmap__ImageBitmapSource(this._parent, aImage));
  }
  auto createImageBitmap()(scope ref ImageBitmapSource aImage, int aSx, int aSy, int aSw, int aSh) {
    return Promise!(ImageBitmap)(WindowOrWorkerGlobalScope_createImageBitmap__ImageBitmapSource_int_int_int_int(this._parent, aImage, aSx, aSy, aSw, aSh));
  }
  auto fetch()(scope ref RequestInfo input, scope ref RequestInit init) {
    return Promise!(Response)(WindowOrWorkerGlobalScope_fetch(this._parent, input, init.handle));
  }
  auto fetch()(scope ref RequestInfo input) {
    return Promise!(Response)(WindowOrWorkerGlobalScope_fetch_0(this._parent, input));
  }
  bool isSecureContext()() {
    return Object_Getter__bool(this._parent, "isSecureContext");
  }
  auto indexedDB()() {
    return Object_Getter__OptionalHandle(this._parent, "indexedDB");
  }
  auto caches()() {
    return CacheStorage(Object_Getter__Handle(this._parent, "caches"));
  }
}


extern (C) void WorkerGlobalScope_onerror_Set(Handle, bool, OnErrorEventHandlerNonNull);
extern (C) OnErrorEventHandler WorkerGlobalScope_onerror_Get(Handle);