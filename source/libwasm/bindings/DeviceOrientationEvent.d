module libwasm.bindings.DeviceOrientationEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct DeviceOrientationEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
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
    Serialize_Object_VarArgCall!void(this._parent, "initDeviceOrientationEvent", "string;bool;bool;Optional!(double);Optional!(double);Optional!(double);bool", tuple(type, canBubble, cancelable, !alpha.empty, alpha.front, !beta.empty, beta.front, !gamma.empty, gamma.front, absolute));
  }
  void initDeviceOrientationEvent(T3, T4, T5)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) alpha /* = no!(double) */, scope auto ref Optional!(T4) beta /* = no!(double) */, scope auto ref Optional!(T5) gamma /* = no!(double) */) if (isTOrPointer!(T3, double) && isTOrPointer!(T4, double) && isTOrPointer!(T5, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDeviceOrientationEvent", "string;bool;bool;Optional!(double);Optional!(double);Optional!(double)", tuple(type, canBubble, cancelable, !alpha.empty, alpha.front, !beta.empty, beta.front, !gamma.empty, gamma.front));
  }
  void initDeviceOrientationEvent(T3, T4)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) alpha /* = no!(double) */, scope auto ref Optional!(T4) beta /* = no!(double) */) if (isTOrPointer!(T3, double) && isTOrPointer!(T4, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDeviceOrientationEvent", "string;bool;bool;Optional!(double);Optional!(double)", tuple(type, canBubble, cancelable, !alpha.empty, alpha.front, !beta.empty, beta.front));
  }
  void initDeviceOrientationEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) alpha /* = no!(double) */) if (isTOrPointer!(T3, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDeviceOrientationEvent", "string;bool;bool;Optional!(double)", tuple(type, canBubble, cancelable, !alpha.empty, alpha.front));
  }
  void initDeviceOrientationEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initDeviceOrientationEvent", "string;bool;bool", tuple(type, canBubble, cancelable));
  }
  void initDeviceOrientationEvent()(string type, bool canBubble /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initDeviceOrientationEvent", "string;bool", tuple(type, canBubble));
  }
  void initDeviceOrientationEvent()(string type) {
    Object_Call_string__void(this._parent, "initDeviceOrientationEvent", type);
  }
}
struct DeviceOrientationEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return DeviceOrientationEventInit(libwasm_add__object());
  }
  void alpha(T0)(scope auto ref Optional!(T0) alpha) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "alpha", "Optional!(double)", tuple(!alpha.empty, alpha.front));
  }
  Optional!(double) alpha()() {
    return Object_Getter__OptionalDouble(this._parent, "alpha");
  }
  void beta(T0)(scope auto ref Optional!(T0) beta) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "beta", "Optional!(double)", tuple(!beta.empty, beta.front));
  }
  Optional!(double) beta()() {
    return Object_Getter__OptionalDouble(this._parent, "beta");
  }
  void gamma(T0)(scope auto ref Optional!(T0) gamma) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "gamma", "Optional!(double)", tuple(!gamma.empty, gamma.front));
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


