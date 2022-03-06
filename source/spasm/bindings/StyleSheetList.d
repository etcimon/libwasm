module spasm.bindings.StyleSheetList;

import spasm.types;
import spasm.bindings.StyleSheet;

@safe:
nothrow:

struct StyleSheetList {
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


