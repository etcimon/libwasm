module spasm.bindings.CSSKeyframesRule;

import spasm.types;
import spasm.bindings.CSSKeyframeRule;
import spasm.bindings.CSSRule;
import spasm.bindings.CSSRuleList;

@safe:
nothrow:

struct CSSKeyframesRule {
  nothrow:
  spasm.bindings.CSSRule.CSSRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSRule(h);
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  auto cssRules()() {
    return CSSRuleList(Object_Getter__Handle(this._parent, "cssRules"));
  }
  void appendRule()(string rule) {
    Object_Call_string__void(this._parent, "appendRule", rule);
  }
  void deleteRule()(string select) {
    Object_Call_string__void(this._parent, "deleteRule", select);
  }
  auto findRule()(string select) {
    return Object_Call_string__OptionalHandle(this._parent, "findRule", select);
  }
}


