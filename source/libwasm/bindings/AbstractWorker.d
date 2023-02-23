module libwasm.bindings.AbstractWorker;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventHandler;

@safe:
nothrow:

struct AbstractWorker {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this.handle, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this.handle, "onerror");
  }
}


