module spasm.bindings.SVGGradientElement;

import spasm.types;
import spasm.bindings.SVGAnimatedEnumeration;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGAnimatedTransformList;
import spasm.bindings.SVGElement;
import spasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGGradientElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
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


