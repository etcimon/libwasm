module libwasm.bindings.PageTransitionEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct PageTransitionEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  bool persisted()() {
    return Object_Getter__bool(this._parent, "persisted");
  }
  bool inFrameSwap()() {
    return Object_Getter__bool(this._parent, "inFrameSwap");
  }
}
struct PageTransitionEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PageTransitionEventInit(libwasm_add__object());
  }
  void persisted()(bool persisted) {
    Object_Call_bool__void(this._parent, "persisted", persisted);
  }
  bool persisted()() {
    return Object_Getter__bool(this._parent, "persisted");
  }
  void inFrameSwap()(bool inFrameSwap) {
    Object_Call_bool__void(this._parent, "inFrameSwap", inFrameSwap);
  }
  bool inFrameSwap()() {
    return Object_Getter__bool(this._parent, "inFrameSwap");
  }
}


