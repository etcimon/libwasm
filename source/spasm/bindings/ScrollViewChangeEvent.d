module spasm.bindings.ScrollViewChangeEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

enum ScrollState {
  started,
  stopped
}
struct ScrollViewChangeEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  ScrollState state()() {
    return ScrollViewChangeEvent_state_Get(this._parent);
  }
}
struct ScrollViewChangeEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return ScrollViewChangeEventInit(spasm_add__object());
  }
  void state()(ScrollState state) {
    ScrollViewChangeEventInit_state_Set(this._parent, state);
  }
  ScrollState state()() {
    return ScrollViewChangeEventInit_state_Get(this._parent);
  }
}


extern (C) ScrollState ScrollViewChangeEvent_state_Get(Handle);
extern (C) void ScrollViewChangeEventInit_state_Set(Handle, ScrollState);
extern (C) ScrollState ScrollViewChangeEventInit_state_Get(Handle);