module libwasm.bindings.SVGAnimatedNumberList;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGNumberList;

@safe:
nothrow:

struct SVGAnimatedNumberList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto baseVal()() {
    return SVGNumberList(Object_Getter__Handle(this.handle, "baseVal"));
  }
  auto animVal()() {
    return SVGNumberList(Object_Getter__Handle(this.handle, "animVal"));
  }
}


