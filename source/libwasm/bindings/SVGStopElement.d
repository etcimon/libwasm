module libwasm.bindings.SVGStopElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGStopElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto offset()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "offset"));
  }
}


