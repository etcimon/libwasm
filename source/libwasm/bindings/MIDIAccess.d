module libwasm.bindings.MIDIAccess;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.MIDIInputMap;
import libwasm.bindings.MIDIOutputMap;

@safe:
nothrow:

struct MIDIAccess {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto inputs()() {
    return MIDIInputMap(Object_Getter__Handle(this._parent, "inputs"));
  }
  auto outputs()() {
    return MIDIOutputMap(Object_Getter__Handle(this._parent, "outputs"));
  }
  void onstatechange(T0)(scope auto ref Optional!(T0) onstatechange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onstatechange", !onstatechange.empty, onstatechange.front);
  }
  EventHandler onstatechange()() {
    return Object_Getter__EventHandler(this._parent, "onstatechange");
  }
  bool sysexEnabled()() {
    return Object_Getter__bool(this._parent, "sysexEnabled");
  }
}


