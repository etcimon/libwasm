module spasm.bindings.DeviceMotionEvent;

import spasm.types;
import spasm.bindings.Event;

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
    return DeviceAccelerationInit(spasm_add__object());
  }
  void x(T0)(scope auto ref Optional!(T0) x) if (isTOrPointer!(T0, double)) {
    DeviceAccelerationInit_x_Set(this.handle, !x.empty, x.front);
  }
  Optional!(double) x()() {
    return Object_Getter__OptionalDouble(this.handle, "x");
  }
  void y(T0)(scope auto ref Optional!(T0) y) if (isTOrPointer!(T0, double)) {
    DeviceAccelerationInit_y_Set(this.handle, !y.empty, y.front);
  }
  Optional!(double) y()() {
    return Object_Getter__OptionalDouble(this.handle, "y");
  }
  void z(T0)(scope auto ref Optional!(T0) z) if (isTOrPointer!(T0, double)) {
    DeviceAccelerationInit_z_Set(this.handle, !z.empty, z.front);
  }
  Optional!(double) z()() {
    return Object_Getter__OptionalDouble(this.handle, "z");
  }
}
struct DeviceMotionEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto acceleration()() {
    return Object_Getter__OptionalHandle(this._parent, "acceleration");
  }
  auto accelerationIncludingGravity()() {
    return Object_Getter__OptionalHandle(this._parent, "accelerationIncludingGravity");
  }
  auto rotationRate()() {
    return Object_Getter__OptionalHandle(this._parent, "rotationRate");
  }
  Optional!(double) interval()() {
    return Object_Getter__OptionalDouble(this._parent, "interval");
  }
  void initDeviceMotionEvent(T6)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope ref DeviceAccelerationInit acceleration, scope ref DeviceAccelerationInit accelerationIncludingGravity, scope ref DeviceRotationRateInit rotationRate, scope auto ref Optional!(T6) interval /* = no!(double) */) if (isTOrPointer!(T6, double)) {
    DeviceMotionEvent_initDeviceMotionEvent(this._parent, type, canBubble, cancelable, acceleration.handle, accelerationIncludingGravity.handle, rotationRate.handle, !interval.empty, interval.front);
  }
  void initDeviceMotionEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope ref DeviceAccelerationInit acceleration, scope ref DeviceAccelerationInit accelerationIncludingGravity, scope ref DeviceRotationRateInit rotationRate) {
    DeviceMotionEvent_initDeviceMotionEvent_0(this._parent, type, canBubble, cancelable, acceleration.handle, accelerationIncludingGravity.handle, rotationRate.handle);
  }
  void initDeviceMotionEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope ref DeviceAccelerationInit acceleration, scope ref DeviceAccelerationInit accelerationIncludingGravity) {
    DeviceMotionEvent_initDeviceMotionEvent_1(this._parent, type, canBubble, cancelable, acceleration.handle, accelerationIncludingGravity.handle);
  }
  void initDeviceMotionEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope ref DeviceAccelerationInit acceleration) {
    DeviceMotionEvent_initDeviceMotionEvent_2(this._parent, type, canBubble, cancelable, acceleration.handle);
  }
  void initDeviceMotionEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    DeviceMotionEvent_initDeviceMotionEvent_3(this._parent, type, canBubble, cancelable);
  }
  void initDeviceMotionEvent()(string type, bool canBubble /* = false */) {
    DeviceMotionEvent_initDeviceMotionEvent_4(this._parent, type, canBubble);
  }
  void initDeviceMotionEvent()(string type) {
    Object_Call_string__void(this._parent, "initDeviceMotionEvent", type);
  }
}
struct DeviceMotionEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return DeviceMotionEventInit(spasm_add__object());
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
    DeviceMotionEventInit_interval_Set(this._parent, !interval.empty, interval.front);
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
    return DeviceRotationRateInit(spasm_add__object());
  }
  void alpha(T0)(scope auto ref Optional!(T0) alpha) if (isTOrPointer!(T0, double)) {
    DeviceRotationRateInit_alpha_Set(this.handle, !alpha.empty, alpha.front);
  }
  Optional!(double) alpha()() {
    return Object_Getter__OptionalDouble(this.handle, "alpha");
  }
  void beta(T0)(scope auto ref Optional!(T0) beta) if (isTOrPointer!(T0, double)) {
    DeviceRotationRateInit_beta_Set(this.handle, !beta.empty, beta.front);
  }
  Optional!(double) beta()() {
    return Object_Getter__OptionalDouble(this.handle, "beta");
  }
  void gamma(T0)(scope auto ref Optional!(T0) gamma) if (isTOrPointer!(T0, double)) {
    DeviceRotationRateInit_gamma_Set(this.handle, !gamma.empty, gamma.front);
  }
  Optional!(double) gamma()() {
    return Object_Getter__OptionalDouble(this.handle, "gamma");
  }
}


extern (C) void DeviceAccelerationInit_x_Set(Handle, bool, double);
extern (C) void DeviceAccelerationInit_y_Set(Handle, bool, double);
extern (C) void DeviceAccelerationInit_z_Set(Handle, bool, double);
extern (C) void DeviceMotionEvent_initDeviceMotionEvent(Handle, string, bool, bool, Handle, Handle, Handle, bool, double);
extern (C) void DeviceMotionEvent_initDeviceMotionEvent_0(Handle, string, bool, bool, Handle, Handle, Handle);
extern (C) void DeviceMotionEvent_initDeviceMotionEvent_1(Handle, string, bool, bool, Handle, Handle);
extern (C) void DeviceMotionEvent_initDeviceMotionEvent_2(Handle, string, bool, bool, Handle);
extern (C) void DeviceMotionEvent_initDeviceMotionEvent_3(Handle, string, bool, bool);
extern (C) void DeviceMotionEvent_initDeviceMotionEvent_4(Handle, string, bool);
extern (C) void DeviceMotionEventInit_interval_Set(Handle, bool, double);
extern (C) void DeviceRotationRateInit_alpha_Set(Handle, bool, double);
extern (C) void DeviceRotationRateInit_beta_Set(Handle, bool, double);
extern (C) void DeviceRotationRateInit_gamma_Set(Handle, bool, double);