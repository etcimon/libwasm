module libwasm.bindings.GamepadPose;

import libwasm.types;

import memutils.ct: tuple;
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
    return recastOpt!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "position"));
  }
  auto linearVelocity()() {
    return recastOpt!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "linearVelocity"));
  }
  auto linearAcceleration()() {
    return recastOpt!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "linearAcceleration"));
  }
  auto orientation()() {
    return recastOpt!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "orientation"));
  }
  auto angularVelocity()() {
    return recastOpt!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "angularVelocity"));
  }
  auto angularAcceleration()() {
    return recastOpt!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "angularAcceleration"));
  }
}


