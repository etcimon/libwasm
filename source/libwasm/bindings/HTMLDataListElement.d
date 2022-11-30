module libwasm.bindings.HTMLDataListElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLCollection;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLDataListElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  auto options()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "options"));
  }
}


