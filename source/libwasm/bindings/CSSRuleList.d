module libwasm.bindings.CSSRuleList;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.CSSRule;

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
    return recastOpt!(CSSRule)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
}


