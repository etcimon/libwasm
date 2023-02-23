module libwasm.bindings.SVGAnimatedAngle;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGAngle;

@safe:
nothrow:

struct SVGAnimatedAngle {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto baseVal()() {
    return SVGAngle(Object_Getter__Handle(this.handle, "baseVal"));
  }
  auto animVal()() {
    return SVGAngle(Object_Getter__Handle(this.handle, "animVal"));
  }
}


