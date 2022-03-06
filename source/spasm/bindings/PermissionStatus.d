module spasm.bindings.PermissionStatus;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;

@safe:
nothrow:

enum PermissionState {
  granted,
  denied,
  prompt
}
struct PermissionStatus {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  PermissionState state()() {
    return PermissionStatus_state_Get(this._parent);
  }
  void onchange(T0)(scope auto ref Optional!(T0) onchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onchange", !onchange.empty, onchange.front);
  }
  EventHandler onchange()() {
    return Object_Getter__EventHandler(this._parent, "onchange");
  }
}


extern (C) PermissionState PermissionStatus_state_Get(Handle);