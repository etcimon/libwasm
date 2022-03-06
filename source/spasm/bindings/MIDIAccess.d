module spasm.bindings.MIDIAccess;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.MIDIInputMap;
import spasm.bindings.MIDIOutputMap;

@safe:
nothrow:

struct MIDIAccess {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
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
  void onstatechange(T0)(scope auto ref Optional!(T0) onstatechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onstatechange", !onstatechange.empty, onstatechange.front);
  }
  EventHandler onstatechange()() {
    return Object_Getter__EventHandler(this._parent, "onstatechange");
  }
  bool sysexEnabled()() {
    return Object_Getter__bool(this._parent, "sysexEnabled");
  }
}


