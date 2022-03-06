module spasm.bindings.MIDIConnectionEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.MIDIPort;

@safe:
nothrow:

struct MIDIConnectionEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto port()() {
    return Object_Getter__OptionalHandle(this._parent, "port");
  }
}
struct MIDIConnectionEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MIDIConnectionEventInit(spasm_add__object());
  }
  void port(T0)(scope auto ref Optional!(T0) port) if (isTOrPointer!(T0, MIDIPort)) {
    MIDIConnectionEventInit_port_Set(this._parent, !port.empty, port.front._parent);
  }
  auto port()() {
    return Object_Getter__OptionalHandle(this._parent, "port");
  }
}


extern (C) void MIDIConnectionEventInit_port_Set(Handle, bool, Handle);