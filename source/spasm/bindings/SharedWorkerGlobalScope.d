module spasm.bindings.SharedWorkerGlobalScope;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.WorkerGlobalScope;

@safe:
nothrow:

struct SharedWorkerGlobalScope {
  nothrow:
  spasm.bindings.WorkerGlobalScope.WorkerGlobalScope _parent;
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
  void onconnect(T0)(scope auto ref Optional!(T0) onconnect) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onconnect", !onconnect.empty, onconnect.front);
  }
  EventHandler onconnect()() {
    return Object_Getter__EventHandler(this._parent, "onconnect");
  }
}


