module spasm.bindings.AudioWorkletProcessor;

import spasm.types;
import spasm.bindings.MessagePort;

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


