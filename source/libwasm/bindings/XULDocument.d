module libwasm.bindings.XULDocument;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Document;

@safe:
nothrow:

struct XULDocument {
  nothrow:
  libwasm.bindings.Document.Document _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Document(h);
  }
}


