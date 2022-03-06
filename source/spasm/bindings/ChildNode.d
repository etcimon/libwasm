module spasm.bindings.ChildNode;

import spasm.types;
import spasm.bindings.Element;
import spasm.bindings.Node;

@safe:
nothrow:

struct ChildNode {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void before()(scope ref SumType!(Node, string) nodes) {
    ChildNode_before(this.handle, nodes);
  }
  void after()(scope ref SumType!(Node, string) nodes) {
    ChildNode_after(this.handle, nodes);
  }
  void replaceWith()(scope ref SumType!(Node, string) nodes) {
    ChildNode_replaceWith(this.handle, nodes);
  }
  void remove()() {
    Object_Call__void(this.handle, "remove");
  }
}
struct NonDocumentTypeChildNode {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto previousElementSibling()() {
    return Object_Getter__OptionalHandle(this.handle, "previousElementSibling");
  }
  auto nextElementSibling()() {
    return Object_Getter__OptionalHandle(this.handle, "nextElementSibling");
  }
}


extern (C) void ChildNode_before(Handle, scope ref SumType!(Node, string));
extern (C) void ChildNode_after(Handle, scope ref SumType!(Node, string));
extern (C) void ChildNode_replaceWith(Handle, scope ref SumType!(Node, string));