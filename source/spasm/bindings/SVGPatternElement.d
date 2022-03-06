module spasm.bindings.SVGPatternElement;

import spasm.types;
import spasm.bindings.SVGAnimatedEnumeration;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGAnimatedPreserveAspectRatio;
import spasm.bindings.SVGAnimatedRect;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGAnimatedTransformList;
import spasm.bindings.SVGElement;
import spasm.bindings.SVGFitToViewBox;
import spasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGPatternElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
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


