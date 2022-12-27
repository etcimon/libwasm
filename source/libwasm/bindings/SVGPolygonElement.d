module libwasm.bindings.SVGPolygonElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedPoints;
import libwasm.bindings.SVGGeometryElement;
import libwasm.bindings.SVGPointList;

@safe:
nothrow:

struct SVGPolygonElement {
  nothrow:
  libwasm.bindings.SVGGeometryElement.SVGGeometryElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGeometryElement(h);
  }
  auto points()() {
    return SVGPointList(Object_Getter__Handle(this._parent, "points"));
  }
  auto animatedPoints()() {
    return SVGPointList(Object_Getter__Handle(this._parent, "animatedPoints"));
  }
}


