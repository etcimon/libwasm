module libwasm.bindings.LinkStyle;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.StyleSheet;

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
    return Optional!(StyleSheet)(Object_Getter__OptionalHandle(this.handle, "sheet"));
  }
}


