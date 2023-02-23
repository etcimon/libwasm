module libwasm.bindings.CSSFontFaceRule;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.CSSRule;
import libwasm.bindings.CSSStyleDeclaration;

@safe:
nothrow:

struct CSSFontFaceRule {
  nothrow:
  libwasm.bindings.CSSRule.CSSRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSRule(h);
  }
  auto style()() {
    return CSSStyleDeclaration(Object_Getter__Handle(this._parent, "style"));
  }
}


