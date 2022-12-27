module libwasm.bindings.SVGTSpanElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGTextPositioningElement;

@safe:
nothrow:

struct SVGTSpanElement {
  nothrow:
  libwasm.bindings.SVGTextPositioningElement.SVGTextPositioningElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGTextPositioningElement(h);
  }
}


