module libwasm.bindings.PopStateEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct PopStateEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto state()() {
    return Any(Object_Getter__Handle(this._parent, "state"));
  }
}
struct PopStateEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PopStateEventInit(libwasm_add__object());
  }
  void state(T0)(scope auto ref T0 state) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this._parent, "state", cast(string) state);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this._parent, "state", cast(long) state);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this._parent, "state", cast(double) state);
      return;
    }
    // Any
    Handle _handle_state = getOrCreateHandle(state);
    Object_Call_Handle__void(this._parent, "state", _handle_state);
    dropHandle!(T0)(_handle_state);
  }
  auto state()() {
    return Any(Object_Getter__Handle(this._parent, "state"));
  }
}


