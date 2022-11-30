module libwasm.bindings.HTMLDetailsElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLDetailsElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void open()(bool open) {
    Object_Call_bool__void(this._parent, "open", open);
  }
  bool open()() {
    return Object_Getter__bool(this._parent, "open");
  }
}


