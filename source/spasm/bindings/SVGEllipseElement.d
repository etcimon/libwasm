module spasm.bindings.SVGEllipseElement;

import spasm.types;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGGeometryElement;

@safe:
nothrow:

struct SVGEllipseElement {
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
  auto rx()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "rx"));
  }
  auto ry()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "ry"));
  }
}


