module spasm.bindings.SVGPathSegList;

import spasm.types;
import spasm.bindings.SVGPathSeg;

@safe:
nothrow:

struct SVGPathSegList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint numberOfItems()() {
    return Object_Getter__uint(this.handle, "numberOfItems");
  }
  auto getItem()(uint index) {
    return SVGPathSeg(Object_Call_uint__Handle(this.handle, "getItem", index));
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
}


