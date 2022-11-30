module libwasm.bindings.GamepadPose;

import libwasm.types;

import std.typecons: tuple;
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
    return Optional!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "position"));
  }
  auto linearVelocity()() {
    return Optional!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "linearVelocity"));
  }
  auto linearAcceleration()() {
    return Optional!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "linearAcceleration"));
  }
  auto orientation()() {
    return Optional!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "orientation"));
  }
  auto angularVelocity()() {
    return Optional!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "angularVelocity"));
  }
  auto angularAcceleration()() {
    return Optional!(Float32Array)(Object_Getter__OptionalHandle(this.handle, "angularAcceleration"));
  }
}


