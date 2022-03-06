module spasm.bindings.DeviceOrientationEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct DeviceOrientationEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  Optional!(double) alpha()() {
    return Object_Getter__OptionalDouble(this._parent, "alpha");
  }
  Optional!(double) beta()() {
    return Object_Getter__OptionalDouble(this._parent, "beta");
  }
  Optional!(double) gamma()() {
    return Object_Getter__OptionalDouble(this._parent, "gamma");
  }
  bool absolute()() {
    return Object_Getter__bool(this._parent, "absolute");
  }
  void initDeviceOrientationEvent(T3, T4, T5)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) alpha /* = no!(double) */, scope auto ref Optional!(T4) beta /* = no!(double) */, scope auto ref Optional!(T5) gamma /* = no!(double) */, bool absolute /* = false */) if (isTOrPointer!(T3, double) && isTOrPointer!(T4, double) && isTOrPointer!(T5, double)) {
    DeviceOrientationEvent_initDeviceOrientationEvent(this._parent, type, canBubble, cancelable, !alpha.empty, alpha.front, !beta.empty, beta.front, !gamma.empty, gamma.front, absolute);
  }
  void initDeviceOrientationEvent(T3, T4, T5)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) alpha /* = no!(double) */, scope auto ref Optional!(T4) beta /* = no!(double) */, scope auto ref Optional!(T5) gamma /* = no!(double) */) if (isTOrPointer!(T3, double) && isTOrPointer!(T4, double) && isTOrPointer!(T5, double)) {
    DeviceOrientationEvent_initDeviceOrientationEvent_0(this._parent, type, canBubble, cancelable, !alpha.empty, alpha.front, !beta.empty, beta.front, !gamma.empty, gamma.front);
  }
  void initDeviceOrientationEvent(T3, T4)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) alpha /* = no!(double) */, scope auto ref Optional!(T4) beta /* = no!(double) */) if (isTOrPointer!(T3, double) && isTOrPointer!(T4, double)) {
    DeviceOrientationEvent_initDeviceOrientationEvent_1(this._parent, type, canBubble, cancelable, !alpha.empty, alpha.front, !beta.empty, beta.front);
  }
  void initDeviceOrientationEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) alpha /* = no!(double) */) if (isTOrPointer!(T3, double)) {
    DeviceOrientationEvent_initDeviceOrientationEvent_2(this._parent, type, canBubble, cancelable, !alpha.empty, alpha.front);
  }
  void initDeviceOrientationEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    DeviceOrientationEvent_initDeviceOrientationEvent_3(this._parent, type, canBubble, cancelable);
  }
  void initDeviceOrientationEvent()(string type, bool canBubble /* = false */) {
    DeviceOrientationEvent_initDeviceOrientationEvent_4(this._parent, type, canBubble);
  }
  void initDeviceOrientationEvent()(string type) {
    Object_Call_string__void(this._parent, "initDeviceOrientationEvent", type);
  }
}
struct DeviceOrientationEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return DeviceOrientationEventInit(spasm_add__object());
  }
  void alpha(T0)(scope auto ref Optional!(T0) alpha) if (isTOrPointer!(T0, double)) {
    DeviceOrientationEventInit_alpha_Set(this._parent, !alpha.empty, alpha.front);
  }
  Optional!(double) alpha()() {
    return Object_Getter__OptionalDouble(this._parent, "alpha");
  }
  void beta(T0)(scope auto ref Optional!(T0) beta) if (isTOrPointer!(T0, double)) {
    DeviceOrientationEventInit_beta_Set(this._parent, !beta.empty, beta.front);
  }
  Optional!(double) beta()() {
    return Object_Getter__OptionalDouble(this._parent, "beta");
  }
  void gamma(T0)(scope auto ref Optional!(T0) gamma) if (isTOrPointer!(T0, double)) {
    DeviceOrientationEventInit_gamma_Set(this._parent, !gamma.empty, gamma.front);
  }
  Optional!(double) gamma()() {
    return Object_Getter__OptionalDouble(this._parent, "gamma");
  }
  void absolute()(bool absolute) {
    Object_Call_bool__void(this._parent, "absolute", absolute);
  }
  bool absolute()() {
    return Object_Getter__bool(this._parent, "absolute");
  }
}


extern (C) void DeviceOrientationEvent_initDeviceOrientationEvent(Handle, string, bool, bool, bool, double, bool, double, bool, double, bool);
extern (C) void DeviceOrientationEvent_initDeviceOrientationEvent_0(Handle, string, bool, bool, bool, double, bool, double, bool, double);
extern (C) void DeviceOrientationEvent_initDeviceOrientationEvent_1(Handle, string, bool, bool, bool, double, bool, double);
extern (C) void DeviceOrientationEvent_initDeviceOrientationEvent_2(Handle, string, bool, bool, bool, double);
extern (C) void DeviceOrientationEvent_initDeviceOrientationEvent_3(Handle, string, bool, bool);
extern (C) void DeviceOrientationEvent_initDeviceOrientationEvent_4(Handle, string, bool);
extern (C) void DeviceOrientationEventInit_alpha_Set(Handle, bool, double);
extern (C) void DeviceOrientationEventInit_beta_Set(Handle, bool, double);
extern (C) void DeviceOrientationEventInit_gamma_Set(Handle, bool, double);