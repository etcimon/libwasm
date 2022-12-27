module libwasm.bindings.MIDIConnectionEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.MIDIPort;

@safe:
nothrow:

struct MIDIConnectionEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto port()() {
    return recastOpt!(MIDIPort)(Object_Getter__OptionalHandle(this._parent, "port"));
  }
}
struct MIDIConnectionEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MIDIConnectionEventInit(libwasm_add__object());
  }
  void port(T0)(scope auto ref Optional!(T0) port) if (isTOrPointer!(T0, MIDIPort)) {
    Serialize_Object_VarArgCall!void(this._parent, "port", "Optional!Handle", tuple(!port.empty, cast(Handle)port.front._parent));
  }
  auto port()() {
    return recastOpt!(MIDIPort)(Object_Getter__OptionalHandle(this._parent, "port"));
  }
}


