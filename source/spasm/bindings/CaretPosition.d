module spasm.bindings.CaretPosition;

import spasm.types;
import spasm.bindings.DOMRect;
import spasm.bindings.Node;

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
    return Object_Getter__OptionalHandle(this.handle, "offsetNode");
  }
  uint offset()() {
    return Object_Getter__uint(this.handle, "offset");
  }
  auto getClientRect()() {
    return Object_Getter__OptionalHandle(this.handle, "getClientRect");
  }
}


