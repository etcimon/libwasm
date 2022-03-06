module spasm.bindings.HTMLBRElement;

import spasm.types;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLBRElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void clear()(string clear) {
    Object_Call_string__void(this._parent, "clear", clear);
  }
  string clear()() {
    return Object_Getter__string(this._parent, "clear");
  }
}


