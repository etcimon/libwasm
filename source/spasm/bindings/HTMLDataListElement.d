module spasm.bindings.HTMLDataListElement;

import spasm.types;
import spasm.bindings.HTMLCollection;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLDataListElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  auto options()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "options"));
  }
}


