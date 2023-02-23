module libwasm.bindings.SVGAnimatedPoints;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGPointList;

@safe:
nothrow:

struct SVGAnimatedPoints {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto points()() {
    return SVGPointList(Object_Getter__Handle(this.handle, "points"));
  }
  auto animatedPoints()() {
    return SVGPointList(Object_Getter__Handle(this.handle, "animatedPoints"));
  }
}


