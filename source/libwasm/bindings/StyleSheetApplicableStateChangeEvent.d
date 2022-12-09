module libwasm.bindings.StyleSheetApplicableStateChangeEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.CSSStyleSheet;
import libwasm.bindings.Event;

@safe:
nothrow:

struct StyleSheetApplicableStateChangeEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto stylesheet()() {
    return recastOpt!(CSSStyleSheet)(Object_Getter__OptionalHandle(this._parent, "stylesheet"));
  }
  bool applicable()() {
    return Object_Getter__bool(this._parent, "applicable");
  }
}
struct StyleSheetApplicableStateChangeEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return StyleSheetApplicableStateChangeEventInit(libwasm_add__object());
  }
  void stylesheet(T0)(scope auto ref Optional!(T0) stylesheet) if (isTOrPointer!(T0, CSSStyleSheet)) {
    Serialize_Object_VarArgCall!void(this._parent, "stylesheet", "Optional!Handle", tuple(!stylesheet.empty, cast(Handle)stylesheet.front._parent));
  }
  auto stylesheet()() {
    return recastOpt!(CSSStyleSheet)(Object_Getter__OptionalHandle(this._parent, "stylesheet"));
  }
  void applicable()(bool applicable) {
    Object_Call_bool__void(this._parent, "applicable", applicable);
  }
  bool applicable()() {
    return Object_Getter__bool(this._parent, "applicable");
  }
}


