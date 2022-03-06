module spasm.bindings.GamepadHapticActuator;

import spasm.types;
@safe:
nothrow:

struct GamepadHapticActuator {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  GamepadHapticActuatorType type()() {
    return GamepadHapticActuator_type_Get(this.handle);
  }
  auto pulse()(double value, double duration) {
    return Promise!(bool)(GamepadHapticActuator_pulse(this.handle, value, duration));
  }
}
enum GamepadHapticActuatorType {
  vibration
}


extern (C) GamepadHapticActuatorType GamepadHapticActuator_type_Get(Handle);
extern (C) Handle GamepadHapticActuator_pulse(Handle, double, double);