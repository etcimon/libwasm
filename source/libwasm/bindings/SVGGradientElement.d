module libwasm.bindings.SVGGradientElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGAnimatedTransformList;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGGradientElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  enum ushort SVG_SPREADMETHOD_UNKNOWN = 0;
  enum ushort SVG_SPREADMETHOD_PAD = 1;
  enum ushort SVG_SPREADMETHOD_REFLECT = 2;
  enum ushort SVG_SPREADMETHOD_REPEAT = 3;
  auto gradientUnits()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "gradientUnits"));
  }
  auto gradientTransform()() {
    return SVGAnimatedTransformList(Object_Getter__Handle(this._parent, "gradientTransform"));
  }
  auto spreadMethod()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "spreadMethod"));
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


