module spasm.bindings.MediaKeyError;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct MediaKeyError {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  uint systemCode()() {
    return Object_Getter__uint(this._parent, "systemCode");
  }
}


