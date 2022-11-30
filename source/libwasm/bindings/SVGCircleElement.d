module libwasm.bindings.SVGCircleElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGGeometryElement;

@safe:
nothrow:

struct SVGCircleElement {
  nothrow:
  libwasm.bindings.SVGGeometryElement.SVGGeometryElement _parent;
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
  auto r()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "r"));
  }
}


