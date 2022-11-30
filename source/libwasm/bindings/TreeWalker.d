module libwasm.bindings.TreeWalker;

import libwasm.types;

import std.typecons: tuple;
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
    return Optional!(NodeFilter)(Object_Getter__OptionalHandle(this.handle, "filter"));
  }
  void currentNode()(scope ref Node currentNode) {
    Object_Call_Handle__void(this.handle, "currentNode", currentNode.handle);
  }
  auto currentNode()() {
    return Node(Object_Getter__Handle(this.handle, "currentNode"));
  }
  auto parentNode()() {
    return Optional!(Node)(Object_Getter__OptionalHandle(this.handle, "parentNode"));
  }
  auto firstChild()() {
    return Optional!(Node)(Object_Getter__OptionalHandle(this.handle, "firstChild"));
  }
  auto lastChild()() {
    return Optional!(Node)(Object_Getter__OptionalHandle(this.handle, "lastChild"));
  }
  auto previousSibling()() {
    return Optional!(Node)(Object_Getter__OptionalHandle(this.handle, "previousSibling"));
  }
  auto nextSibling()() {
    return Optional!(Node)(Object_Getter__OptionalHandle(this.handle, "nextSibling"));
  }
  auto previousNode()() {
    return Optional!(Node)(Object_Getter__OptionalHandle(this.handle, "previousNode"));
  }
  auto nextNode()() {
    return Optional!(Node)(Object_Getter__OptionalHandle(this.handle, "nextNode"));
  }
}


