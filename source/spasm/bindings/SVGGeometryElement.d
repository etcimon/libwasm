module spasm.bindings.SVGGeometryElement;

import spasm.types;
import spasm.bindings.SVGAnimatedNumber;
import spasm.bindings.SVGGraphicsElement;
import spasm.bindings.SVGPoint;

@safe:
nothrow:

struct SVGGeometryElement {
  nothrow:
  spasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGraphicsElement(h);
  }
  auto pathLength()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "pathLength"));
  }
  float getTotalLength()() {
    return Object_Getter__float(this._parent, "getTotalLength");
  }
  auto getPointAtLength()(float distance) {
    return SVGPoint(SVGGeometryElement_getPointAtLength(this._parent, distance));
  }
}


extern (C) Handle SVGGeometryElement_getPointAtLength(Handle, float);