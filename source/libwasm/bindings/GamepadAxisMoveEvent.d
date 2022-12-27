module libwasm.bindings.GamepadAxisMoveEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.GamepadEvent;

@safe:
nothrow:

struct GamepadAxisMoveEvent {
  nothrow:
  libwasm.bindings.GamepadEvent.GamepadEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .GamepadEvent(h);
  }
  uint axis()() {
    return Object_Getter__uint(this._parent, "axis");
  }
  double value()() {
    return Object_Getter__double(this._parent, "value");
  }
}
struct GamepadAxisMoveEventInit {
  nothrow:
  libwasm.bindings.GamepadEvent.GamepadEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .GamepadEventInit(h);
  }
  static auto create() {
    return GamepadAxisMoveEventInit(libwasm_add__object());
  }
  void axis()(uint axis) {
    Object_Call_uint__void(this._parent, "axis", axis);
  }
  uint axis()() {
    return Object_Getter__uint(this._parent, "axis");
  }
  void value()(double value) {
    Object_Call_double__void(this._parent, "value", value);
  }
  double value()() {
    return Object_Getter__double(this._parent, "value");
  }
}


