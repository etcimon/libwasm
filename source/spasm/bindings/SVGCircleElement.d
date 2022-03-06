module spasm.bindings.SVGCircleElement;

import spasm.types;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGGeometryElement;

@safe:
nothrow:

struct SVGCircleElement {
  nothrow:
  spasm.bindings.SVGGeometryElement.SVGGeometryElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGeometryElement(h);
  }
  auto cx()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "cx"));
  }
  auto cy()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "cy"));
  }
  auto r()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "r"));
  }
}


