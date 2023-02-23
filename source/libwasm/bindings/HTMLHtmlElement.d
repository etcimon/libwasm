module libwasm.bindings.HTMLHtmlElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLHtmlElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void version_()(string version_) {
    Object_Call_string__void(this._parent, "version", version_);
  }
  string version_()() {
    return Object_Getter__string(this._parent, "version");
  }
}


