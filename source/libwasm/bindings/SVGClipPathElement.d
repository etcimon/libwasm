module libwasm.bindings.SVGClipPathElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedTransformList;
import libwasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGClipPathElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto clipPathUnits()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "clipPathUnits"));
  }
  auto transform()() {
    return SVGAnimatedTransformList(Object_Getter__Handle(this._parent, "transform"));
  }
}


