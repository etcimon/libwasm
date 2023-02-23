module libwasm.bindings.PresentationConnectionList;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.PresentationConnection;

@safe:
nothrow:

struct PresentationConnectionList {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto connections()() {
    return Sequence!(PresentationConnection)(Object_Getter__Handle(this._parent, "connections"));
  }
  void onconnectionavailable(T0)(scope auto ref Optional!(T0) onconnectionavailable) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onconnectionavailable", !onconnectionavailable.empty, onconnectionavailable.front);
  }
  EventHandler onconnectionavailable()() {
    return Object_Getter__EventHandler(this._parent, "onconnectionavailable");
  }
}


