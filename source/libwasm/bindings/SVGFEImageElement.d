module libwasm.bindings.SVGFEImageElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedPreserveAspectRatio;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFilterPrimitiveStandardAttributes;
import libwasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGFEImageElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto preserveAspectRatio()() {
    return SVGAnimatedPreserveAspectRatio(Object_Getter__Handle(this._parent, "preserveAspectRatio"));
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
  auto result()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "result"));
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


