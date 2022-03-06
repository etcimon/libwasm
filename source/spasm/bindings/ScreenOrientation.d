module spasm.bindings.ScreenOrientation;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;

@safe:
nothrow:

enum OrientationLockType {
  any,
  natural,
  landscape,
  portrait,
  portrait_primary,
  portrait_secondary,
  landscape_primary,
  landscape_secondary
}
enum OrientationType {
  portrait_primary,
  portrait_secondary,
  landscape_primary,
  landscape_secondary
}
struct ScreenOrientation {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto lock()(OrientationLockType orientation) {
    return Promise!(void)(ScreenOrientation_lock(this._parent, orientation));
  }
  void unlock()() {
    Object_Call__void(this._parent, "unlock");
  }
  OrientationType type()() {
    return ScreenOrientation_type_Get(this._parent);
  }
  ushort angle()() {
    return Object_Getter__ushort(this._parent, "angle");
  }
  void onchange(T0)(scope auto ref Optional!(T0) onchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onchange", !onchange.empty, onchange.front);
  }
  EventHandler onchange()() {
    return Object_Getter__EventHandler(this._parent, "onchange");
  }
}


extern (C) Handle ScreenOrientation_lock(Handle, OrientationLockType);
extern (C) OrientationType ScreenOrientation_type_Get(Handle);