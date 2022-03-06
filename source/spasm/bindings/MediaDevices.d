module spasm.bindings.MediaDevices;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.MediaDeviceInfo;
import spasm.bindings.MediaStream;
import spasm.bindings.MediaTrackSupportedConstraints;

@safe:
nothrow:

struct MediaDevices {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  void ondevicechange(T0)(scope auto ref Optional!(T0) ondevicechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondevicechange", !ondevicechange.empty, ondevicechange.front);
  }
  EventHandler ondevicechange()() {
    return Object_Getter__EventHandler(this._parent, "ondevicechange");
  }
  auto getSupportedConstraints()() {
    return MediaTrackSupportedConstraints(Object_Getter__Handle(this._parent, "getSupportedConstraints"));
  }
  auto enumerateDevices()() {
    return Promise!(Sequence!(MediaDeviceInfo))(Object_Getter__Handle(this._parent, "enumerateDevices"));
  }
  auto getUserMedia()(scope ref MediaStreamConstraints constraints) {
    return Promise!(MediaStream)(Object_Call_Handle__Handle(this._parent, "getUserMedia", constraints.handle));
  }
  auto getUserMedia()() {
    return Promise!(MediaStream)(Object_Getter__Handle(this._parent, "getUserMedia"));
  }
  auto getDisplayMedia()(scope ref DisplayMediaStreamConstraints constraints) {
    return Promise!(MediaStream)(Object_Call_Handle__Handle(this._parent, "getDisplayMedia", constraints.handle));
  }
  auto getDisplayMedia()() {
    return Promise!(MediaStream)(Object_Getter__Handle(this._parent, "getDisplayMedia"));
  }
}


