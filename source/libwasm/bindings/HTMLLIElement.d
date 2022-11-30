module libwasm.bindings.HTMLLIElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLLIElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void value()(int value) {
    Object_Call_int__void(this._parent, "value", value);
  }
  int value()() {
    return Object_Getter__int(this._parent, "value");
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
}


