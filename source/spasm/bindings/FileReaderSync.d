module spasm.bindings.FileReaderSync;

import spasm.types;
import spasm.bindings.Blob;

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
    return FileReaderSync_readAsBinaryString(this.handle, blob.handle);
  }
  string readAsText()(scope ref Blob blob, string encoding) {
    return FileReaderSync_readAsText(this.handle, blob.handle, encoding);
  }
  string readAsText()(scope ref Blob blob) {
    return FileReaderSync_readAsText_0(this.handle, blob.handle);
  }
  string readAsDataURL()(scope ref Blob blob) {
    return FileReaderSync_readAsDataURL(this.handle, blob.handle);
  }
}


extern (C) string FileReaderSync_readAsBinaryString(Handle, Handle);
extern (C) string FileReaderSync_readAsText(Handle, Handle, string);
extern (C) string FileReaderSync_readAsText_0(Handle, Handle);
extern (C) string FileReaderSync_readAsDataURL(Handle, Handle);