module libwasm.bindings.SVGAnimateTransformElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimationElement;

@safe:
nothrow:

struct SVGAnimateTransformElement {
  nothrow:
  libwasm.bindings.SVGAnimationElement.SVGAnimationElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGAnimationElement(h);
  }
}


