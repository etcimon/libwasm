module libwasm.bindings.SVGAnimatedEnumeration;

import libwasm.types;

import std.typecons: tuple;
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
    Serialize_Object_VarArgCall!void(this.handle, "baseVal", "ushort", tuple(baseVal));
  }
  ushort baseVal()() {
    return Object_Getter__ushort(this.handle, "baseVal");
  }
  ushort animVal()() {
    return Object_Getter__ushort(this.handle, "animVal");
  }
}


