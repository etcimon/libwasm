module libwasm.bindings.GamepadButtonEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.GamepadEvent;

@safe:
nothrow:

struct GamepadButtonEvent {
  nothrow:
  libwasm.bindings.GamepadEvent.GamepadEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .GamepadEvent(h);
  }
  uint button()() {
    return Object_Getter__uint(this._parent, "button");
  }
}
struct GamepadButtonEventInit {
  nothrow:
  libwasm.bindings.GamepadEvent.GamepadEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .GamepadEventInit(h);
  }
  static auto create() {
    return GamepadButtonEventInit(libwasm_add__object());
  }
  void button()(uint button) {
    Object_Call_uint__void(this._parent, "button", button);
  }
  uint button()() {
    return Object_Getter__uint(this._parent, "button");
  }
}


