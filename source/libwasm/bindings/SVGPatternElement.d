module libwasm.bindings.SVGPatternElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedPreserveAspectRatio;
import libwasm.bindings.SVGAnimatedRect;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGAnimatedTransformList;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFitToViewBox;
import libwasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGPatternElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto patternUnits()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "patternUnits"));
  }
  auto patternContentUnits()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "patternContentUnits"));
  }
  auto patternTransform()() {
    return SVGAnimatedTransformList(Object_Getter__Handle(this._parent, "patternTransform"));
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
  auto viewBox()() {
    return SVGAnimatedRect(Object_Getter__Handle(this._parent, "viewBox"));
  }
  auto preserveAspectRatio()() {
    return SVGAnimatedPreserveAspectRatio(Object_Getter__Handle(this._parent, "preserveAspectRatio"));
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


