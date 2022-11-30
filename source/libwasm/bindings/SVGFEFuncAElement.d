module libwasm.bindings.SVGFEFuncAElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.SVGComponentTransferFunctionElement;

@safe:
nothrow:

struct SVGFEFuncAElement {
  nothrow:
  libwasm.bindings.SVGComponentTransferFunctionElement.SVGComponentTransferFunctionElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGComponentTransferFunctionElement(h);
  }
}


