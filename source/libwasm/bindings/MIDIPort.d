module libwasm.bindings.MIDIPort;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct MIDIPort {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
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
    return Object_Getter__int(this._parent, "type");
  }
  MIDIPortDeviceState state()() {
    return Object_Getter__int(this._parent, "state");
  }
  MIDIPortConnectionState connection()() {
    return Object_Getter__int(this._parent, "connection");
  }
  void onstatechange(T0)(scope auto ref Optional!(T0) onstatechange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onstatechange", !onstatechange.empty, onstatechange.front);
  }
  EventHandler onstatechange()() {
    return Object_Getter__EventHandler(this._parent, "onstatechange");
  }
  auto open()() {
    return JsPromise!(MIDIPort)(Object_Getter__Handle(this._parent, "open"));
  }
  auto close()() {
    return JsPromise!(MIDIPort)(Object_Getter__Handle(this._parent, "close"));
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


