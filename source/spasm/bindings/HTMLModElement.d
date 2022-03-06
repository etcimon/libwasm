module spasm.bindings.HTMLModElement;

import spasm.types;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLModElement {
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
  void dateTime()(string dateTime) {
    Object_Call_string__void(this._parent, "dateTime", dateTime);
  }
  string dateTime()() {
    return Object_Getter__string(this._parent, "dateTime");
  }
}


