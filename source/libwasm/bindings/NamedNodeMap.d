module libwasm.bindings.NamedNodeMap;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Attr;

@safe:
nothrow:

struct NamedNodeMap {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto getNamedItem()(string name) {
    return recastOpt!(Attr)(Object_Call_string__OptionalHandle(this.handle, "getNamedItem", name));
  }
  auto setNamedItem()(scope ref Attr arg) {
    return recastOpt!(Attr)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "setNamedItem", "Handle", tuple(cast(Handle)arg._parent)));
  }
  auto removeNamedItem()(string name) {
    return Attr(Object_Call_string__Handle(this.handle, "removeNamedItem", name));
  }
  auto item()(uint index) {
    return recastOpt!(Attr)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  auto getNamedItemNS(T0)(scope auto ref Optional!(T0) namespaceURI, string localName) if (isTOrPointer!(T0, string)) {
    return recastOpt!(Attr)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getNamedItemNS", "Optional!(string);string", tuple(!namespaceURI.empty, namespaceURI.front, localName)));
  }
  auto setNamedItemNS()(scope ref Attr arg) {
    return recastOpt!(Attr)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "setNamedItemNS", "Handle", tuple(cast(Handle)arg._parent)));
  }
  auto removeNamedItemNS(T0)(scope auto ref Optional!(T0) namespaceURI, string localName) if (isTOrPointer!(T0, string)) {
    return Attr(Serialize_Object_VarArgCall!Handle(this.handle, "removeNamedItemNS", "Optional!(string);string", tuple(!namespaceURI.empty, namespaceURI.front, localName)));
  }
}


