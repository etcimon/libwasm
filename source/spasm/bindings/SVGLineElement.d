module spasm.bindings.SVGLineElement;

import spasm.types;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGGeometryElement;

@safe:
nothrow:

struct SVGLineElement {
  nothrow:
  spasm.bindings.SVGGeometryElement.SVGGeometryElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGeometryElement(h);
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


