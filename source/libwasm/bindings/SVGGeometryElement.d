module libwasm.bindings.SVGGeometryElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGGraphicsElement;
import libwasm.bindings.SVGPoint;

@safe:
nothrow:

struct SVGGeometryElement {
  nothrow:
  libwasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
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
    return SVGPoint(Serialize_Object_VarArgCall!Handle(this._parent, "getPointAtLength", "float", tuple(distance)));
  }
}


