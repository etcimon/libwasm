module libwasm.bindings.SVGNumber;

import libwasm.types;

import std.typecons: tuple;
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


