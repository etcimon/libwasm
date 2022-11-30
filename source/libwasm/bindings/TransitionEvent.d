module libwasm.bindings.TransitionEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct TransitionEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string propertyName()() {
    return Object_Getter__string(this._parent, "propertyName");
  }
  float elapsedTime()() {
    return Object_Getter__float(this._parent, "elapsedTime");
  }
  string pseudoElement()() {
    return Object_Getter__string(this._parent, "pseudoElement");
  }
}
struct TransitionEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return TransitionEventInit(libwasm_add__object());
  }
  void propertyName()(string propertyName) {
    Object_Call_string__void(this._parent, "propertyName", propertyName);
  }
  string propertyName()() {
    return Object_Getter__string(this._parent, "propertyName");
  }
  void elapsedTime()(float elapsedTime) {
    Object_Call_float__void(this._parent, "elapsedTime", elapsedTime);
  }
  float elapsedTime()() {
    return Object_Getter__float(this._parent, "elapsedTime");
  }
  void pseudoElement()(string pseudoElement) {
    Object_Call_string__void(this._parent, "pseudoElement", pseudoElement);
  }
  string pseudoElement()() {
    return Object_Getter__string(this._parent, "pseudoElement");
  }
}


