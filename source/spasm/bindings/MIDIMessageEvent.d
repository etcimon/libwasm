module spasm.bindings.MIDIMessageEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct MIDIMessageEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto data()() {
    return Uint8Array(Object_Getter__Handle(this._parent, "data"));
  }
}
struct MIDIMessageEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MIDIMessageEventInit(spasm_add__object());
  }
  void data()(scope ref Uint8Array data) {
    Object_Call_Handle__void(this._parent, "data", data.handle);
  }
  auto data()() {
    return Uint8Array(Object_Getter__Handle(this._parent, "data"));
  }
}


