module libwasm.bindings.CSS;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct CSS {
  nothrow:
  static:
  bool supports()(string property, string value) {
    return CSS_supports(this.handle, property, value);
  }
  bool supports()(string conditionText) {
    return Static_Call_string__bool("CSS", "supports", conditionText);
  string escape()(string ident) {
    return Static_Call_string__string("CSS", "escape", ident);
  }
  }
}