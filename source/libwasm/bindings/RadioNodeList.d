module libwasm.bindings.RadioNodeList;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.NodeList;

@safe:
nothrow:

struct RadioNodeList {
  nothrow:
  libwasm.bindings.NodeList.NodeList _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .NodeList(h);
  }
  void value()(string value) {
    Object_Call_string__void(this._parent, "value", value);
  }
  string value()() {
    return Object_Getter__string(this._parent, "value");
  }
}


