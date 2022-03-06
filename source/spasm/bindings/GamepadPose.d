module spasm.bindings.GamepadPose;

import spasm.types;
@safe:
nothrow:

struct GamepadPose {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool hasOrientation()() {
    return Object_Getter__bool(this.handle, "hasOrientation");
  }
  bool hasPosition()() {
    return Object_Getter__bool(this.handle, "hasPosition");
  }
  auto position()() {
    return Object_Getter__OptionalHandle(this.handle, "position");
  }
  auto linearVelocity()() {
    return Object_Getter__OptionalHandle(this.handle, "linearVelocity");
  }
  auto linearAcceleration()() {
    return Object_Getter__OptionalHandle(this.handle, "linearAcceleration");
  }
  auto orientation()() {
    return Object_Getter__OptionalHandle(this.handle, "orientation");
  }
  auto angularVelocity()() {
    return Object_Getter__OptionalHandle(this.handle, "angularVelocity");
  }
  auto angularAcceleration()() {
    return Object_Getter__OptionalHandle(this.handle, "angularAcceleration");
  }
}


