module spasm.bindings.Gamepad;

import spasm.types;
import spasm.bindings.GamepadHapticActuator;
import spasm.bindings.GamepadPose;
import spasm.bindings.Performance;

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
    return Gamepad_mapping_Get(this.handle);
  }
  GamepadHand hand()() {
    return Gamepad_hand_Get(this.handle);
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
    return Object_Getter__OptionalHandle(this.handle, "pose");
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


extern (C) GamepadMappingType Gamepad_mapping_Get(Handle);
extern (C) GamepadHand Gamepad_hand_Get(Handle);