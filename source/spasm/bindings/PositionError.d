module spasm.bindings.PositionError;

import spasm.types;
@safe:
nothrow:

struct PositionError {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort PERMISSION_DENIED = 1;
  enum ushort POSITION_UNAVAILABLE = 2;
  enum ushort TIMEOUT = 3;
  ushort code()() {
    return Object_Getter__ushort(this.handle, "code");
  }
  string message()() {
    return Object_Getter__string(this.handle, "message");
  }
}


