module libwasm.bindings.FileReaderSync;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Blob;

@safe:
nothrow:

struct FileReaderSync {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto readAsArrayBuffer()(scope ref Blob blob) {
    return ArrayBuffer(Object_Call_Handle__Handle(this.handle, "readAsArrayBuffer", blob.handle));
  }
  string readAsBinaryString()(scope ref Blob blob) {
    return Serialize_Object_VarArgCall!string(this.handle, "readAsBinaryString", "Handle", tuple(cast(Handle)blob.handle));
  }
  string readAsText()(scope ref Blob blob, string encoding) {
    return Serialize_Object_VarArgCall!string(this.handle, "readAsText", "Handle;string", tuple(cast(Handle)blob.handle, encoding));
  }
  string readAsText()(scope ref Blob blob) {
    return Serialize_Object_VarArgCall!string(this.handle, "readAsText", "Handle", tuple(cast(Handle)blob.handle));
  }
  string readAsDataURL()(scope ref Blob blob) {
    return Serialize_Object_VarArgCall!string(this.handle, "readAsDataURL", "Handle", tuple(cast(Handle)blob.handle));
  }
}


