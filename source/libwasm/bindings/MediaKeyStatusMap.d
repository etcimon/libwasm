module libwasm.bindings.MediaKeyStatusMap;

import libwasm.types;

import libwasm.memory.ct: tuple;
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
    return Serialize_Object_VarArgCall!bool(this.handle, "has", "Handle", tuple(cast(Handle)keyId.handle));
  }
  auto get()(scope ref BufferSource keyId) {
    return Any(Object_Call_Handle__Handle(this.handle, "get", keyId.handle));
  }
}


