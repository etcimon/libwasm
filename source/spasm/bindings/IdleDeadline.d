module spasm.bindings.IdleDeadline;

import spasm.types;
import spasm.bindings.Performance;

@safe:
nothrow:

struct IdleDeadline {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  double timeRemaining()() {
    return Object_Getter__double(this.handle, "timeRemaining");
  }
  bool didTimeout()() {
    return Object_Getter__bool(this.handle, "didTimeout");
  }
}


