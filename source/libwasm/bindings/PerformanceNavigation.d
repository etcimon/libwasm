module libwasm.bindings.PerformanceNavigation;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct PerformanceNavigation {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort TYPE_NAVIGATE = 0;
  enum ushort TYPE_RELOAD = 1;
  enum ushort TYPE_BACK_FORWARD = 2;
  enum ushort TYPE_RESERVED = 255;
  ushort type()() {
    return Object_Getter__ushort(this.handle, "type");
  }
  ushort redirectCount()() {
    return Object_Getter__ushort(this.handle, "redirectCount");
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this.handle, "toJSON"));
  }
}


