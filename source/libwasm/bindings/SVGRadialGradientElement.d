module libwasm.bindings.SVGRadialGradientElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGGradientElement;

@safe:
nothrow:

struct SVGRadialGradientElement {
  nothrow:
  libwasm.bindings.SVGGradientElement.SVGGradientElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGradientElement(h);
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
  auto fx()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "fx"));
  }
  auto fy()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "fy"));
  }
  auto fr()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "fr"));
  }
}


