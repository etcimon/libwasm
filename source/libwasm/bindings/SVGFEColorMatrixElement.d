module libwasm.bindings.SVGFEColorMatrixElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedNumberList;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFEColorMatrixElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  enum ushort SVG_FECOLORMATRIX_TYPE_UNKNOWN = 0;
  enum ushort SVG_FECOLORMATRIX_TYPE_MATRIX = 1;
  enum ushort SVG_FECOLORMATRIX_TYPE_SATURATE = 2;
  enum ushort SVG_FECOLORMATRIX_TYPE_HUEROTATE = 3;
  enum ushort SVG_FECOLORMATRIX_TYPE_LUMINANCETOALPHA = 4;
  auto in1()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in1"));
  }
  auto type()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "type"));
  }
  auto values()() {
    return SVGAnimatedNumberList(Object_Getter__Handle(this._parent, "values"));
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


