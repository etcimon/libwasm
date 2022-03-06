module spasm.bindings.CSSStyleRule;

import spasm.types;
import spasm.bindings.CSSRule;
import spasm.bindings.CSSStyleDeclaration;

@safe:
nothrow:

struct CSSStyleRule {
  nothrow:
  spasm.bindings.CSSRule.CSSRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSRule(h);
  }
  void selectorText()(string selectorText) {
    Object_Call_string__void(this._parent, "selectorText", selectorText);
  }
  string selectorText()() {
    return Object_Getter__string(this._parent, "selectorText");
  }
  auto style()() {
    return CSSStyleDeclaration(Object_Getter__Handle(this._parent, "style"));
  }
}


