module spasm.bindings.DocumentType;

import spasm.types;
import spasm.bindings.ChildNode;
import spasm.bindings.Node;

@safe:
nothrow:

struct DocumentType {
  nothrow:
  spasm.bindings.Node.Node _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Node(h);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  string publicId()() {
    return Object_Getter__string(this._parent, "publicId");
  }
  string systemId()() {
    return Object_Getter__string(this._parent, "systemId");
  }
  void before()(scope ref SumType!(Node, string) nodes) {
    ChildNode_before(this._parent, nodes);
  }
  void after()(scope ref SumType!(Node, string) nodes) {
    ChildNode_after(this._parent, nodes);
  }
  void replaceWith()(scope ref SumType!(Node, string) nodes) {
    ChildNode_replaceWith(this._parent, nodes);
  }
  void remove()() {
    Object_Call__void(this._parent, "remove");
  }
}


