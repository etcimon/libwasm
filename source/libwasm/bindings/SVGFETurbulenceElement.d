module libwasm.bindings.SVGFETurbulenceElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedInteger;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedNumber;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFETurbulenceElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  enum ushort SVG_TURBULENCE_TYPE_UNKNOWN = 0;
  enum ushort SVG_TURBULENCE_TYPE_FRACTALNOISE = 1;
  enum ushort SVG_TURBULENCE_TYPE_TURBULENCE = 2;
  enum ushort SVG_STITCHTYPE_UNKNOWN = 0;
  enum ushort SVG_STITCHTYPE_STITCH = 1;
  enum ushort SVG_STITCHTYPE_NOSTITCH = 2;
  auto baseFrequencyX()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "baseFrequencyX"));
  }
  auto baseFrequencyY()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "baseFrequencyY"));
  }
  auto numOctaves()() {
    return SVGAnimatedInteger(Object_Getter__Handle(this._parent, "numOctaves"));
  }
  auto seed()() {
    return SVGAnimatedNumber(Object_Getter__Handle(this._parent, "seed"));
  }
  auto stitchTiles()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "stitchTiles"));
  }
  auto type()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "type"));
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


