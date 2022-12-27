module libwasm.bindings.TreeWalker;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Node;
import libwasm.bindings.NodeFilter;

@safe:
nothrow:

struct TreeWalker {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto root()() {
    return Node(Object_Getter__Handle(this.handle, "root"));
  }
  uint whatToShow()() {
    return Object_Getter__uint(this.handle, "whatToShow");
  }
  auto filter()() {
    return recastOpt!(NodeFilter)(Object_Getter__OptionalHandle(this.handle, "filter"));
  }
  void currentNode()(scope ref Node currentNode) {
    Object_Call_Handle__void(this.handle, "currentNode", currentNode.handle);
  }
  auto currentNode()() {
    return Node(Object_Getter__Handle(this.handle, "currentNode"));
  }
  auto parentNode()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "parentNode"));
  }
  auto firstChild()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "firstChild"));
  }
  auto lastChild()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "lastChild"));
  }
  auto previousSibling()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "previousSibling"));
  }
  auto nextSibling()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "nextSibling"));
  }
  auto previousNode()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "previousNode"));
  }
  auto nextNode()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "nextNode"));
  }
}


