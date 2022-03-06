module spasm.bindings.MIDIInput;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.MIDIPort;

@safe:
nothrow:

struct MIDIInput {
  nothrow:
  spasm.bindings.MIDIPort.MIDIPort _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MIDIPort(h);
  }
  void onmidimessage(T0)(scope auto ref Optional!(T0) onmidimessage) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmidimessage", !onmidimessage.empty, onmidimessage.front);
  }
  EventHandler onmidimessage()() {
    return Object_Getter__EventHandler(this._parent, "onmidimessage");
  }
}


