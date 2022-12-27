module libwasm.bindings.HTMLBRElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLBRElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void clear()(string clear) {
    Object_Call_string__void(this._parent, "clear", clear);
  }
  string clear()() {
    return Object_Getter__string(this._parent, "clear");
  }
}


