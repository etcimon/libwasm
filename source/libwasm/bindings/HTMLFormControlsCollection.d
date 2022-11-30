module libwasm.bindings.HTMLFormControlsCollection;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.HTMLCollection;
import libwasm.bindings.RadioNodeList;

@safe:
nothrow:

struct HTMLFormControlsCollection {
  nothrow:
  libwasm.bindings.HTMLCollection.HTMLCollection _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLCollection(h);
  }
  auto namedItem()(string name) {
    return HTMLFormControlsCollection_namedItem_getter(this._parent, name);
  }
}


extern (C) Optional!(SumType!(RadioNodeList, Element)) HTMLFormControlsCollection_namedItem_getter(Handle, string);