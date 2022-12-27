module libwasm.bindings.StructuredCloneTester;

import libwasm.types;

import memutils.ct: tuple;
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


