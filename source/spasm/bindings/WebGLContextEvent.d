module spasm.bindings.WebGLContextEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct WebGLContextEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
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
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return WebGLContextEventInit(spasm_add__object());
  }
  void statusMessage()(string statusMessage) {
    Object_Call_string__void(this._parent, "statusMessage", statusMessage);
  }
  string statusMessage()() {
    return Object_Getter__string(this._parent, "statusMessage");
  }
}


