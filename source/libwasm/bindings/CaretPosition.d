module libwasm.bindings.CaretPosition;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DOMRect;
import libwasm.bindings.Node;

@safe:
nothrow:

struct CaretPosition {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto offsetNode()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "offsetNode"));
  }
  uint offset()() {
    return Object_Getter__uint(this.handle, "offset");
  }
  auto getClientRect()() {
    return recastOpt!(DOMRect)(Object_Getter__OptionalHandle(this.handle, "getClientRect"));
  }
}


