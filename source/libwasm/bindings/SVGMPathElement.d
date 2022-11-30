module libwasm.bindings.SVGMPathElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGMPathElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


