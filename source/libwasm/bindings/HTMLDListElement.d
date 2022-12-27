module libwasm.bindings.HTMLDListElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLDListElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void compact()(bool compact) {
    Object_Call_bool__void(this._parent, "compact", compact);
  }
  bool compact()() {
    return Object_Getter__bool(this._parent, "compact");
  }
}


