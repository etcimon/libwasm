module spasm.bindings.SVGRectElement;

import spasm.types;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGGeometryElement;

@safe:
nothrow:

struct SVGRectElement {
  nothrow:
  spasm.bindings.SVGGeometryElement.SVGGeometryElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGeometryElement(h);
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
  auto rx()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "rx"));
  }
  auto ry()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "ry"));
  }
}


