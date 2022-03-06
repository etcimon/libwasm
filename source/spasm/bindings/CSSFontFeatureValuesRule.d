module spasm.bindings.CSSFontFeatureValuesRule;

import spasm.types;
import spasm.bindings.CSSRule;

@safe:
nothrow:

struct CSSFontFeatureValuesRule {
  nothrow:
  spasm.bindings.CSSRule.CSSRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSRule(h);
  }
  void fontFamily()(string fontFamily) {
    Object_Call_string__void(this._parent, "fontFamily", fontFamily);
  }
  string fontFamily()() {
    return Object_Getter__string(this._parent, "fontFamily");
  }
  void valueText()(string valueText) {
    Object_Call_string__void(this._parent, "valueText", valueText);
  }
  string valueText()() {
    return Object_Getter__string(this._parent, "valueText");
  }
}


