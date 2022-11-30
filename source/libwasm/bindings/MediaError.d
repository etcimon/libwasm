module libwasm.bindings.MediaError;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct MediaError {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort MEDIA_ERR_ABORTED = 1;
  enum ushort MEDIA_ERR_NETWORK = 2;
  enum ushort MEDIA_ERR_DECODE = 3;
  enum ushort MEDIA_ERR_SRC_NOT_SUPPORTED = 4;
  ushort code()() {
    return Object_Getter__ushort(this.handle, "code");
  }
  string message()() {
    return Object_Getter__string(this.handle, "message");
  }
}


