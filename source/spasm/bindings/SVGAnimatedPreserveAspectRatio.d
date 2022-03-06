module spasm.bindings.SVGAnimatedPreserveAspectRatio;

import spasm.types;
import spasm.bindings.SVGPreserveAspectRatio;

@safe:
nothrow:

struct SVGAnimatedPreserveAspectRatio {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto baseVal()() {
    return SVGPreserveAspectRatio(Object_Getter__Handle(this.handle, "baseVal"));
  }
  auto animVal()() {
    return SVGPreserveAspectRatio(Object_Getter__Handle(this.handle, "animVal"));
  }
}


