module spasm.bindings.HTMLTemplateElement;

import spasm.types;
import spasm.bindings.DocumentFragment;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLTemplateElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  auto content()() {
    return DocumentFragment(Object_Getter__Handle(this._parent, "content"));
  }
}


