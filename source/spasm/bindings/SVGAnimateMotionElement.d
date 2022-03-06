module spasm.bindings.SVGAnimateMotionElement;

import spasm.types;
import spasm.bindings.SVGAnimationElement;

@safe:
nothrow:

struct SVGAnimateMotionElement {
  nothrow:
  spasm.bindings.SVGAnimationElement.SVGAnimationElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGAnimationElement(h);
  }
}


