module libwasm.bindings.SVGFESpotLightElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGFESpotLightElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto x()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "x"));
  }
  auto y()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "y"));
  }
  auto z()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "z"));
  }
  auto pointsAtX()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "pointsAtX"));
  }
  auto pointsAtY()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "pointsAtY"));
  }
  auto pointsAtZ()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "pointsAtZ"));
  }
  auto specularExponent()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "specularExponent"));
  }
  auto limitingConeAngle()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "limitingConeAngle"));
  }
}


