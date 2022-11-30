module libwasm.bindings.HTMLTitleElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLTitleElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void text()(string text) {
    Object_Call_string__void(this._parent, "text", text);
  }
  string text()() {
    return Object_Getter__string(this._parent, "text");
  }
}


