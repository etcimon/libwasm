module libwasm.bindings.SVGAnimatedNumber;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct SVGAnimatedNumber {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void baseVal()(float baseVal) {
    Object_Call_float__void(this.handle, "baseVal", baseVal);
  }
  float baseVal()() {
    return Object_Getter__float(this.handle, "baseVal");
  }
  float animVal()() {
    return Object_Getter__float(this.handle, "animVal");
  }
}


