module libwasm.bindings.MediaRecorderErrorEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DOMException;
import libwasm.bindings.Event;

@safe:
nothrow:

struct MediaRecorderErrorEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
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
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return MediaRecorderErrorEventInit(libwasm_add__object());
  }
  void error()(scope ref DOMException error) {
    Object_Call_Handle__void(this._parent, "error", error.handle);
  }
  auto error()() {
    return DOMException(Object_Getter__Handle(this._parent, "error"));
  }
}


