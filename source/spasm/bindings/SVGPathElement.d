module spasm.bindings.SVGPathElement;

import spasm.types;
import spasm.bindings.SVGAnimatedPathData;
import spasm.bindings.SVGGeometryElement;
import spasm.bindings.SVGPathSegList;

@safe:
nothrow:

struct SVGPathElement {
  nothrow:
  spasm.bindings.SVGGeometryElement.SVGGeometryElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGeometryElement(h);
  }
  uint getPathSegAtLength()(float distance) {
    return SVGPathElement_getPathSegAtLength(this._parent, distance);
  }
  auto pathSegList()() {
    return SVGPathSegList(Object_Getter__Handle(this._parent, "pathSegList"));
  }
  auto animatedPathSegList()() {
    return SVGPathSegList(Object_Getter__Handle(this._parent, "animatedPathSegList"));
  }
}


extern (C) uint SVGPathElement_getPathSegAtLength(Handle, float);