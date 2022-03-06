module spasm.bindings.GamepadEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.Gamepad;

@safe:
nothrow:

struct GamepadEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto gamepad()() {
    return Object_Getter__OptionalHandle(this._parent, "gamepad");
  }
}
struct GamepadEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return GamepadEventInit(spasm_add__object());
  }
  void gamepad(T0)(scope auto ref Optional!(T0) gamepad) if (isTOrPointer!(T0, Gamepad)) {
    GamepadEventInit_gamepad_Set(this._parent, !gamepad.empty, gamepad.front.handle);
  }
  auto gamepad()() {
    return Object_Getter__OptionalHandle(this._parent, "gamepad");
  }
}


extern (C) void GamepadEventInit_gamepad_Set(Handle, bool, Handle);