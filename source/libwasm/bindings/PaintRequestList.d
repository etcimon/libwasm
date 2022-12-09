module libwasm.bindings.PaintRequestList;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.PaintRequest;

@safe:
nothrow:

struct PaintRequestList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  auto item()(uint index) {
    return recastOpt!(PaintRequest)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
}


