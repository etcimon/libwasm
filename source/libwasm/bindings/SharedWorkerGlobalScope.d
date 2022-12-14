module libwasm.bindings.SharedWorkerGlobalScope;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.WorkerGlobalScope;

@safe:
nothrow:

struct SharedWorkerGlobalScope {
  nothrow:
  libwasm.bindings.WorkerGlobalScope.WorkerGlobalScope _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .WorkerGlobalScope(h);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
  void onconnect(T0)(scope auto ref Optional!(T0) onconnect) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onconnect", !onconnect.empty, onconnect.front);
  }
  EventHandler onconnect()() {
    return Object_Getter__EventHandler(this._parent, "onconnect");
  }
}


