module spasm.bindings.NetworkInformation;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;

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
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  ConnectionType type()() {
    return NetworkInformation_type_Get(this._parent);
  }
  void ontypechange(T0)(scope auto ref Optional!(T0) ontypechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ontypechange", !ontypechange.empty, ontypechange.front);
  }
  EventHandler ontypechange()() {
    return Object_Getter__EventHandler(this._parent, "ontypechange");
  }
}


extern (C) ConnectionType NetworkInformation_type_Get(Handle);