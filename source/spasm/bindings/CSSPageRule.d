module spasm.bindings.CSSPageRule;

import spasm.types;
import spasm.bindings.CSSRule;
import spasm.bindings.CSSStyleDeclaration;

@safe:
nothrow:

struct CSSPageRule {
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


