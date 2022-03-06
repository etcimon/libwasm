module spasm.bindings.CSSFontFaceRule;

import spasm.types;
import spasm.bindings.CSSRule;
import spasm.bindings.CSSStyleDeclaration;

@safe:
nothrow:

struct CSSFontFaceRule {
  nothrow:
  spasm.bindings.CSSRule.CSSRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSRule(h);
  }
  auto style()() {
    return CSSStyleDeclaration(Object_Getter__Handle(this._parent, "style"));
  }
}


