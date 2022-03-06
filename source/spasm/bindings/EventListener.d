module spasm.bindings.EventListener;

import spasm.types;
import spasm.bindings.Event;

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


