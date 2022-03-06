module spasm.bindings.StructuredCloneTester;

import spasm.types;
@safe:
nothrow:

struct StructuredCloneTester {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool serializable()() {
    return Object_Getter__bool(this.handle, "serializable");
  }
  bool deserializable()() {
    return Object_Getter__bool(this.handle, "deserializable");
  }
}


