module spasm.bindings.PresentationConnectionAvailableEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.PresentationConnection;

@safe:
nothrow:

struct PresentationConnectionAvailableEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto connection()() {
    return PresentationConnection(Object_Getter__Handle(this._parent, "connection"));
  }
}
struct PresentationConnectionAvailableEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PresentationConnectionAvailableEventInit(spasm_add__object());
  }
  void connection()(scope ref PresentationConnection connection) {
    Object_Call_Handle__void(this._parent, "connection", connection.handle);
  }
  auto connection()() {
    return PresentationConnection(Object_Getter__Handle(this._parent, "connection"));
  }
}


