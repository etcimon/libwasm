module spasm.bindings.XULDocument;

import spasm.types;
import spasm.bindings.Document;

@safe:
nothrow:

struct XULDocument {
  nothrow:
  spasm.bindings.Document.Document _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Document(h);
  }
}


