module libwasm.bindings.SVGFEMorphologyElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFEMorphologyElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  enum ushort SVG_MORPHOLOGY_OPERATOR_UNKNOWN = 0;
  enum ushort SVG_MORPHOLOGY_OPERATOR_ERODE = 1;
  enum ushort SVG_MORPHOLOGY_OPERATOR_DILATE = 2;
  auto in1()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in1"));
  }
  auto operator()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "operator"));
  }
  auto radiusX()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "radiusX"));
  }
  auto radiusY()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "radiusY"));
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


