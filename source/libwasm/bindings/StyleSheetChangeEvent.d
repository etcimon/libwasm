module libwasm.bindings.StyleSheetChangeEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.CSSStyleSheet;
import libwasm.bindings.Event;

@safe:
nothrow:

struct StyleSheetChangeEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto stylesheet()() {
    return Optional!(CSSStyleSheet)(Object_Getter__OptionalHandle(this._parent, "stylesheet"));
  }
  bool documentSheet()() {
    return Object_Getter__bool(this._parent, "documentSheet");
  }
}
struct StyleSheetChangeEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return StyleSheetChangeEventInit(libwasm_add__object());
  }
  void stylesheet(T0)(scope auto ref Optional!(T0) stylesheet) if (isTOrPointer!(T0, CSSStyleSheet)) {
    Serialize_Object_VarArgCall!void(this._parent, "stylesheet", "Optional!Handle", tuple(!stylesheet.empty, cast(Handle)stylesheet.front._parent));
  }
  auto stylesheet()() {
    return Optional!(CSSStyleSheet)(Object_Getter__OptionalHandle(this._parent, "stylesheet"));
  }
  void documentSheet()(bool documentSheet) {
    Object_Call_bool__void(this._parent, "documentSheet", documentSheet);
  }
  bool documentSheet()() {
    return Object_Getter__bool(this._parent, "documentSheet");
  }
}


