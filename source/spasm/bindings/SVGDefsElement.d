module spasm.bindings.SVGDefsElement;

import spasm.types;
import spasm.bindings.SVGGraphicsElement;

@safe:
nothrow:

struct SVGDefsElement {
  nothrow:
  spasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGraphicsElement(h);
  }
}


