module spasm.bindings.StyleRuleChangeEvent;

import spasm.types;
import spasm.bindings.CSSRule;
import spasm.bindings.CSSStyleSheet;
import spasm.bindings.Event;

@safe:
nothrow:

struct StyleRuleChangeEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto stylesheet()() {
    return Object_Getter__OptionalHandle(this._parent, "stylesheet");
  }
  auto rule()() {
    return Object_Getter__OptionalHandle(this._parent, "rule");
  }
}
struct StyleRuleChangeEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return StyleRuleChangeEventInit(spasm_add__object());
  }
  void stylesheet(T0)(scope auto ref Optional!(T0) stylesheet) if (isTOrPointer!(T0, CSSStyleSheet)) {
    StyleRuleChangeEventInit_stylesheet_Set(this._parent, !stylesheet.empty, stylesheet.front._parent);
  }
  auto stylesheet()() {
    return Object_Getter__OptionalHandle(this._parent, "stylesheet");
  }
  void rule(T0)(scope auto ref Optional!(T0) rule) if (isTOrPointer!(T0, CSSRule)) {
    StyleRuleChangeEventInit_rule_Set(this._parent, !rule.empty, rule.front.handle);
  }
  auto rule()() {
    return Object_Getter__OptionalHandle(this._parent, "rule");
  }
}


extern (C) void StyleRuleChangeEventInit_stylesheet_Set(Handle, bool, Handle);
extern (C) void StyleRuleChangeEventInit_rule_Set(Handle, bool, Handle);