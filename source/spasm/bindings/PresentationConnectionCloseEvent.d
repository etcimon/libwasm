module spasm.bindings.PresentationConnectionCloseEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct PresentationConnectionCloseEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  PresentationConnectionClosedReason reason()() {
    return PresentationConnectionCloseEvent_reason_Get(this._parent);
  }
  string message()() {
    return Object_Getter__string(this._parent, "message");
  }
}
struct PresentationConnectionCloseEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return PresentationConnectionCloseEventInit(spasm_add__object());
  }
  void reason()(PresentationConnectionClosedReason reason) {
    PresentationConnectionCloseEventInit_reason_Set(this._parent, reason);
  }
  PresentationConnectionClosedReason reason()() {
    return PresentationConnectionCloseEventInit_reason_Get(this._parent);
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


extern (C) PresentationConnectionClosedReason PresentationConnectionCloseEvent_reason_Get(Handle);
extern (C) void PresentationConnectionCloseEventInit_reason_Set(Handle, PresentationConnectionClosedReason);
extern (C) PresentationConnectionClosedReason PresentationConnectionCloseEventInit_reason_Get(Handle);