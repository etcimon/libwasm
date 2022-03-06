module spasm.bindings.ParentNode;

import spasm.types;
import spasm.bindings.Element;
import spasm.bindings.HTMLCollection;
import spasm.bindings.Node;

@safe:
nothrow:

struct ParentNode {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto children()() {
    return HTMLCollection(Object_Getter__Handle(this.handle, "children"));
  }
  auto firstElementChild()() {
    return Object_Getter__OptionalHandle(this.handle, "firstElementChild");
  }
  auto lastElementChild()() {
    return Object_Getter__OptionalHandle(this.handle, "lastElementChild");
  }
  uint childElementCount()() {
    return Object_Getter__uint(this.handle, "childElementCount");
  }
  auto getElementsByAttribute()(string name, string value) {
    return HTMLCollection(Object_Call_string_string__Handle(this.handle, "getElementsByAttribute", name, value));
  }
  auto getElementsByAttributeNS(T0)(scope auto ref Optional!(T0) namespaceURI, string name, string value) if (isTOrPointer!(T0, string)) {
    return HTMLCollection(ParentNode_getElementsByAttributeNS(this.handle, !namespaceURI.empty, namespaceURI.front, name, value));
  }
  void prepend()(scope ref SumType!(Node, string) nodes) {
    ParentNode_prepend(this.handle, nodes);
  }
  void append()(scope ref SumType!(Node, string) nodes) {
    ParentNode_append(this.handle, nodes);
  }
}


extern (C) Handle ParentNode_getElementsByAttributeNS(Handle, bool, string, string, string);
extern (C) void ParentNode_prepend(Handle, scope ref SumType!(Node, string));
extern (C) void ParentNode_append(Handle, scope ref SumType!(Node, string));