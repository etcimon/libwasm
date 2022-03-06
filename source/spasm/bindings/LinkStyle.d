module spasm.bindings.LinkStyle;

import spasm.types;
import spasm.bindings.StyleSheet;

@safe:
nothrow:

struct LinkStyle {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto sheet()() {
    return Object_Getter__OptionalHandle(this.handle, "sheet");
  }
}


