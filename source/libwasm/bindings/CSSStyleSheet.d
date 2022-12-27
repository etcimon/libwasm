module libwasm.bindings.CSSStyleSheet;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.CSSRule;
import libwasm.bindings.CSSRuleList;
import libwasm.bindings.StyleSheet;

@safe:
nothrow:

struct CSSStyleSheet {
  nothrow:
  libwasm.bindings.StyleSheet.StyleSheet _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .StyleSheet(h);
  }
  auto ownerRule()() {
    return recastOpt!(CSSRule)(Object_Getter__OptionalHandle(this._parent, "ownerRule"));
  }
  auto cssRules()() {
    return CSSRuleList(Object_Getter__Handle(this._parent, "cssRules"));
  }
  CSSStyleSheetParsingMode parsingMode()() {
    return Object_Getter__int(this._parent, "parsingMode");
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
enum CSSStyleSheetParsingMode {
  author,
  user,
  agent
}


