module libwasm.bindings.PresentationReceiver;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.PresentationConnectionList;

@safe:
nothrow:

struct PresentationReceiver {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto connectionList()() {
    return JsPromise!(PresentationConnectionList)(Object_Getter__Handle(this.handle, "connectionList"));
  }
}


