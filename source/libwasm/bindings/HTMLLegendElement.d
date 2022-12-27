module libwasm.bindings.HTMLLegendElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.HTMLFormElement;

@safe:
nothrow:

struct HTMLLegendElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  auto form()() {
    return recastOpt!(HTMLFormElement)(Object_Getter__OptionalHandle(this._parent, "form"));
  }
  void align_()(string align_) {
    Object_Call_string__void(this._parent, "align", align_);
  }
  string align_()() {
    return Object_Getter__string(this._parent, "align");
  }
}


