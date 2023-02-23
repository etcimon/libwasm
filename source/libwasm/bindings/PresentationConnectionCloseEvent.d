module libwasm.bindings.PresentationConnectionCloseEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct PresentationConnectionCloseEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  PresentationConnectionClosedReason reason()() {
    return Object_Getter__int(this._parent, "reason");
  }
  string message()() {
    return Object_Getter__string(this._parent, "message");
  }
}
struct PresentationConnectionCloseEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PresentationConnectionCloseEventInit(libwasm_add__object());
  }
  void reason()(PresentationConnectionClosedReason reason) {
    Object_Call_int__void(this._parent, "reason", reason);
  }
  PresentationConnectionClosedReason reason()() {
    return Object_Getter__int(this._parent, "reason");
  }
  void message()(string message) {
    Object_Call_string__void(this._parent, "message", message);
  }
  string message()() {
    return Object_Getter__string(this._parent, "message");
  }
}
enum PresentationConnectionClosedReason {
  error,
  closed,
  wentaway
}


