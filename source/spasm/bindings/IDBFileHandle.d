module spasm.bindings.IDBFileHandle;

import spasm.types;
import spasm.bindings.Blob;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.FileMode;
import spasm.bindings.IDBFileRequest;
import spasm.bindings.IDBMutableFile;

@safe:
nothrow:

struct IDBFileHandle {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto mutableFile()() {
    return Object_Getter__OptionalHandle(this._parent, "mutableFile");
  }
  auto fileHandle()() {
    return Object_Getter__OptionalHandle(this._parent, "fileHandle");
  }
  FileMode mode()() {
    return IDBFileHandle_mode_Get(this._parent);
  }
  bool active()() {
    return Object_Getter__bool(this._parent, "active");
  }
  void location(T0)(scope auto ref Optional!(T0) location) if (isTOrPointer!(T0, uint)) {
    IDBFileHandle_location_Set(this._parent, !location.empty, location.front);
  }
  Optional!(uint) location()() {
    return Object_Getter__OptionalUint(this._parent, "location");
  }
  auto getMetadata()(scope ref IDBFileMetadataParameters parameters) {
    return IDBFileHandle_getMetadata(this._parent, parameters.handle);
  }
  auto getMetadata()() {
    return Object_Getter__OptionalHandle(this._parent, "getMetadata");
  }
  auto readAsArrayBuffer()(uint size) {
    return Object_Call_uint__OptionalHandle(this._parent, "readAsArrayBuffer", size);
  }
  auto readAsText(T1)(uint size, scope auto ref Optional!(T1) encoding /* = no!(string) */) if (isTOrPointer!(T1, string)) {
    return IDBFileHandle_readAsText(this._parent, size, !encoding.empty, encoding.front);
  }
  auto readAsText()(uint size) {
    return Object_Call_uint__OptionalHandle(this._parent, "readAsText", size);
  }
  auto write()(scope ref SumType!(string, ArrayBuffer, ArrayBufferView, Blob) value) {
    return IDBFileHandle_write(this._parent, value);
  }
  auto append()(scope ref SumType!(string, ArrayBuffer, ArrayBufferView, Blob) value) {
    return IDBFileHandle_append(this._parent, value);
  }
  auto truncate()(uint size) {
    return Object_Call_uint__OptionalHandle(this._parent, "truncate", size);
  }
  auto truncate()() {
    return Object_Getter__OptionalHandle(this._parent, "truncate");
  }
  auto flush()() {
    return Object_Getter__OptionalHandle(this._parent, "flush");
  }
  void abort()() {
    Object_Call__void(this._parent, "abort");
  }
  void oncomplete(T0)(scope auto ref Optional!(T0) oncomplete) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncomplete", !oncomplete.empty, oncomplete.front);
  }
  EventHandler oncomplete()() {
    return Object_Getter__EventHandler(this._parent, "oncomplete");
  }
  void onabort(T0)(scope auto ref Optional!(T0) onabort) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onabort", !onabort.empty, onabort.front);
  }
  EventHandler onabort()() {
    return Object_Getter__EventHandler(this._parent, "onabort");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
}
struct IDBFileMetadataParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return IDBFileMetadataParameters(spasm_add__object());
  }
  void size()(bool size) {
    Object_Call_bool__void(this.handle, "size", size);
  }
  bool size()() {
    return Object_Getter__bool(this.handle, "size");
  }
  void lastModified()(bool lastModified) {
    Object_Call_bool__void(this.handle, "lastModified", lastModified);
  }
  bool lastModified()() {
    return Object_Getter__bool(this.handle, "lastModified");
  }
}


extern (C) FileMode IDBFileHandle_mode_Get(Handle);
extern (C) void IDBFileHandle_location_Set(Handle, bool, uint);
extern (C) Optional!(IDBFileRequest) IDBFileHandle_getMetadata(Handle, Handle);
extern (C) Optional!(IDBFileRequest) IDBFileHandle_readAsText(Handle, uint, bool, string);
extern (C) Optional!(IDBFileRequest) IDBFileHandle_write(Handle, scope ref SumType!(string, ArrayBuffer, ArrayBufferView, Blob));
extern (C) Optional!(IDBFileRequest) IDBFileHandle_append(Handle, scope ref SumType!(string, ArrayBuffer, ArrayBufferView, Blob));