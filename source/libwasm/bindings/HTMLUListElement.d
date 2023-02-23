module libwasm.bindings.HTMLUListElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLUListElement {
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
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
}


