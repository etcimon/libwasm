module spasm.bindings.NamedNodeMap;

import spasm.types;
import spasm.bindings.Attr;

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
    return Object_Call_string__OptionalHandle(this.handle, "getNamedItem", name);
  }
  auto setNamedItem()(scope ref Attr arg) {
    return NamedNodeMap_setNamedItem(this.handle, arg._parent);
  }
  auto removeNamedItem()(string name) {
    return Attr(Object_Call_string__Handle(this.handle, "removeNamedItem", name));
  }
  auto item()(uint index) {
    return Object_Call_uint__OptionalHandle(this.handle, "item", index);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  auto getNamedItemNS(T0)(scope auto ref Optional!(T0) namespaceURI, string localName) if (isTOrPointer!(T0, string)) {
    return NamedNodeMap_getNamedItemNS(this.handle, !namespaceURI.empty, namespaceURI.front, localName);
  }
  auto setNamedItemNS()(scope ref Attr arg) {
    return NamedNodeMap_setNamedItemNS(this.handle, arg._parent);
  }
  auto removeNamedItemNS(T0)(scope auto ref Optional!(T0) namespaceURI, string localName) if (isTOrPointer!(T0, string)) {
    return Attr(NamedNodeMap_removeNamedItemNS(this.handle, !namespaceURI.empty, namespaceURI.front, localName));
  }
}


extern (C) Optional!(Attr) NamedNodeMap_setNamedItem(Handle, Handle);
extern (C) Optional!(Attr) NamedNodeMap_getNamedItemNS(Handle, bool, string, string);
extern (C) Optional!(Attr) NamedNodeMap_setNamedItemNS(Handle, Handle);
extern (C) Handle NamedNodeMap_removeNamedItemNS(Handle, bool, string, string);