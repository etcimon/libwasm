module libwasm.bindings.SVGDescElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGDescElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
}


