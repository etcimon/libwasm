module libwasm.bindings.SVGPathElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedPathData;
import libwasm.bindings.SVGGeometryElement;
import libwasm.bindings.SVGPathSegList;

@safe:
nothrow:

struct SVGPathElement {
  nothrow:
  libwasm.bindings.SVGGeometryElement.SVGGeometryElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGeometryElement(h);
  }
  uint getPathSegAtLength()(float distance) {
    return Serialize_Object_VarArgCall!uint(this._parent, "getPathSegAtLength", "float", tuple(distance));
  }
  auto pathSegList()() {
    return SVGPathSegList(Object_Getter__Handle(this._parent, "pathSegList"));
  }
  auto animatedPathSegList()() {
    return SVGPathSegList(Object_Getter__Handle(this._parent, "animatedPathSegList"));
  }
}


