module libwasm.bindings.AudioWorkletProcessor;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.MessagePort;

@safe:
nothrow:

struct AudioWorkletProcessor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto port()() {
    return MessagePort(Object_Getter__Handle(this.handle, "port"));
  }
}


