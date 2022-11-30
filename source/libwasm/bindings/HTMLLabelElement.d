module libwasm.bindings.HTMLLabelElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.HTMLFormElement;

@safe:
nothrow:

struct HTMLLabelElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  auto form()() {
    return Optional!(HTMLFormElement)(Object_Getter__OptionalHandle(this._parent, "form"));
  }
  void htmlFor()(string htmlFor) {
    Object_Call_string__void(this._parent, "htmlFor", htmlFor);
  }
  string htmlFor()() {
    return Object_Getter__string(this._parent, "htmlFor");
  }
  auto control()() {
    return Optional!(HTMLElement)(Object_Getter__OptionalHandle(this._parent, "control"));
  }
}


