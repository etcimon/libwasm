module spasm.bindings.StreamFilterDataEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct StreamFilterDataEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto data()() {
    return ArrayBuffer(Object_Getter__Handle(this._parent, "data"));
  }
}
struct StreamFilterDataEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return StreamFilterDataEventInit(spasm_add__object());
  }
  void data()(scope ref ArrayBuffer data) {
    Object_Call_Handle__void(this._parent, "data", data.handle);
  }
  auto data()() {
    return ArrayBuffer(Object_Getter__Handle(this._parent, "data"));
  }
}


