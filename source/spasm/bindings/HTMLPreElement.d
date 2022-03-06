module spasm.bindings.HTMLPreElement;

import spasm.types;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLPreElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void width()(int width) {
    Object_Call_int__void(this._parent, "width", width);
  }
  int width()() {
    return Object_Getter__int(this._parent, "width");
  }
}


