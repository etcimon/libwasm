module libwasm.bindings.StyleSheetList;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.StyleSheet;

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
    return Optional!(StyleSheet)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
}


