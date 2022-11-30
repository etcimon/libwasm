module libwasm.bindings.SVGForeignObjectElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGGraphicsElement;

@safe:
nothrow:

struct SVGForeignObjectElement {
  nothrow:
  libwasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGraphicsElement(h);
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


