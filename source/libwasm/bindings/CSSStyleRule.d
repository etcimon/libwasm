module libwasm.bindings.CSSStyleRule;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.CSSRule;
import libwasm.bindings.CSSStyleDeclaration;

@safe:
nothrow:

struct CSSStyleRule {
  nothrow:
  libwasm.bindings.CSSRule.CSSRule _parent;
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


