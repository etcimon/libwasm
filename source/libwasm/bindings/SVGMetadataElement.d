module libwasm.bindings.SVGMetadataElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGElement;

@safe:
nothrow:

struct SVGMetadataElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
}


