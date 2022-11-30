module libwasm.bindings.HTMLDirectoryElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLDirectoryElement {
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


