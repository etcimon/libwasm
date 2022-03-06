module spasm.bindings.AbortController;

import spasm.types;
import spasm.bindings.AbortSignal;

@safe:
nothrow:

struct AbortController {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto signal()() {
    return AbortSignal(Object_Getter__Handle(this.handle, "signal"));
  }
  void abort()() {
    Object_Call__void(this.handle, "abort");
  }
}


