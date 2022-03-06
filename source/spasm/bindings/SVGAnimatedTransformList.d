module spasm.bindings.SVGAnimatedTransformList;

import spasm.types;
import spasm.bindings.SVGTransformList;

@safe:
nothrow:

struct SVGAnimatedTransformList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto baseVal()() {
    return SVGTransformList(Object_Getter__Handle(this.handle, "baseVal"));
  }
  auto animVal()() {
    return SVGTransformList(Object_Getter__Handle(this.handle, "animVal"));
  }
}


