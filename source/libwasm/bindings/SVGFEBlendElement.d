module libwasm.bindings.SVGFEBlendElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFilterPrimitiveStandardAttributes;

@safe:
nothrow:

struct SVGFEBlendElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  enum ushort SVG_FEBLEND_MODE_UNKNOWN = 0;
  enum ushort SVG_FEBLEND_MODE_NORMAL = 1;
  enum ushort SVG_FEBLEND_MODE_MULTIPLY = 2;
  enum ushort SVG_FEBLEND_MODE_SCREEN = 3;
  enum ushort SVG_FEBLEND_MODE_DARKEN = 4;
  enum ushort SVG_FEBLEND_MODE_LIGHTEN = 5;
  enum ushort SVG_FEBLEND_MODE_OVERLAY = 6;
  enum ushort SVG_FEBLEND_MODE_COLOR_DODGE = 7;
  enum ushort SVG_FEBLEND_MODE_COLOR_BURN = 8;
  enum ushort SVG_FEBLEND_MODE_HARD_LIGHT = 9;
  enum ushort SVG_FEBLEND_MODE_SOFT_LIGHT = 10;
  enum ushort SVG_FEBLEND_MODE_DIFFERENCE = 11;
  enum ushort SVG_FEBLEND_MODE_EXCLUSION = 12;
  enum ushort SVG_FEBLEND_MODE_HUE = 13;
  enum ushort SVG_FEBLEND_MODE_SATURATION = 14;
  enum ushort SVG_FEBLEND_MODE_COLOR = 15;
  enum ushort SVG_FEBLEND_MODE_LUMINOSITY = 16;
  auto in1()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in1"));
  }
  auto in2()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "in2"));
  }
  auto mode()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "mode"));
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


