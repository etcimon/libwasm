module libwasm.bindings.SVGFEDiffuseLightingElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFEDiffuseLightingElement {
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
  auto diffuseConstant()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "diffuseConstant"));
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


