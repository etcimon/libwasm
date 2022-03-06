module spasm.bindings.WindowRoot;

import spasm.types;
import spasm.bindings.EventTarget;

@safe:
nothrow:

struct WindowRoot {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
}


