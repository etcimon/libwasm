module spasm.bindings.HTMLQuoteElement;

import spasm.types;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLQuoteElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void cite()(string cite) {
    Object_Call_string__void(this._parent, "cite", cite);
  }
  string cite()() {
    return Object_Getter__string(this._parent, "cite");
  }
}


