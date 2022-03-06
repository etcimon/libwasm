module spasm.bindings.MIDIPort;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;

@safe:
nothrow:

struct MIDIPort {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  Optional!(string) manufacturer()() {
    return Object_Getter__OptionalString(this._parent, "manufacturer");
  }
  Optional!(string) name()() {
    return Object_Getter__OptionalString(this._parent, "name");
  }
  Optional!(string) version_()() {
    return Object_Getter__OptionalString(this._parent, "version");
  }
  MIDIPortType type()() {
    return MIDIPort_type_Get(this._parent);
  }
  MIDIPortDeviceState state()() {
    return MIDIPort_state_Get(this._parent);
  }
  MIDIPortConnectionState connection()() {
    return MIDIPort_connection_Get(this._parent);
  }
  void onstatechange(T0)(scope auto ref Optional!(T0) onstatechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onstatechange", !onstatechange.empty, onstatechange.front);
  }
  EventHandler onstatechange()() {
    return Object_Getter__EventHandler(this._parent, "onstatechange");
  }
  auto open()() {
    return Promise!(MIDIPort)(Object_Getter__Handle(this._parent, "open"));
  }
  auto close()() {
    return Promise!(MIDIPort)(Object_Getter__Handle(this._parent, "close"));
  }
}
enum MIDIPortConnectionState {
  open,
  closed,
  pending
}
enum MIDIPortDeviceState {
  disconnected,
  connected
}
enum MIDIPortType {
  input,
  output
}


extern (C) MIDIPortType MIDIPort_type_Get(Handle);
extern (C) MIDIPortDeviceState MIDIPort_state_Get(Handle);
extern (C) MIDIPortConnectionState MIDIPort_connection_Get(Handle);