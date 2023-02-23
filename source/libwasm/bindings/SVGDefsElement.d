module libwasm.bindings.SVGDefsElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGGraphicsElement;

@safe:
nothrow:

struct SVGDefsElement {
  nothrow:
  libwasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGraphicsElement(h);
  }
}


