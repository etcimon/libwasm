module spasm.bindings.SVGNumber;

import spasm.types;
@safe:
nothrow:

struct SVGNumber {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void value()(float value) {
    Object_Call_float__void(this.handle, "value", value);
  }
  float value()() {
    return Object_Getter__float(this.handle, "value");
  }
}


