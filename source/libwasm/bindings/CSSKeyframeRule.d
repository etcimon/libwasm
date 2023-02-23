module libwasm.bindings.CSSKeyframeRule;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.CSSRule;
import libwasm.bindings.CSSStyleDeclaration;

@safe:
nothrow:

struct CSSKeyframeRule {
  nothrow:
  libwasm.bindings.CSSRule.CSSRule _parent;
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


