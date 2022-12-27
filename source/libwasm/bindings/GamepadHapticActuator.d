module libwasm.bindings.GamepadHapticActuator;

import libwasm.types;

import memutils.ct: tuple;
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
    return Object_Getter__int(this.handle, "type");
  }
  auto pulse()(double value, double duration) {
    return JsPromise!(bool)(Serialize_Object_VarArgCall!Handle(this.handle, "pulse", "double;double", tuple(value, duration)));
  }
}
enum GamepadHapticActuatorType {
  vibration
}


