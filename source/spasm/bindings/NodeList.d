module spasm.bindings.NodeList;

import spasm.types;
import spasm.bindings.Node;

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
    return Object_Call_uint__OptionalHandle(this.handle, "item", index);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
}


