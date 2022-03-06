module spasm.bindings.PresentationReceiver;

import spasm.types;
import spasm.bindings.PresentationConnectionList;

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
    return Promise!(PresentationConnectionList)(Object_Getter__Handle(this.handle, "connectionList"));
  }
}


