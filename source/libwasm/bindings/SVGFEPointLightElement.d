module libwasm.bindings.SVGFEPointLightElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGFEPointLightElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
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


