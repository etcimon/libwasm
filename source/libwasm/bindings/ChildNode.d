module libwasm.bindings.ChildNode;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.Node;

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
    Serialize_Object_VarArgCall!void(this.handle, "before", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  void after()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this.handle, "after", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  void replaceWith()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this.handle, "replaceWith", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
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
    return Optional!(Element)(Object_Getter__OptionalHandle(this.handle, "previousElementSibling"));
  }
  auto nextElementSibling()() {
    return Optional!(Element)(Object_Getter__OptionalHandle(this.handle, "nextElementSibling"));
  }
}


