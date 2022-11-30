module libwasm.bindings.SVGAnimateElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGAnimationElement;

@safe:
nothrow:

struct SVGAnimateElement {
  nothrow:
  libwasm.bindings.SVGAnimationElement.SVGAnimationElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGAnimationElement(h);
  }
}


