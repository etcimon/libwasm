module libwasm.bindings.SVGAnimatedBoolean;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct SVGAnimatedBoolean {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void baseVal()(bool baseVal) {
    Object_Call_bool__void(this.handle, "baseVal", baseVal);
  }
  bool baseVal()() {
    return Object_Getter__bool(this.handle, "baseVal");
  }
  bool animVal()() {
    return Object_Getter__bool(this.handle, "animVal");
  }
}


