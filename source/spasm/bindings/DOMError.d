module spasm.bindings.DOMError;

import spasm.types;
@safe:
nothrow:

struct DOMError {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  string message()() {
    return Object_Getter__string(this.handle, "message");
  }
}


