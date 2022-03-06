module spasm.bindings.SVGMetadataElement;

import spasm.types;
import spasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGMetadataElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
}


