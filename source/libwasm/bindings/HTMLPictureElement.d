module libwasm.bindings.HTMLPictureElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLPictureElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
}


