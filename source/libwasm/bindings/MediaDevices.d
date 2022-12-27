module libwasm.bindings.MediaDevices;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.MediaDeviceInfo;
import libwasm.bindings.MediaStream;
import libwasm.bindings.MediaTrackSupportedConstraints;

@safe:
nothrow:

struct MediaDevices {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  void ondevicechange(T0)(scope auto ref Optional!(T0) ondevicechange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "ondevicechange", !ondevicechange.empty, ondevicechange.front);
  }
  EventHandler ondevicechange()() {
    return Object_Getter__EventHandler(this._parent, "ondevicechange");
  }
  auto getSupportedConstraints()() {
    return MediaTrackSupportedConstraints(Object_Getter__Handle(this._parent, "getSupportedConstraints"));
  }
  auto enumerateDevices()() {
    return JsPromise!(Sequence!(MediaDeviceInfo))(Object_Getter__Handle(this._parent, "enumerateDevices"));
  }
  auto getUserMedia()(scope ref MediaStreamConstraints constraints) {
    return JsPromise!(MediaStream)(Object_Call_Handle__Handle(this._parent, "getUserMedia", constraints.handle));
  }
  auto getUserMedia()() {
    return JsPromise!(MediaStream)(Object_Getter__Handle(this._parent, "getUserMedia"));
  }
  auto getDisplayMedia()(scope ref DisplayMediaStreamConstraints constraints) {
    return JsPromise!(MediaStream)(Object_Call_Handle__Handle(this._parent, "getDisplayMedia", constraints.handle));
  }
  auto getDisplayMedia()() {
    return JsPromise!(MediaStream)(Object_Getter__Handle(this._parent, "getDisplayMedia"));
  }
}


