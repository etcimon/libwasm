module spasm.bindings.SVGGElement;

import spasm.types;
import spasm.bindings.SVGGraphicsElement;

@safe:
nothrow:

struct SVGGElement {
  nothrow:
  spasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGraphicsElement(h);
  }
}


