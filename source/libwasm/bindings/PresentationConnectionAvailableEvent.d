module libwasm.bindings.PresentationConnectionAvailableEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.PresentationConnection;

@safe:
nothrow:

struct PresentationConnectionAvailableEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
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
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PresentationConnectionAvailableEventInit(libwasm_add__object());
  }
  void connection()(scope ref PresentationConnection connection) {
    Object_Call_Handle__void(this._parent, "connection", connection.handle);
  }
  auto connection()() {
    return PresentationConnection(Object_Getter__Handle(this._parent, "connection"));
  }
}


