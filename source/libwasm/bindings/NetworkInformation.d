module libwasm.bindings.NetworkInformation;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

enum ConnectionType {
  cellular,
  bluetooth,
  ethernet,
  wifi,
  other,
  none,
  unknown
}
struct NetworkInformation {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  ConnectionType type()() {
    return Object_Getter__int(this._parent, "type");
  }
  void ontypechange(T0)(scope auto ref Optional!(T0) ontypechange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "ontypechange", !ontypechange.empty, ontypechange.front);
  }
  EventHandler ontypechange()() {
    return Object_Getter__EventHandler(this._parent, "ontypechange");
  }
}


