module spasm.bindings.SVGAnimatedLength;

import spasm.types;
import spasm.bindings.SVGLength;

@safe:
nothrow:

struct SVGAnimatedLength {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto baseVal()() {
    return SVGLength(Object_Getter__Handle(this.handle, "baseVal"));
  }
  auto animVal()() {
    return SVGLength(Object_Getter__Handle(this.handle, "animVal"));
  }
}


