module spasm.bindings.CSS;

import spasm.types;
@safe:
nothrow:

struct CSS {
  nothrow:
  static:
  bool supports()(string property, string value) {
    return CSS_supports(property, value);
  }
  bool supports()(string conditionText) {
    return CSS_supports(conditionText);
  }
  string escape()(string ident) {
    return CSS_escape(ident);
  }
}

extern (C) bool CSS_supports(string, string);
extern (C) string CSS_escape(string);