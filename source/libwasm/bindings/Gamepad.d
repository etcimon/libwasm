module libwasm.bindings.Gamepad;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.GamepadHapticActuator;
import libwasm.bindings.GamepadPose;
import libwasm.bindings.Performance;

@safe:
nothrow:

struct Gamepad {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  uint index()() {
    return Object_Getter__uint(this.handle, "index");
  }
  GamepadMappingType mapping()() {
    return Object_Getter__int(this.handle, "mapping");
  }
  GamepadHand hand()() {
    return Object_Getter__int(this.handle, "hand");
  }
  uint displayId()() {
    return Object_Getter__uint(this.handle, "displayId");
  }
  bool connected()() {
    return Object_Getter__bool(this.handle, "connected");
  }
  auto buttons()() {
    return Sequence!(GamepadButton)(Object_Getter__Handle(this.handle, "buttons"));
  }
  auto axes()() {
    return Sequence!(double)(Object_Getter__Handle(this.handle, "axes"));
  }
  double timestamp()() {
    return Object_Getter__double(this.handle, "timestamp");
  }
  auto pose()() {
    return Optional!(GamepadPose)(Object_Getter__OptionalHandle(this.handle, "pose"));
  }
  auto hapticActuators()() {
    return Sequence!(GamepadHapticActuator)(Object_Getter__Handle(this.handle, "hapticActuators"));
  }
}
struct GamepadButton {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool pressed()() {
    return Object_Getter__bool(this.handle, "pressed");
  }
  bool touched()() {
    return Object_Getter__bool(this.handle, "touched");
  }
  double value()() {
    return Object_Getter__double(this.handle, "value");
  }
}
enum GamepadHand {
  none,
  left,
  right
}
enum GamepadMappingType {
  none,
  standard
}


