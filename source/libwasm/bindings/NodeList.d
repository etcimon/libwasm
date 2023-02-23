module libwasm.bindings.NodeList;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Node;

@safe:
nothrow:

struct NodeList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto item()(uint index) {
    return recastOpt!(Node)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
}


