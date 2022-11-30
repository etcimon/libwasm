module libwasm.bindings.CSSConditionRule;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.CSSGroupingRule;

@safe:
nothrow:

struct CSSConditionRule {
  nothrow:
  libwasm.bindings.CSSGroupingRule.CSSGroupingRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSGroupingRule(h);
  }
  void conditionText()(string conditionText) {
    Object_Call_string__void(this._parent, "conditionText", conditionText);
  }
  string conditionText()() {
    return Object_Getter__string(this._parent, "conditionText");
  }
}


