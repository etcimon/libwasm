module spasm.bindings.SVGTSpanElement;

import spasm.types;
import spasm.bindings.SVGTextPositioningElement;

@safe:
nothrow:

struct SVGTSpanElement {
  nothrow:
  spasm.bindings.SVGTextPositioningElement.SVGTextPositioningElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGTextPositioningElement(h);
  }
}


