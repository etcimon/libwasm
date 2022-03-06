module spasm.bindings.SVGTextElement;

import spasm.types;
import spasm.bindings.SVGTextPositioningElement;

@safe:
nothrow:

struct SVGTextElement {
  nothrow:
  spasm.bindings.SVGTextPositioningElement.SVGTextPositioningElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGTextPositioningElement(h);
  }
}


