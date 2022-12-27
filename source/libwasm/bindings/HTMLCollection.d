module libwasm.bindings.HTMLCollection;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Element;

@safe:
nothrow:

struct HTMLCollection {
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
    return recastOpt!(Element)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
  auto namedItem()(string name) {
    return recastOpt!(Element)(Object_Call_string__OptionalHandle(this.handle, "namedItem", name));
  }
}


