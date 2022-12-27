module libwasm.bindings.ScrollViewChangeEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

enum ScrollState {
  started,
  stopped
}
struct ScrollViewChangeEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  ScrollState state()() {
    return Object_Getter__int(this._parent, "state");
  }
}
struct ScrollViewChangeEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return ScrollViewChangeEventInit(libwasm_add__object());
  }
  void state()(ScrollState state) {
    Object_Call_int__void(this._parent, "state", state);
  }
  ScrollState state()() {
    return Object_Getter__int(this._parent, "state");
  }
}


