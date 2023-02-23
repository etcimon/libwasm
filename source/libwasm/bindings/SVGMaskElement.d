module libwasm.bindings.SVGMaskElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGMaskElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  enum ushort SVG_MASKTYPE_LUMINANCE = 0;
  enum ushort SVG_MASKTYPE_ALPHA = 1;
  auto maskUnits()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "maskUnits"));
  }
  auto maskContentUnits()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "maskContentUnits"));
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
}


