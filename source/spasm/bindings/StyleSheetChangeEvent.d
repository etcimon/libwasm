module spasm.bindings.StyleSheetChangeEvent;

import spasm.types;
import spasm.bindings.CSSStyleSheet;
import spasm.bindings.Event;

@safe:
nothrow:

struct StyleSheetChangeEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto stylesheet()() {
    return Object_Getter__OptionalHandle(this._parent, "stylesheet");
  }
  bool documentSheet()() {
    return Object_Getter__bool(this._parent, "documentSheet");
  }
}
struct StyleSheetChangeEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return StyleSheetChangeEventInit(spasm_add__object());
  }
  void stylesheet(T0)(scope auto ref Optional!(T0) stylesheet) if (isTOrPointer!(T0, CSSStyleSheet)) {
    StyleSheetChangeEventInit_stylesheet_Set(this._parent, !stylesheet.empty, stylesheet.front._parent);
  }
  auto stylesheet()() {
    return Object_Getter__OptionalHandle(this._parent, "stylesheet");
  }
  void documentSheet()(bool documentSheet) {
    Object_Call_bool__void(this._parent, "documentSheet", documentSheet);
  }
  bool documentSheet()() {
    return Object_Getter__bool(this._parent, "documentSheet");
  }
}


extern (C) void StyleSheetChangeEventInit_stylesheet_Set(Handle, bool, Handle);