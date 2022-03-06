module spasm.bindings.SVGMaskElement;

import spasm.types;
import spasm.bindings.SVGAnimatedEnumeration;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGMaskElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
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


