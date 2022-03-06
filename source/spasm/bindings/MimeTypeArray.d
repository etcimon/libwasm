module spasm.bindings.MimeTypeArray;

import spasm.types;
import spasm.bindings.MimeType;

@safe:
nothrow:

struct MimeTypeArray {
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


