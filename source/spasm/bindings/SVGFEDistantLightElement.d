module spasm.bindings.SVGFEDistantLightElement;

import spasm.types;
import spasm.bindings.SVGAnimatedNumber;
import spasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGFEDistantLightElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto azimuth()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "azimuth"));
  }
  auto elevation()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "elevation"));
  }
}


