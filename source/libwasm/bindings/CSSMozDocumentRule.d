module libwasm.bindings.CSSMozDocumentRule;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.CSSConditionRule;

@safe:
nothrow:

struct CSSMozDocumentRule {
  nothrow:
  libwasm.bindings.CSSConditionRule.CSSConditionRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSConditionRule(h);
  }
}


