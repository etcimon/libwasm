module libwasm.bindings.AnimationEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct AnimationEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string animationName()() {
    return Object_Getter__string(this._parent, "animationName");
  }
  float elapsedTime()() {
    return Object_Getter__float(this._parent, "elapsedTime");
  }
  string pseudoElement()() {
    return Object_Getter__string(this._parent, "pseudoElement");
  }
}
struct AnimationEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return AnimationEventInit(libwasm_add__object());
  }
  void animationName()(string animationName) {
    Object_Call_string__void(this._parent, "animationName", animationName);
  }
  string animationName()() {
    return Object_Getter__string(this._parent, "animationName");
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


