module libwasm.bindings.HTMLDataElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLDataElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void value()(string value) {
    Object_Call_string__void(this._parent, "value", value);
  }
  string value()() {
    return Object_Getter__string(this._parent, "value");
  }
}


