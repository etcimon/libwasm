module spasm.bindings.CSSGroupingRule;

import spasm.types;
import spasm.bindings.CSSRule;
import spasm.bindings.CSSRuleList;

@safe:
nothrow:

struct CSSGroupingRule {
  nothrow:
  spasm.bindings.CSSRule.CSSRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSRule(h);
  }
  auto cssRules()() {
    return CSSRuleList(Object_Getter__Handle(this._parent, "cssRules"));
  }
  uint insertRule()(string rule, uint index /* = 0 */) {
    return CSSGroupingRule_insertRule(this._parent, rule, index);
  }
  uint insertRule()(string rule) {
    return CSSGroupingRule_insertRule_0(this._parent, rule);
  }
  void deleteRule()(uint index) {
    Object_Call_uint__void(this._parent, "deleteRule", index);
  }
}


extern (C) uint CSSGroupingRule_insertRule(Handle, string, uint);
extern (C) uint CSSGroupingRule_insertRule_0(Handle, string);