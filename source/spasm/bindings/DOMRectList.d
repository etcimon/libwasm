module spasm.bindings.DOMRectList;

import spasm.types;
import spasm.bindings.DOMRect;

@safe:
nothrow:

struct DOMRectList {
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
    return Object_Call_uint__OptionalHandle(this.handle, "item", index);
  }
}


