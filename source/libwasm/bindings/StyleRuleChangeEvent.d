module libwasm.bindings.StyleRuleChangeEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.CSSRule;
import libwasm.bindings.CSSStyleSheet;
import libwasm.bindings.Event;

@safe:
nothrow:

struct StyleRuleChangeEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto stylesheet()() {
    return recastOpt!(CSSStyleSheet)(Object_Getter__OptionalHandle(this._parent, "stylesheet"));
  }
  auto rule()() {
    return recastOpt!(CSSRule)(Object_Getter__OptionalHandle(this._parent, "rule"));
  }
}
struct StyleRuleChangeEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return StyleRuleChangeEventInit(libwasm_add__object());
  }
  void stylesheet(T0)(scope auto ref Optional!(T0) stylesheet) if (isTOrPointer!(T0, CSSStyleSheet)) {
    Serialize_Object_VarArgCall!void(this._parent, "stylesheet", "Optional!Handle", tuple(!stylesheet.empty, cast(Handle)stylesheet.front._parent));
  }
  auto stylesheet()() {
    return recastOpt!(CSSStyleSheet)(Object_Getter__OptionalHandle(this._parent, "stylesheet"));
  }
  void rule(T0)(scope auto ref Optional!(T0) rule) if (isTOrPointer!(T0, CSSRule)) {
    Serialize_Object_VarArgCall!void(this._parent, "rule", "Optional!Handle", tuple(!rule.empty, cast(Handle)rule.front.handle));
  }
  auto rule()() {
    return recastOpt!(CSSRule)(Object_Getter__OptionalHandle(this._parent, "rule"));
  }
}


