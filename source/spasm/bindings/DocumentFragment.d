module spasm.bindings.DocumentFragment;

import spasm.types;
import spasm.bindings.Element;
import spasm.bindings.HTMLCollection;
import spasm.bindings.LegacyQueryInterface;
import spasm.bindings.Node;
import spasm.bindings.NodeList;
import spasm.bindings.ParentNode;

@safe:
nothrow:

struct DocumentFragment {
  nothrow:
  spasm.bindings.Node.Node _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Node(h);
  }
  auto getElementById()(string elementId) {
    return Object_Call_string__OptionalHandle(this._parent, "getElementById", elementId);
  }
  auto querySelector()(string selectors) {
    return Object_Call_string__OptionalHandle(this._parent, "querySelector", selectors);
  }
  auto querySelectorAll()(string selectors) {
    return NodeList(Object_Call_string__Handle(this._parent, "querySelectorAll", selectors));
  }
  auto children()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "children"));
  }
  auto firstElementChild()() {
    return Object_Getter__OptionalHandle(this._parent, "firstElementChild");
  }
  auto lastElementChild()() {
    return Object_Getter__OptionalHandle(this._parent, "lastElementChild");
  }
  uint childElementCount()() {
    return Object_Getter__uint(this._parent, "childElementCount");
  }
  auto getElementsByAttribute()(string name, string value) {
    return HTMLCollection(Object_Call_string_string__Handle(this._parent, "getElementsByAttribute", name, value));
  }
  auto getElementsByAttributeNS(T0)(scope auto ref Optional!(T0) namespaceURI, string name, string value) if (isTOrPointer!(T0, string)) {
    return HTMLCollection(ParentNode_getElementsByAttributeNS(this._parent, !namespaceURI.empty, namespaceURI.front, name, value));
  }
  void prepend()(scope ref SumType!(Node, string) nodes) {
    ParentNode_prepend(this._parent, nodes);
  }
  void append()(scope ref SumType!(Node, string) nodes) {
    ParentNode_append(this._parent, nodes);
  }
  auto QueryInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = nsISupports(Object_Call_Handle__Handle(this._parent, "QueryInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
}


