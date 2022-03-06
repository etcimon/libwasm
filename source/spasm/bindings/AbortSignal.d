module spasm.bindings.AbortSignal;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;

@safe:
nothrow:

struct AbortSignal {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  bool aborted()() {
    return Object_Getter__bool(this._parent, "aborted");
  }
  void onabort(T0)(scope auto ref Optional!(T0) onabort) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onabort", !onabort.empty, onabort.front);
  }
  EventHandler onabort()() {
    return Object_Getter__EventHandler(this._parent, "onabort");
  }
}


