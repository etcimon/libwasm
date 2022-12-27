module libwasm.bindings.SVGFECompositeElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFECompositeElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  enum ushort SVG_FECOMPOSITE_OPERATOR_UNKNOWN = 0;
  enum ushort SVG_FECOMPOSITE_OPERATOR_OVER = 1;
  enum ushort SVG_FECOMPOSITE_OPERATOR_IN = 2;
  enum ushort SVG_FECOMPOSITE_OPERATOR_OUT = 3;
  enum ushort SVG_FECOMPOSITE_OPERATOR_ATOP = 4;
  enum ushort SVG_FECOMPOSITE_OPERATOR_XOR = 5;
  enum ushort SVG_FECOMPOSITE_OPERATOR_ARITHMETIC = 6;
  auto in1()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in1"));
  }
  auto in2()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in2"));
  }
  auto operator()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "operator"));
  }
  auto k1()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "k1"));
  }
  auto k2()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "k2"));
  }
  auto k3()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "k3"));
  }
  auto k4()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "k4"));
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


