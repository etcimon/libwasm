module spasm.bindings.SVGLinearGradientElement;

import spasm.types;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGGradientElement;

@safe:
nothrow:

struct SVGLinearGradientElement {
  nothrow:
  spasm.bindings.SVGGradientElement.SVGGradientElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGradientElement(h);
  }
  auto x1()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "x1"));
  }
  auto y1()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "y1"));
  }
  auto x2()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "x2"));
  }
  auto y2()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "y2"));
  }
}


