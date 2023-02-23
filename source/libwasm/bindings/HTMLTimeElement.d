module libwasm.bindings.HTMLTimeElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLTimeElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void dateTime()(string dateTime) {
    Object_Call_string__void(this._parent, "dateTime", dateTime);
  }
  string dateTime()() {
    return Object_Getter__string(this._parent, "dateTime");
  }
}


