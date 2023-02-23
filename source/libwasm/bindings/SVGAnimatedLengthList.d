module libwasm.bindings.SVGAnimatedLengthList;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGLengthList;

@safe:
nothrow:

struct SVGAnimatedLengthList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto baseVal()() {
    return SVGLengthList(Object_Getter__Handle(this.handle, "baseVal"));
  }
  auto animVal()() {
    return SVGLengthList(Object_Getter__Handle(this.handle, "animVal"));
  }
}


