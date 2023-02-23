module libwasm.bindings.SVGTextElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGTextPositioningElement;

@safe:
nothrow:

struct SVGTextElement {
  nothrow:
  libwasm.bindings.SVGTextPositioningElement.SVGTextPositioningElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGTextPositioningElement(h);
  }
}


