module libwasm.bindings.PopupBlockedEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.Window;

@safe:
nothrow:

struct PopupBlockedEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto requestingWindow()() {
    return Optional!(Window)(Object_Getter__OptionalHandle(this._parent, "requestingWindow"));
  }
  auto popupWindowURI()() {
    return Optional!(URI)(Object_Getter__OptionalHandle(this._parent, "popupWindowURI"));
  }
  Optional!(string) popupWindowName()() {
    return Object_Getter__OptionalString(this._parent, "popupWindowName");
  }
  Optional!(string) popupWindowFeatures()() {
    return Object_Getter__OptionalString(this._parent, "popupWindowFeatures");
  }
}
struct PopupBlockedEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PopupBlockedEventInit(libwasm_add__object());
  }
  void requestingWindow(T0)(scope auto ref Optional!(T0) requestingWindow) if (isTOrPointer!(T0, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "requestingWindow", "Optional!Handle", tuple(!requestingWindow.empty, cast(Handle)requestingWindow.front._parent));
  }
  auto requestingWindow()() {
    return Optional!(Window)(Object_Getter__OptionalHandle(this._parent, "requestingWindow"));
  }
  void popupWindowURI(T0)(scope auto ref Optional!(T0) popupWindowURI) if (isTOrPointer!(T0, URI)) {
    Serialize_Object_VarArgCall!void(this._parent, "popupWindowURI", "Optional!Handle", tuple(!popupWindowURI.empty, cast(Handle)popupWindowURI.front.handle));
  }
  auto popupWindowURI()() {
    return Optional!(URI)(Object_Getter__OptionalHandle(this._parent, "popupWindowURI"));
  }
  void popupWindowName()(string popupWindowName) {
    Object_Call_string__void(this._parent, "popupWindowName", popupWindowName);
  }
  string popupWindowName()() {
    return Object_Getter__string(this._parent, "popupWindowName");
  }
  void popupWindowFeatures()(string popupWindowFeatures) {
    Object_Call_string__void(this._parent, "popupWindowFeatures", popupWindowFeatures);
  }
  string popupWindowFeatures()() {
    return Object_Getter__string(this._parent, "popupWindowFeatures");
  }
}


