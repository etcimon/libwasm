module spasm.bindings.CSSMediaRule;

import spasm.types;
import spasm.bindings.CSSConditionRule;
import spasm.bindings.MediaList;

@safe:
nothrow:

struct CSSMediaRule {
  nothrow:
  spasm.bindings.CSSConditionRule.CSSConditionRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSConditionRule(h);
  }
  auto media()() {
    return MediaList(Object_Getter__Handle(this._parent, "media"));
  }
}


