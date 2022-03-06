module spasm.bindings.SVGFEPointLightElement;

import spasm.types;
import spasm.bindings.SVGAnimatedNumber;
import spasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGFEPointLightElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto x()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "x"));
  }
  auto y()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "y"));
  }
  auto z()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "z"));
  }
}


