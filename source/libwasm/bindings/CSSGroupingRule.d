module libwasm.bindings.CSSGroupingRule;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.CSSRule;
import libwasm.bindings.CSSRuleList;

@safe:
nothrow:

struct CSSGroupingRule {
  nothrow:
  libwasm.bindings.CSSRule.CSSRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSRule(h);
  }
  auto cssRules()() {
    return CSSRuleList(Object_Getter__Handle(this._parent, "cssRules"));
  }
  uint insertRule()(string rule, uint index /* = 0 */) {
    return Serialize_Object_VarArgCall!uint(this._parent, "insertRule", "string;uint", tuple(rule, index));
  }
  uint insertRule()(string rule) {
    return Serialize_Object_VarArgCall!uint(this._parent, "insertRule", "string", tuple(rule));
  }
  void deleteRule()(uint index) {
    Object_Call_uint__void(this._parent, "deleteRule", index);
  }
}


