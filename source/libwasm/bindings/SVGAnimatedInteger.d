module libwasm.bindings.SVGAnimatedInteger;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct SVGAnimatedInteger {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void baseVal()(int baseVal) {
    Object_Call_int__void(this.handle, "baseVal", baseVal);
  }
  int baseVal()() {
    return Object_Getter__int(this.handle, "baseVal");
  }
  int animVal()() {
    return Object_Getter__int(this.handle, "animVal");
  }
}


