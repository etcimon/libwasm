module libwasm.bindings.NativeOSFileInternals;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct NativeOSFileReadOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return NativeOSFileReadOptions(libwasm_add__object());
  }
  void encoding(T0)(scope auto ref Optional!(T0) encoding) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "encoding", "Optional!(string)", tuple(!encoding.empty, encoding.front));
  }
  Optional!(string) encoding()() {
    return Object_Getter__OptionalString(this.handle, "encoding");
  }
  void bytes(T0)(scope auto ref Optional!(T0) bytes) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this.handle, "bytes", "Optional!(uint)", tuple(!bytes.empty, bytes.front));
  }
  Optional!(uint) bytes()() {
    return Object_Getter__OptionalUint(this.handle, "bytes");
  }
}
struct NativeOSFileWriteAtomicOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return NativeOSFileWriteAtomicOptions(libwasm_add__object());
  }
  void bytes(T0)(scope auto ref Optional!(T0) bytes) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this.handle, "bytes", "Optional!(uint)", tuple(!bytes.empty, bytes.front));
  }
  Optional!(uint) bytes()() {
    return Object_Getter__OptionalUint(this.handle, "bytes");
  }
  void tmpPath(T0)(scope auto ref Optional!(T0) tmpPath) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "tmpPath", "Optional!(string)", tuple(!tmpPath.empty, tmpPath.front));
  }
  Optional!(string) tmpPath()() {
    return Object_Getter__OptionalString(this.handle, "tmpPath");
  }
  void noOverwrite()(bool noOverwrite) {
    Object_Call_bool__void(this.handle, "noOverwrite", noOverwrite);
  }
  bool noOverwrite()() {
    return Object_Getter__bool(this.handle, "noOverwrite");
  }
  void flush()(bool flush) {
    Object_Call_bool__void(this.handle, "flush", flush);
  }
  bool flush()() {
    return Object_Getter__bool(this.handle, "flush");
  }
  void backupTo(T0)(scope auto ref Optional!(T0) backupTo) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "backupTo", "Optional!(string)", tuple(!backupTo.empty, backupTo.front));
  }
  Optional!(string) backupTo()() {
    return Object_Getter__OptionalString(this.handle, "backupTo");
  }
}


