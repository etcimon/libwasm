module libwasm.bindings.DeviceMotionEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct DeviceAcceleration {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  Optional!(double) x()() {
    return Object_Getter__OptionalDouble(this.handle, "x");
  }
  Optional!(double) y()() {
    return Object_Getter__OptionalDouble(this.handle, "y");
  }
  Optional!(double) z()() {
    return Object_Getter__OptionalDouble(this.handle, "z");
  }
}
struct DeviceAccelerationInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DeviceAccelerationInit(libwasm_add__object());
  }
  void x(T0)(scope auto ref Optional!(T0) x) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this.handle, "x", "Optional!(double)", tuple(!x.empty, x.front));
  }
  Optional!(double) x()() {
    return Object_Getter__OptionalDouble(this.handle, "x");
  }
  void y(T0)(scope auto ref Optional!(T0) y) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this.handle, "y", "Optional!(double)", tuple(!y.empty, y.front));
  }
  Optional!(double) y()() {
    return Object_Getter__OptionalDouble(this.handle, "y");
  }
  void z(T0)(scope auto ref Optional!(T0) z) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this.handle, "z", "Optional!(double)", tuple(!z.empty, z.front));
  }
  Optional!(double) z()() {
    return Object_Getter__OptionalDouble(this.handle, "z");
  }
}
struct DeviceMotionEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto acceleration()() {
    return Optional!(DeviceAcceleration)(Object_Getter__OptionalHandle(this._parent, "acceleration"));
  }
  auto accelerationIncludingGravity()() {
    return Optional!(DeviceAcceleration)(Object_Getter__OptionalHandle(this._parent, "accelerationIncludingGravity"));
  }
  auto rotationRate()() {
    return Optional!(DeviceRotationRate)(Object_Getter__OptionalHandle(this._parent, "rotationRate"));
  }
  Optional!(double) interval()() {
    return Object_Getter__OptionalDouble(this._parent, "interval");
  }
  void initDeviceMotionEvent(T6)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope ref DeviceAccelerationInit acceleration, scope ref DeviceAccelerationInit accelerationIncludingGravity, scope ref DeviceRotationRateInit rotationRate, scope auto ref Optional!(T6) interval /* = no!(double) */) if (isTOrPointer!(T6, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDeviceMotionEvent", "string;bool;bool;Handle;Handle;Handle;Optional!(double)", tuple(type, canBubble, cancelable, cast(Handle)acceleration.handle, cast(Handle)accelerationIncludingGravity.handle, cast(Handle)rotationRate.handle, !interval.empty, interval.front));
  }
  void initDeviceMotionEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope ref DeviceAccelerationInit acceleration, scope ref DeviceAccelerationInit accelerationIncludingGravity, scope ref DeviceRotationRateInit rotationRate) {
    Serialize_Object_VarArgCall!void(this._parent, "initDeviceMotionEvent", "string;bool;bool;Handle;Handle;Handle", tuple(type, canBubble, cancelable, cast(Handle)acceleration.handle, cast(Handle)accelerationIncludingGravity.handle, cast(Handle)rotationRate.handle));
  }
  void initDeviceMotionEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope ref DeviceAccelerationInit acceleration, scope ref DeviceAccelerationInit accelerationIncludingGravity) {
    Serialize_Object_VarArgCall!void(this._parent, "initDeviceMotionEvent", "string;bool;bool;Handle;Handle", tuple(type, canBubble, cancelable, cast(Handle)acceleration.handle, cast(Handle)accelerationIncludingGravity.handle));
  }
  void initDeviceMotionEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope ref DeviceAccelerationInit acceleration) {
    Serialize_Object_VarArgCall!void(this._parent, "initDeviceMotionEvent", "string;bool;bool;Handle", tuple(type, canBubble, cancelable, cast(Handle)acceleration.handle));
  }
  void initDeviceMotionEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initDeviceMotionEvent", "string;bool;bool", tuple(type, canBubble, cancelable));
  }
  void initDeviceMotionEvent()(string type, bool canBubble /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initDeviceMotionEvent", "string;bool", tuple(type, canBubble));
  }
  void initDeviceMotionEvent()(string type) {
    Object_Call_string__void(this._parent, "initDeviceMotionEvent", type);
  }
}
struct DeviceMotionEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return DeviceMotionEventInit(libwasm_add__object());
  }
  void acceleration()(scope ref DeviceAccelerationInit acceleration) {
    Object_Call_Handle__void(this._parent, "acceleration", acceleration.handle);
  }
  auto acceleration()() {
    return DeviceAccelerationInit(Object_Getter__Handle(this._parent, "acceleration"));
  }
  void accelerationIncludingGravity()(scope ref DeviceAccelerationInit accelerationIncludingGravity) {
    Object_Call_Handle__void(this._parent, "accelerationIncludingGravity", accelerationIncludingGravity.handle);
  }
  auto accelerationIncludingGravity()() {
    return DeviceAccelerationInit(Object_Getter__Handle(this._parent, "accelerationIncludingGravity"));
  }
  void rotationRate()(scope ref DeviceRotationRateInit rotationRate) {
    Object_Call_Handle__void(this._parent, "rotationRate", rotationRate.handle);
  }
  auto rotationRate()() {
    return DeviceRotationRateInit(Object_Getter__Handle(this._parent, "rotationRate"));
  }
  void interval(T0)(scope auto ref Optional!(T0) interval) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "interval", "Optional!(double)", tuple(!interval.empty, interval.front));
  }
  Optional!(double) interval()() {
    return Object_Getter__OptionalDouble(this._parent, "interval");
  }
}
struct DeviceRotationRate {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  Optional!(double) alpha()() {
    return Object_Getter__OptionalDouble(this.handle, "alpha");
  }
  Optional!(double) beta()() {
    return Object_Getter__OptionalDouble(this.handle, "beta");
  }
  Optional!(double) gamma()() {
    return Object_Getter__OptionalDouble(this.handle, "gamma");
  }
}
struct DeviceRotationRateInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DeviceRotationRateInit(libwasm_add__object());
  }
  void alpha(T0)(scope auto ref Optional!(T0) alpha) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this.handle, "alpha", "Optional!(double)", tuple(!alpha.empty, alpha.front));
  }
  Optional!(double) alpha()() {
    return Object_Getter__OptionalDouble(this.handle, "alpha");
  }
  void beta(T0)(scope auto ref Optional!(T0) beta) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this.handle, "beta", "Optional!(double)", tuple(!beta.empty, beta.front));
  }
  Optional!(double) beta()() {
    return Object_Getter__OptionalDouble(this.handle, "beta");
  }
  void gamma(T0)(scope auto ref Optional!(T0) gamma) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this.handle, "gamma", "Optional!(double)", tuple(!gamma.empty, gamma.front));
  }
  Optional!(double) gamma()() {
    return Object_Getter__OptionalDouble(this.handle, "gamma");
  }
}


