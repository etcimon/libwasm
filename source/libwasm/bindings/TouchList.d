module libwasm.bindings.TouchList;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Touch;

@safe:
nothrow:

struct TouchList {
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
    return Optional!(Touch)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
}

