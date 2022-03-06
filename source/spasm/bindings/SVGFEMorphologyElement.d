module spasm.bindings.SVGFEMorphologyElement;

import spasm.types;
import spasm.bindings.SVGAnimatedEnumeration;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGAnimatedNumber;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGElement;
import spasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFEMorphologyElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
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


