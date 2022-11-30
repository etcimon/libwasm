module libwasm.bindings.SVGFESpecularLightingElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFESpecularLightingElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto in1()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in1"));
  }
  auto surfaceScale()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "surfaceScale"));
  }
  auto specularConstant()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "specularConstant"));
  }
  auto specularExponent()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "specularExponent"));
  }
  auto kernelUnitLengthX()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "kernelUnitLengthX"));
  }
  auto kernelUnitLengthY()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "kernelUnitLengthY"));
  }
  auto x()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "x"));
  }
  auto y()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "y"));
  }
  auto width()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "width"));
  }
  auto height()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "height"));
  }
  auto result()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "result"));
  }
}


