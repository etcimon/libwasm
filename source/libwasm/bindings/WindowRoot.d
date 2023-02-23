module libwasm.bindings.WindowRoot;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct WindowRoot {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
}


