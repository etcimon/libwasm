module spasm.bindings.SVGURIReference;

import spasm.types;
import spasm.bindings.SVGAnimatedString;

@safe:
nothrow:

struct SVGURIReference {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this.handle, "href"));
  }
}


