module libwasm.bindings.WebGLContextEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct WebGLContextEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string statusMessage()() {
    return Object_Getter__string(this._parent, "statusMessage");
  }
}
struct WebGLContextEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return WebGLContextEventInit(libwasm_add__object());
  }
  void statusMessage()(string statusMessage) {
    Object_Call_string__void(this._parent, "statusMessage", statusMessage);
  }
  string statusMessage()() {
    return Object_Getter__string(this._parent, "statusMessage");
  }
}


