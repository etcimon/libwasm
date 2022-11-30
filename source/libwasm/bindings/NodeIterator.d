module libwasm.bindings.NodeIterator;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Node;
import libwasm.bindings.NodeFilter;

@safe:
nothrow:

struct NodeIterator {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto root()() {
    return Node(Object_Getter__Handle(this.handle, "root"));
  }
  auto referenceNode()() {
    return Optional!(Node)(Object_Getter__OptionalHandle(this.handle, "referenceNode"));
  }
  bool pointerBeforeReferenceNode()() {
    return Object_Getter__bool(this.handle, "pointerBeforeReferenceNode");
  }
  uint whatToShow()() {
    return Object_Getter__uint(this.handle, "whatToShow");
  }
  auto filter()() {
    return Optional!(NodeFilter)(Object_Getter__OptionalHandle(this.handle, "filter"));
  }
  auto nextNode()() {
    return Optional!(Node)(Object_Getter__OptionalHandle(this.handle, "nextNode"));
  }
  auto previousNode()() {
    return Optional!(Node)(Object_Getter__OptionalHandle(this.handle, "previousNode"));
  }
  void detach()() {
    Object_Call__void(this.handle, "detach");
  }
}

