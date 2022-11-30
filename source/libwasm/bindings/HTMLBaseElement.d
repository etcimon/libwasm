module libwasm.bindings.HTMLBaseElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLBaseElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void href()(string href) {
    Object_Call_string__void(this._parent, "href", href);
  }
  string href()() {
    return Object_Getter__string(this._parent, "href");
  }
  void target()(string target) {
    Object_Call_string__void(this._parent, "target", target);
  }
  string target()() {
    return Object_Getter__string(this._parent, "target");
  }
}


