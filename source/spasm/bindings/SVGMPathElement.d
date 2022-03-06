module spasm.bindings.SVGMPathElement;

import spasm.types;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGElement;
import spasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGMPathElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


