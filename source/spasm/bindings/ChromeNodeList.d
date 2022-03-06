module spasm.bindings.ChromeNodeList;

import spasm.types;
import spasm.bindings.Node;
import spasm.bindings.NodeList;

@safe:
nothrow:

struct ChromeNodeList {
  nothrow:
  spasm.bindings.NodeList.NodeList _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .NodeList(h);
  }
  void append()(scope ref Node aNode) {
    Object_Call_Handle__void(this._parent, "append", aNode._parent);
  }
  void remove()(scope ref Node aNode) {
    Object_Call_Handle__void(this._parent, "remove", aNode._parent);
  }
}


