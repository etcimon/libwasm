module spasm.bindings.SVGFilterElement;

import spasm.types;
import spasm.bindings.SVGAnimatedEnumeration;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGAnimatedString;
import spasm.bindings.SVGElement;
import spasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGFilterElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto filterUnits()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "filterUnits"));
  }
  auto primitiveUnits()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "primitiveUnits"));
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
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


