module libwasm.bindings.MIDIInput;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.MIDIPort;

@safe:
nothrow:

struct MIDIInput {
  nothrow:
  libwasm.bindings.MIDIPort.MIDIPort _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MIDIPort(h);
  }
  void onmidimessage(T0)(scope auto ref Optional!(T0) onmidimessage) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onmidimessage", !onmidimessage.empty, onmidimessage.front);
  }
  EventHandler onmidimessage()() {
    return Object_Getter__EventHandler(this._parent, "onmidimessage");
  }
}


