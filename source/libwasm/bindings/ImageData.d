module libwasm.bindings.ImageData;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct ImageData {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint width()() {
    return Object_Getter__uint(this.handle, "width");
  }
  uint height()() {
    return Object_Getter__uint(this.handle, "height");
  }
  auto data()() {
    return Uint8ClampedArray(Object_Getter__Handle(this.handle, "data"));
  }
}


