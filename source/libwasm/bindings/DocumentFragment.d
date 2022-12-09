module libwasm.bindings.DocumentFragment;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.HTMLCollection;
import libwasm.bindings.LegacyQueryInterface;
import libwasm.bindings.Node;
import libwasm.bindings.NodeList;
import libwasm.bindings.ParentNode;

@safe:
nothrow:

struct DocumentFragment {
  nothrow:
  libwasm.bindings.Node.Node _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Node(h);
  }
  auto getElementById()(string elementId) {
    return recastOpt!(Element)(Object_Call_string__OptionalHandle(this._parent, "getElementById", elementId));
  }
  auto querySelector()(string selectors) {
    return recastOpt!(Element)(Object_Call_string__OptionalHandle(this._parent, "querySelector", selectors));
  }
  auto querySelectorAll()(string selectors) {
    return NodeList(Object_Call_string__Handle(this._parent, "querySelectorAll", selectors));
  }
  auto children()() {
    return HTMLCollection(Object_Getter__Handle(this._parent, "children"));
  }
  auto firstElementChild()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "firstElementChild"));
  }
  auto lastElementChild()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "lastElementChild"));
  }
  uint childElementCount()() {
    return Object_Getter__uint(this._parent, "childElementCount");
  }
  auto getElementsByAttribute()(string name, string value) {
    return HTMLCollection(Object_Call_string_string__Handle(this._parent, "getElementsByAttribute", name, value));
  }
  auto getElementsByAttributeNS(T0)(scope auto ref Optional!(T0) namespaceURI, string name, string value) if (isTOrPointer!(T0, string)) {
    return HTMLCollection(Serialize_Object_VarArgCall!Handle(this._parent, "getElementsByAttributeNS", "Optional!(string);string;string", tuple(!namespaceURI.empty, namespaceURI.front, name, value)));
  }
  void prepend()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this._parent, "prepend", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  void append()(scope ref SumType!(Node, string) nodes) {
    Serialize_Object_VarArgCall!void(this._parent, "append", "SumType!(Handle,string)", tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => 0),((string v) => 1))(nodes),tuple(libwasm.sumtype.match!(((ref nodes.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(nodes),libwasm.sumtype.match!(((ref nodes.Types[0] v) => string.init),((string v) => v))(nodes))));
  }
  auto QueryInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = nsISupports(Object_Call_Handle__Handle(this._parent, "QueryInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
}


