module libwasm.bindings.ParentNode;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.HTMLCollection;
import libwasm.bindings.Node;

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
    return Optional!(Element)(Object_Getter__OptionalHandle(this.handle, "firstElementChild"));
  }
  auto lastElementChild()() {
    return Optional!(Element)(Object_Getter__OptionalHandle(this.handle, "lastElementChild"));
  }
  uint childElementCount()() {
    return Object_Getter__uint(this.handle, "childElementCount");
  }
  auto getElementsByAttribute()(string name, string value) {
    return HTMLCollection(Object_Call_string_string__Handle(this.handle, "getElementsByAttribute", name, value));
  }
  auto getElementsByAttributeNS(T0)(scope auto ref Optional!(T0) namespaceURI, string name, string value) if (isTOrPointer!(T0, string)) {
    return HTMLCollection(Serialize_Object_VarArgCall!Handle(this.handle, "getElementsByAttributeNS", "Optional!(string);string;string", tuple(!namespaceURI.empty, namespaceURI.front, name, value)));
  }
  void prepend()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this.handle, "prepend", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  void append()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this.handle, "append", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
}


