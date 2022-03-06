module spasm.bindings.PopupBlockedEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.Window;

@safe:
nothrow:

struct PopupBlockedEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto requestingWindow()() {
    return Object_Getter__OptionalHandle(this._parent, "requestingWindow");
  }
  auto popupWindowURI()() {
    return Object_Getter__OptionalHandle(this._parent, "popupWindowURI");
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
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PopupBlockedEventInit(spasm_add__object());
  }
  void requestingWindow(T0)(scope auto ref Optional!(T0) requestingWindow) if (isTOrPointer!(T0, Window)) {
    PopupBlockedEventInit_requestingWindow_Set(this._parent, !requestingWindow.empty, requestingWindow.front._parent);
  }
  auto requestingWindow()() {
    return Object_Getter__OptionalHandle(this._parent, "requestingWindow");
  }
  void popupWindowURI(T0)(scope auto ref Optional!(T0) popupWindowURI) if (isTOrPointer!(T0, URI)) {
    PopupBlockedEventInit_popupWindowURI_Set(this._parent, !popupWindowURI.empty, popupWindowURI.front.handle);
  }
  auto popupWindowURI()() {
    return Object_Getter__OptionalHandle(this._parent, "popupWindowURI");
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


extern (C) void PopupBlockedEventInit_requestingWindow_Set(Handle, bool, Handle);
extern (C) void PopupBlockedEventInit_popupWindowURI_Set(Handle, bool, Handle);