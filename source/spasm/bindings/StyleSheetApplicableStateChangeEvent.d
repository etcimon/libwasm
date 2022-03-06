module spasm.bindings.StyleSheetApplicableStateChangeEvent;

import spasm.types;
import spasm.bindings.CSSStyleSheet;
import spasm.bindings.Event;

@safe:
nothrow:

struct StyleSheetApplicableStateChangeEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto stylesheet()() {
    return Object_Getter__OptionalHandle(this._parent, "stylesheet");
  }
  bool applicable()() {
    return Object_Getter__bool(this._parent, "applicable");
  }
}
struct StyleSheetApplicableStateChangeEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return StyleSheetApplicableStateChangeEventInit(spasm_add__object());
  }
  void stylesheet(T0)(scope auto ref Optional!(T0) stylesheet) if (isTOrPointer!(T0, CSSStyleSheet)) {
    StyleSheetApplicableStateChangeEventInit_stylesheet_Set(this._parent, !stylesheet.empty, stylesheet.front._parent);
  }
  auto stylesheet()() {
    return Object_Getter__OptionalHandle(this._parent, "stylesheet");
  }
  void applicable()(bool applicable) {
    Object_Call_bool__void(this._parent, "applicable", applicable);
  }
  bool applicable()() {
    return Object_Getter__bool(this._parent, "applicable");
  }
}


extern (C) void StyleSheetApplicableStateChangeEventInit_stylesheet_Set(Handle, bool, Handle);