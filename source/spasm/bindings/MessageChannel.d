module spasm.bindings.MessageChannel;

import spasm.types;
import spasm.bindings.MessagePort;

@safe:
nothrow:

struct MessageChannel {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto port1()() {
    return MessagePort(Object_Getter__Handle(this.handle, "port1"));
  }
  auto port2()() {
    return MessagePort(Object_Getter__Handle(this.handle, "port2"));
  }
}


