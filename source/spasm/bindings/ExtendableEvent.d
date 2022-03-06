module spasm.bindings.ExtendableEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct ExtendableEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  void waitUntil()(scope ref Promise!(Any) p) {
    Object_Call_Handle__void(this._parent, "waitUntil", p.handle);
  }
}
struct ExtendableEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return ExtendableEventInit(spasm_add__object());
  }
}


