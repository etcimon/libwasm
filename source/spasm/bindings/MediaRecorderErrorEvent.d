module spasm.bindings.MediaRecorderErrorEvent;

import spasm.types;
import spasm.bindings.DOMException;
import spasm.bindings.Event;

@safe:
nothrow:

struct MediaRecorderErrorEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto error()() {
    return DOMException(Object_Getter__Handle(this._parent, "error"));
  }
}
struct MediaRecorderErrorEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MediaRecorderErrorEventInit(spasm_add__object());
  }
  void error()(scope ref DOMException error) {
    Object_Call_Handle__void(this._parent, "error", error.handle);
  }
  auto error()() {
    return DOMException(Object_Getter__Handle(this._parent, "error"));
  }
}


