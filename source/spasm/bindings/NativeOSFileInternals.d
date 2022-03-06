module spasm.bindings.NativeOSFileInternals;

import spasm.types;
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
    return NativeOSFileReadOptions(spasm_add__object());
  }
  void encoding(T0)(scope auto ref Optional!(T0) encoding) if (isTOrPointer!(T0, string)) {
    NativeOSFileReadOptions_encoding_Set(this.handle, !encoding.empty, encoding.front);
  }
  Optional!(string) encoding()() {
    return Object_Getter__OptionalString(this.handle, "encoding");
  }
  void bytes(T0)(scope auto ref Optional!(T0) bytes) if (isTOrPointer!(T0, uint)) {
    NativeOSFileReadOptions_bytes_Set(this.handle, !bytes.empty, bytes.front);
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
    return NativeOSFileWriteAtomicOptions(spasm_add__object());
  }
  void bytes(T0)(scope auto ref Optional!(T0) bytes) if (isTOrPointer!(T0, uint)) {
    NativeOSFileWriteAtomicOptions_bytes_Set(this.handle, !bytes.empty, bytes.front);
  }
  Optional!(uint) bytes()() {
    return Object_Getter__OptionalUint(this.handle, "bytes");
  }
  void tmpPath(T0)(scope auto ref Optional!(T0) tmpPath) if (isTOrPointer!(T0, string)) {
    NativeOSFileWriteAtomicOptions_tmpPath_Set(this.handle, !tmpPath.empty, tmpPath.front);
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
    NativeOSFileWriteAtomicOptions_backupTo_Set(this.handle, !backupTo.empty, backupTo.front);
  }
  Optional!(string) backupTo()() {
    return Object_Getter__OptionalString(this.handle, "backupTo");
  }
}


extern (C) void NativeOSFileReadOptions_encoding_Set(Handle, bool, string);
extern (C) void NativeOSFileReadOptions_bytes_Set(Handle, bool, uint);
extern (C) void NativeOSFileWriteAtomicOptions_bytes_Set(Handle, bool, uint);
extern (C) void NativeOSFileWriteAtomicOptions_tmpPath_Set(Handle, bool, string);
extern (C) void NativeOSFileWriteAtomicOptions_backupTo_Set(Handle, bool, string);