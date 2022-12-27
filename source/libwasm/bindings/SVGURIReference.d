module libwasm.bindings.SVGURIReference;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedString;

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


