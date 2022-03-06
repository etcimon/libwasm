module spasm.bindings.CSSKeyframeRule;

import spasm.types;
import spasm.bindings.CSSRule;
import spasm.bindings.CSSStyleDeclaration;

@safe:
nothrow:

struct CSSKeyframeRule {
  nothrow:
  spasm.bindings.CSSRule.CSSRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSRule(h);
  }
  void keyText()(string keyText) {
    Object_Call_string__void(this._parent, "keyText", keyText);
  }
  string keyText()() {
    return Object_Getter__string(this._parent, "keyText");
  }
  auto style()() {
    return CSSStyleDeclaration(Object_Getter__Handle(this._parent, "style"));
  }
}


