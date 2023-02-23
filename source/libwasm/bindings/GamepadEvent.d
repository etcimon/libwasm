module libwasm.bindings.GamepadEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.Gamepad;

@safe:
nothrow:

struct GamepadEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto gamepad()() {
    return recastOpt!(Gamepad)(Object_Getter__OptionalHandle(this._parent, "gamepad"));
  }
}
struct GamepadEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return GamepadEventInit(libwasm_add__object());
  }
  void gamepad(T0)(scope auto ref Optional!(T0) gamepad) if (isTOrPointer!(T0, Gamepad)) {
    Serialize_Object_VarArgCall!void(this._parent, "gamepad", "Optional!Handle", tuple(!gamepad.empty, cast(Handle)gamepad.front.handle));
  }
  auto gamepad()() {
    return recastOpt!(Gamepad)(Object_Getter__OptionalHandle(this._parent, "gamepad"));
  }
}


