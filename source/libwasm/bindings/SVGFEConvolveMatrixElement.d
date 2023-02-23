module libwasm.bindings.SVGFEConvolveMatrixElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGAnimatedBoolean;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedInteger;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGAnimatedNumberList;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFEConvolveMatrixElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  enum ushort SVG_EDGEMODE_UNKNOWN = 0;
  enum ushort SVG_EDGEMODE_DUPLICATE = 1;
  enum ushort SVG_EDGEMODE_WRAP = 2;
  enum ushort SVG_EDGEMODE_NONE = 3;
  auto in1()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in1"));
  }
  auto orderX()() {
    return SVGAnimatedInteger(Object_Getter__Handle(this._parent, "orderX"));
  }
  auto orderY()() {
    return SVGAnimatedInteger(Object_Getter__Handle(this._parent, "orderY"));
  }
  auto kernelMatrix()() {
    return SVGAnimatedNumberList(Object_Getter__Handle(this._parent, "kernelMatrix"));
  }
  auto divisor()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "divisor"));
  }
  auto bias()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "bias"));
  }
  auto targetX()() {
    return SVGAnimatedInteger(Object_Getter__Handle(this._parent, "targetX"));
  }
  auto targetY()() {
    return SVGAnimatedInteger(Object_Getter__Handle(this._parent, "targetY"));
  }
  auto edgeMode()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "edgeMode"));
  }
  auto kernelUnitLengthX()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "kernelUnitLengthX"));
  }
  auto kernelUnitLengthY()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "kernelUnitLengthY"));
  }
  auto preserveAlpha()() {
    return SVGAnimatedBoolean(Object_Getter__Handle(this._parent, "preserveAlpha"));
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


