module spasm.bindings.HTMLMapElement;

import spasm.types;
import spasm.bindings.HTMLCollection;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLMapElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  auto areas()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "areas"));
  }
}


