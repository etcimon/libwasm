module spasm.bindings.PageTransitionEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct PageTransitionEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
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
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PageTransitionEventInit(spasm_add__object());
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


