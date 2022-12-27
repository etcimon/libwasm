module libwasm.bindings.SVGFEDistantLightElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGFEDistantLightElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
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


