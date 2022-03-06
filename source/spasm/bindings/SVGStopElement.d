module spasm.bindings.SVGStopElement;

import spasm.types;
import spasm.bindings.SVGAnimatedNumber;
import spasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGStopElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto offset()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "offset"));
  }
}


