module spasm.bindings.CSSStyleSheet;

import spasm.types;
import spasm.bindings.CSSRule;
import spasm.bindings.CSSRuleList;
import spasm.bindings.StyleSheet;

@safe:
nothrow:

struct CSSStyleSheet {
  nothrow:
  spasm.bindings.StyleSheet.StyleSheet _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .StyleSheet(h);
  }
  auto ownerRule()() {
    return Object_Getter__OptionalHandle(this._parent, "ownerRule");
  }
  auto cssRules()() {
    return CSSRuleList(Object_Getter__Handle(this._parent, "cssRules"));
  }
  CSSStyleSheetParsingMode parsingMode()() {
    return CSSStyleSheet_parsingMode_Get(this._parent);
  }
  uint insertRule()(string rule, uint index /* = 0 */) {
    return CSSStyleSheet_insertRule(this._parent, rule, index);
  }
  uint insertRule()(string rule) {
    return CSSStyleSheet_insertRule_0(this._parent, rule);
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


extern (C) CSSStyleSheetParsingMode CSSStyleSheet_parsingMode_Get(Handle);
extern (C) uint CSSStyleSheet_insertRule(Handle, string, uint);
extern (C) uint CSSStyleSheet_insertRule_0(Handle, string);