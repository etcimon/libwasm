module libwasm.bindings.SVGLineElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGGeometryElement;

@safe:
nothrow:

struct SVGLineElement {
  nothrow:
  libwasm.bindings.SVGGeometryElement.SVGGeometryElement _parent;
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


