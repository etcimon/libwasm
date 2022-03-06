module spasm.bindings.SVGAnimatedEnumeration;

import spasm.types;
@safe:
nothrow:

struct SVGAnimatedEnumeration {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void baseVal()(ushort baseVal) {
    SVGAnimatedEnumeration_baseVal_Set(this.handle, baseVal);
  }
  ushort baseVal()() {
    return Object_Getter__ushort(this.handle, "baseVal");
  }
  ushort animVal()() {
    return Object_Getter__ushort(this.handle, "animVal");
  }
}


extern (C) void SVGAnimatedEnumeration_baseVal_Set(Handle, ushort);