module libwasm.bindings.HTMLPreElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLPreElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void width()(int width) {
    Object_Call_int__void(this._parent, "width", width);
  }
  int width()() {
    return Object_Getter__int(this._parent, "width");
  }
}


