module spasm.bindings.PresentationConnectionList;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.PresentationConnection;

@safe:
nothrow:

struct PresentationConnectionList {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto connections()() {
    return Sequence!(PresentationConnection)(Object_Getter__Handle(this._parent, "connections"));
  }
  void onconnectionavailable(T0)(scope auto ref Optional!(T0) onconnectionavailable) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onconnectionavailable", !onconnectionavailable.empty, onconnectionavailable.front);
  }
  EventHandler onconnectionavailable()() {
    return Object_Getter__EventHandler(this._parent, "onconnectionavailable");
  }
}


