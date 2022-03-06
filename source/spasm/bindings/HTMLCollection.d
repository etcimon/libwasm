module spasm.bindings.HTMLCollection;

import spasm.types;
import spasm.bindings.Element;

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
    return Object_Call_uint__OptionalHandle(this.handle, "item", index);
  }
  auto namedItem()(string name) {
    return Object_Call_string__OptionalHandle(this.handle, "namedItem", name);
  }
}


