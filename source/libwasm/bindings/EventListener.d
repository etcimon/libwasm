module libwasm.bindings.EventListener;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct EventListener {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void handleEvent()(scope ref Event event) {
    Object_Call_Handle__void(this.handle, "handleEvent", event.handle);
  }
}


