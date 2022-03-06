module spasm.bindings.SVGPolygonElement;

import spasm.types;
import spasm.bindings.SVGAnimatedPoints;
import spasm.bindings.SVGGeometryElement;
import spasm.bindings.SVGPointList;

@safe:
nothrow:

struct SVGPolygonElement {
  nothrow:
  spasm.bindings.SVGGeometryElement.SVGGeometryElement _parent;
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


