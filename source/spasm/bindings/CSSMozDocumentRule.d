module spasm.bindings.CSSMozDocumentRule;

import spasm.types;
import spasm.bindings.CSSConditionRule;

@safe:
nothrow:

struct CSSMozDocumentRule {
  nothrow:
  spasm.bindings.CSSConditionRule.CSSConditionRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSConditionRule(h);
  }
}


