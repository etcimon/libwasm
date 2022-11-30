module libwasm.bindings.Geolocation;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Position;
import libwasm.bindings.PositionError;

@safe:
nothrow:

struct Geolocation {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void getCurrentPosition(T1)(PositionCallback successCallback, scope auto ref Optional!(T1) errorCallback /* = no!(PositionErrorCallback) */, scope ref PositionOptions options) if (isTOrPointer!(T1, PositionErrorCallback)) {
    Geolocation_getCurrentPosition(this.handle, successCallback, !errorCallback.empty, errorCallback.front, options.handle);
  }
  void getCurrentPosition(T1)(PositionCallback successCallback, scope auto ref Optional!(T1) errorCallback /* = no!(PositionErrorCallback) */) if (isTOrPointer!(T1, PositionErrorCallback)) {
    Geolocation_getCurrentPosition_0(this.handle, successCallback, !errorCallback.empty, errorCallback.front);
  }
  void getCurrentPosition()(PositionCallback successCallback) {
    Geolocation_getCurrentPosition_1(this.handle, successCallback);
  }
  int watchPosition(T1)(PositionCallback successCallback, scope auto ref Optional!(T1) errorCallback /* = no!(PositionErrorCallback) */, scope ref PositionOptions options) if (isTOrPointer!(T1, PositionErrorCallback)) {
    return Geolocation_watchPosition(this.handle, successCallback, !errorCallback.empty, errorCallback.front, options.handle);
  }
  int watchPosition(T1)(PositionCallback successCallback, scope auto ref Optional!(T1) errorCallback /* = no!(PositionErrorCallback) */) if (isTOrPointer!(T1, PositionErrorCallback)) {
    return Geolocation_watchPosition_0(this.handle, successCallback, !errorCallback.empty, errorCallback.front);
  }
  int watchPosition()(PositionCallback successCallback) {
    return Geolocation_watchPosition_1(this.handle, successCallback);
  }
  void clearWatch()(int watchId) {
    Object_Call_int__void(this.handle, "clearWatch", watchId);
  }
}
alias PositionCallback = void delegate(Position);
alias PositionErrorCallback = void delegate(PositionError);
struct PositionOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PositionOptions(libwasm_add__object());
  }
  void enableHighAccuracy()(bool enableHighAccuracy) {
    Object_Call_bool__void(this.handle, "enableHighAccuracy", enableHighAccuracy);
  }
  bool enableHighAccuracy()() {
    return Object_Getter__bool(this.handle, "enableHighAccuracy");
  }
  void timeout()(uint timeout) {
    Object_Call_uint__void(this.handle, "timeout", timeout);
  }
  uint timeout()() {
    return Object_Getter__uint(this.handle, "timeout");
  }
  void maximumAge()(uint maximumAge) {
    Object_Call_uint__void(this.handle, "maximumAge", maximumAge);
  }
  uint maximumAge()() {
    return Object_Getter__uint(this.handle, "maximumAge");
  }
}


extern (C) void Geolocation_getCurrentPosition(Handle, PositionCallback, bool, PositionErrorCallback, Handle);
extern (C) void Geolocation_getCurrentPosition_0(Handle, PositionCallback, bool, PositionErrorCallback);
extern (C) void Geolocation_getCurrentPosition_1(Handle, PositionCallback);
extern (C) int Geolocation_watchPosition(Handle, PositionCallback, bool, PositionErrorCallback, Handle);
extern (C) int Geolocation_watchPosition_0(Handle, PositionCallback, bool, PositionErrorCallback);
extern (C) int Geolocation_watchPosition_1(Handle, PositionCallback);