module spasm.bindings.MediaKeyStatusMap;

import spasm.types;
@safe:
nothrow:

enum MediaKeyStatus {
  usable,
  expired,
  released,
  output_restricted,
  output_downscaled,
  status_pending,
  internal_error
}
struct MediaKeyStatusMap {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint size()() {
    return Object_Getter__uint(this.handle, "size");
  }
  bool has()(scope ref BufferSource keyId) {
    return MediaKeyStatusMap_has(this.handle, keyId.handle);
  }
  auto get()(scope ref BufferSource keyId) {
    return Any(Object_Call_Handle__Handle(this.handle, "get", keyId.handle));
  }
}


extern (C) bool MediaKeyStatusMap_has(Handle, Handle);