module spasm.bindings.SVGClipPathElement;

import spasm.types;
import spasm.bindings.SVGAnimatedEnumeration;
import spasm.bindings.SVGAnimatedTransformList;
import spasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGClipPathElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto clipPathUnits()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "clipPathUnits"));
  }
  auto transform()() {
    return SVGAnimatedTransformList(Object_Getter__Handle(this._parent, "transform"));
  }
}


