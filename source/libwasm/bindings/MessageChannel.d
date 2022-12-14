module libwasm.bindings.MessageChannel;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.MessagePort;

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


