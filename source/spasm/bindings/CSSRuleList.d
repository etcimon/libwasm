module spasm.bindings.CSSRuleList;

import spasm.types;
import spasm.bindings.CSSRule;

@safe:
nothrow:

struct CSSRuleList {
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


