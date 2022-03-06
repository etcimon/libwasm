module spasm.bindings.RadioNodeList;

import spasm.types;
import spasm.bindings.NodeList;

@safe:
nothrow:

struct RadioNodeList {
  nothrow:
  spasm.bindings.NodeList.NodeList _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .NodeList(h);
  }
  void value()(string value) {
    Object_Call_string__void(this._parent, "value", value);
  }
  string value()() {
    return Object_Getter__string(this._parent, "value");
  }
}


