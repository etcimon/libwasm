module libwasm.bindings.ScreenOrientation;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;

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
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto lock()(OrientationLockType orientation) {
    return JsPromise!(void)(Object_Call_int__Handle(this._parent, "lock", orientation));
  }
  void unlock()() {
    Object_Call__void(this._parent, "unlock");
  }
  OrientationType type()() {
    return Object_Getter__int(this._parent, "type");
  }
  ushort angle()() {
    return Object_Getter__ushort(this._parent, "angle");
  }
  void onchange(T0)(scope auto ref Optional!(T0) onchange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onchange", !onchange.empty, onchange.front);
  }
  EventHandler onchange()() {
    return Object_Getter__EventHandler(this._parent, "onchange");
  }
}


