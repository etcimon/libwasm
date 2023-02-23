module libwasm.bindings.IDBFileHandle;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Blob;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.FileMode;
import libwasm.bindings.IDBFileRequest;
import libwasm.bindings.IDBMutableFile;

@safe:
nothrow:

struct IDBFileHandle {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto mutableFile()() {
    return recastOpt!(IDBMutableFile)(Object_Getter__OptionalHandle(this._parent, "mutableFile"));
  }
  auto fileHandle()() {
    return recastOpt!(IDBMutableFile)(Object_Getter__OptionalHandle(this._parent, "fileHandle"));
  }
  FileMode mode()() {
    return Object_Getter__int(this._parent, "mode");
  }
  bool active()() {
    return Object_Getter__bool(this._parent, "active");
  }
  void location(T0)(scope auto ref Optional!(T0) location) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this._parent, "location", "Optional!(uint)", tuple(!location.empty, location.front));
  }
  Optional!(uint) location()() {
    return Object_Getter__OptionalUint(this._parent, "location");
  }
  auto getMetadata()(scope ref IDBFileMetadataParameters parameters) {
    return recastOpt!(IDBFileRequest)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "getMetadata", "Handle", tuple(cast(Handle)parameters.handle)));
  }
  auto getMetadata()() {
    return recastOpt!(IDBFileRequest)(Object_Getter__OptionalHandle(this._parent, "getMetadata"));
  }
  auto readAsArrayBuffer()(uint size) {
    return recastOpt!(IDBFileRequest)(Object_Call_uint__OptionalHandle(this._parent, "readAsArrayBuffer", size));
  }
  auto readAsText(T1)(uint size, scope auto ref Optional!(T1) encoding /* = no!(string) */) if (isTOrPointer!(T1, string)) {
    return recastOpt!(IDBFileRequest)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "readAsText", "uint;Optional!(string)", tuple(size, !encoding.empty, encoding.front)));
  }
  auto readAsText()(uint size) {
    return recastOpt!(IDBFileRequest)(Object_Call_uint__OptionalHandle(this._parent, "readAsText", size));
  }
  auto write()(scope ref SumType!(string, ArrayBuffer, ArrayBufferView, Blob) value) {
    return recastOpt!(IDBFileRequest)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "write", "SumType!(string,Handle,Handle,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref value.Types[1] v) => 1),((ref value.Types[2] v) => 2),((ref value.Types[3] v) => 3))(value),tuple(libwasm.sumtype.match!(((string v) => v),((ref value.Types[1] v) => string.init),((ref value.Types[2] v) => string.init),((ref value.Types[3] v) => string.init))(value),libwasm.sumtype.match!(((string v) => Handle.init),((ref value.Types[1] v) => cast(Handle)v.handle),((ref value.Types[2] v) => Handle.init),((ref value.Types[3] v) => Handle.init))(value),libwasm.sumtype.match!(((string v) => Handle.init),((ref value.Types[1] v) => Handle.init),((ref value.Types[2] v) => cast(Handle)v.handle),((ref value.Types[3] v) => Handle.init))(value),libwasm.sumtype.match!(((string v) => Handle.init),((ref value.Types[1] v) => Handle.init),((ref value.Types[2] v) => Handle.init),((ref value.Types[3] v) => cast(Handle)v.handle))(value)))));
  }
  auto append()(scope ref SumType!(string, ArrayBuffer, ArrayBufferView, Blob) value) {
    return recastOpt!(IDBFileRequest)(Serialize_Object_VarArgCall!(Optional!Handle)(this._parent, "append", "SumType!(string,Handle,Handle,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref value.Types[1] v) => 1),((ref value.Types[2] v) => 2),((ref value.Types[3] v) => 3))(value),tuple(libwasm.sumtype.match!(((string v) => v),((ref value.Types[1] v) => string.init),((ref value.Types[2] v) => string.init),((ref value.Types[3] v) => string.init))(value),libwasm.sumtype.match!(((string v) => Handle.init),((ref value.Types[1] v) => cast(Handle)v.handle),((ref value.Types[2] v) => Handle.init),((ref value.Types[3] v) => Handle.init))(value),libwasm.sumtype.match!(((string v) => Handle.init),((ref value.Types[1] v) => Handle.init),((ref value.Types[2] v) => cast(Handle)v.handle),((ref value.Types[3] v) => Handle.init))(value),libwasm.sumtype.match!(((string v) => Handle.init),((ref value.Types[1] v) => Handle.init),((ref value.Types[2] v) => Handle.init),((ref value.Types[3] v) => cast(Handle)v.handle))(value)))));
  }
  auto truncate()(uint size) {
    return recastOpt!(IDBFileRequest)(Object_Call_uint__OptionalHandle(this._parent, "truncate", size));
  }
  auto truncate()() {
    return recastOpt!(IDBFileRequest)(Object_Getter__OptionalHandle(this._parent, "truncate"));
  }
  auto flush()() {
    return recastOpt!(IDBFileRequest)(Object_Getter__OptionalHandle(this._parent, "flush"));
  }
  void abort()() {
    Object_Call__void(this._parent, "abort");
  }
  void oncomplete(T0)(scope auto ref Optional!(T0) oncomplete) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "oncomplete", !oncomplete.empty, oncomplete.front);
  }
  EventHandler oncomplete()() {
    return Object_Getter__EventHandler(this._parent, "oncomplete");
  }
  void onabort(T0)(scope auto ref Optional!(T0) onabort) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onabort", !onabort.empty, onabort.front);
  }
  EventHandler onabort()() {
    return Object_Getter__EventHandler(this._parent, "onabort");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
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
    return IDBFileMetadataParameters(libwasm_add__object());
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


