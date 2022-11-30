module libwasm.bindings.PresentationRequest;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.PresentationAvailability;
import libwasm.bindings.PresentationConnection;

@safe:
nothrow:

struct PresentationRequest {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto start()() {
    return JsPromise!(PresentationConnection)(Object_Getter__Handle(this._parent, "start"));
  }
  auto reconnect()(string presentationId) {
    return JsPromise!(PresentationConnection)(Object_Call_string__Handle(this._parent, "reconnect", presentationId));
  }
  auto getAvailability()() {
    return JsPromise!(PresentationAvailability)(Object_Getter__Handle(this._parent, "getAvailability"));
  }
  void onconnectionavailable(T0)(scope auto ref Optional!(T0) onconnectionavailable) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onconnectionavailable", !onconnectionavailable.empty, onconnectionavailable.front);
  }
  EventHandler onconnectionavailable()() {
    return Object_Getter__EventHandler(this._parent, "onconnectionavailable");
  }
  auto startWithDevice()(string deviceId) {
    return JsPromise!(PresentationConnection)(Object_Call_string__Handle(this._parent, "startWithDevice", deviceId));
  }
}


