module spasm.bindings.SVGAnimatedString;

import spasm.types;
@safe:
nothrow:

struct SVGAnimatedString {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void baseVal()(string baseVal) {
    Object_Call_string__void(this.handle, "baseVal", baseVal);
  }
  string baseVal()() {
    return Object_Getter__string(this.handle, "baseVal");
  }
  string animVal()() {
    return Object_Getter__string(this.handle, "animVal");
  }
}


