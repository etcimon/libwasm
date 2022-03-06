module spasm.bindings.RTCDTMFToneChangeEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct RTCDTMFToneChangeEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string tone()() {
    return Object_Getter__string(this._parent, "tone");
  }
}
struct RTCDTMFToneChangeEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return RTCDTMFToneChangeEventInit(spasm_add__object());
  }
  void tone()(string tone) {
    Object_Call_string__void(this._parent, "tone", tone);
  }
  string tone()() {
    return Object_Getter__string(this._parent, "tone");
  }
}


