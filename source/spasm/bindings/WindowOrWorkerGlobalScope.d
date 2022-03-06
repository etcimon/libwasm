module spasm.bindings.WindowOrWorkerGlobalScope;

import spasm.types;
import spasm.bindings.CacheStorage;
import spasm.bindings.Function;
import spasm.bindings.IDBFactory;
import spasm.bindings.ImageBitmap;
import spasm.bindings.Request;
import spasm.bindings.Response;

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
    return Promise!(ImageBitmap)(WindowOrWorkerGlobalScope_createImageBitmap__ImageBitmapSource(this.handle, aImage));
  }
  auto createImageBitmap()(scope ref ImageBitmapSource aImage, int aSx, int aSy, int aSw, int aSh) {
    return Promise!(ImageBitmap)(WindowOrWorkerGlobalScope_createImageBitmap__ImageBitmapSource_int_int_int_int(this.handle, aImage, aSx, aSy, aSw, aSh));
  }
  auto fetch()(scope ref RequestInfo input, scope ref RequestInit init) {
    return Promise!(Response)(WindowOrWorkerGlobalScope_fetch(this.handle, input, init.handle));
  }
  auto fetch()(scope ref RequestInfo input) {
    return Promise!(Response)(WindowOrWorkerGlobalScope_fetch_0(this.handle, input));
  }
  bool isSecureContext()() {
    return Object_Getter__bool(this.handle, "isSecureContext");
  }
  auto indexedDB()() {
    return Object_Getter__OptionalHandle(this.handle, "indexedDB");
  }
  auto caches()() {
    return CacheStorage(Object_Getter__Handle(this.handle, "caches"));
  }
}


extern (C) int WindowOrWorkerGlobalScope_setTimeout__Handle_int_Handle(Handle, Function, int, Handle);
extern (C) int WindowOrWorkerGlobalScope_setTimeout__string_int_Handle(Handle, string, int, Handle);
extern (C) int WindowOrWorkerGlobalScope_setInterval__Handle_int_Handle(Handle, Function, int, Handle);
extern (C) int WindowOrWorkerGlobalScope_setInterval__string_int_Handle(Handle, string, int, Handle);
extern (C) Handle WindowOrWorkerGlobalScope_createImageBitmap__ImageBitmapSource(Handle, scope ref ImageBitmapSource);
extern (C) Handle WindowOrWorkerGlobalScope_createImageBitmap__ImageBitmapSource_int_int_int_int(Handle, scope ref ImageBitmapSource, int, int, int, int);
extern (C) Handle WindowOrWorkerGlobalScope_fetch(Handle, scope ref RequestInfo, Handle);
extern (C) Handle WindowOrWorkerGlobalScope_fetch_0(Handle, scope ref RequestInfo);