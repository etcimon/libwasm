module libwasm.bindings.MediaKeyError;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct MediaKeyError {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  uint systemCode()() {
    return Object_Getter__uint(this._parent, "systemCode");
  }
}


