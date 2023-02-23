module libwasm.bindings.SVGRectElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGGeometryElement;

@safe:
nothrow:

struct SVGRectElement {
  nothrow:
  libwasm.bindings.SVGGeometryElement.SVGGeometryElement _parent;
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


