module spasm.bindings.HTMLFormControlsCollection;

import spasm.types;
import spasm.bindings.Element;
import spasm.bindings.HTMLCollection;
import spasm.bindings.RadioNodeList;

@safe:
nothrow:

struct HTMLFormControlsCollection {
  nothrow:
  spasm.bindings.HTMLCollection.HTMLCollection _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLCollection(h);
  }
  auto namedItem()(string name) {
    return HTMLFormControlsCollection_namedItem_getter(this._parent, name);
  }
}


extern (C) Optional!(SumType!(RadioNodeList, Element)) HTMLFormControlsCollection_namedItem_getter(Handle, string);