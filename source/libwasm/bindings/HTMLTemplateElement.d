module libwasm.bindings.HTMLTemplateElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.DocumentFragment;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLTemplateElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  auto content()() {
    return DocumentFragment(Object_Getter__Handle(this._parent, "content"));
  }
}


