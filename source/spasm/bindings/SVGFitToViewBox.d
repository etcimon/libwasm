module spasm.bindings.SVGFitToViewBox;

import spasm.types;
import spasm.bindings.SVGAnimatedPreserveAspectRatio;
import spasm.bindings.SVGAnimatedRect;

@safe:
nothrow:

struct SVGFitToViewBox {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto viewBox()() {
    return SVGAnimatedRect(Object_Getter__Handle(this.handle, "viewBox"));
  }
  auto preserveAspectRatio()() {
    return SVGAnimatedPreserveAspectRatio(Object_Getter__Handle(this.handle, "preserveAspectRatio"));
  }
}


