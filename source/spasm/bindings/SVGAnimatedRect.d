module spasm.bindings.SVGAnimatedRect;

import spasm.types;
import spasm.bindings.SVGRect;

@safe:
nothrow:

struct SVGAnimatedRect {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto baseVal()() {
    return Object_Getter__OptionalHandle(this.handle, "baseVal");
  }
  auto animVal()() {
    return Object_Getter__OptionalHandle(this.handle, "animVal");
  }
}


