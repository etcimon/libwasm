module libwasm.bindings.PaintRequest;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DOMRect;

@safe:
nothrow:

struct PaintRequest {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto clientRect()() {
    return DOMRect(Object_Getter__Handle(this.handle, "clientRect"));
  }
  string reason()() {
    return Object_Getter__string(this.handle, "reason");
  }
}


