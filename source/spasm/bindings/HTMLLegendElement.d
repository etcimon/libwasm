module spasm.bindings.HTMLLegendElement;

import spasm.types;
import spasm.bindings.HTMLElement;
import spasm.bindings.HTMLFormElement;

@safe:
nothrow:

struct HTMLLegendElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  auto form()() {
    return Object_Getter__OptionalHandle(this._parent, "form");
  }
  void align_()(string align_) {
    Object_Call_string__void(this._parent, "align", align_);
  }
  string align_()() {
    return Object_Getter__string(this._parent, "align");
  }
}


