module libwasm.bindings.ExtendableEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct ExtendableEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  void waitUntil()(scope ref JsPromise!(Any) p) {
    Object_Call_Handle__void(this._parent, "waitUntil", p.handle);
  }
}
struct ExtendableEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return ExtendableEventInit(libwasm_add__object());
  }
}


