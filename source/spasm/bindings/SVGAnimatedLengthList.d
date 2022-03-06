module spasm.bindings.SVGAnimatedLengthList;

import spasm.types;
import spasm.bindings.SVGLengthList;

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


