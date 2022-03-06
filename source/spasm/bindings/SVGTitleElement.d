module spasm.bindings.SVGTitleElement;

import spasm.types;
import spasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGTitleElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
}


