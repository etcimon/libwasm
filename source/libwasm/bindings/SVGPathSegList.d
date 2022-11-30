module libwasm.bindings.SVGPathSegList;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGPathSeg;

@safe:
nothrow:

struct SVGPathSegList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint numberOfItems()() {
    return Object_Getter__uint(this.handle, "numberOfItems");
  }
  auto getItem()(uint index) {
    return SVGPathSeg(Object_Call_uint__Handle(this.handle, "getItem", index));
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
}


