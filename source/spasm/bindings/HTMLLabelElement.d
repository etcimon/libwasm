module spasm.bindings.HTMLLabelElement;

import spasm.types;
import spasm.bindings.HTMLElement;
import spasm.bindings.HTMLFormElement;

@safe:
nothrow:

struct HTMLLabelElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  auto form()() {
    return Object_Getter__OptionalHandle(this._parent, "form");
  }
  void htmlFor()(string htmlFor) {
    Object_Call_string__void(this._parent, "htmlFor", htmlFor);
  }
  string htmlFor()() {
    return Object_Getter__string(this._parent, "htmlFor");
  }
  auto control()() {
    return Object_Getter__OptionalHandle(this._parent, "control");
  }
}


