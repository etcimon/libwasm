module libwasm.bindings.Attr;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.Node;

@safe:
nothrow:

struct Attr {
  nothrow:
  libwasm.bindings.Node.Node _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Node(h);
  }
  string localName()() {
    return Object_Getter__string(this._parent, "localName");
  }
  void value()(string value) {
    Object_Call_string__void(this._parent, "value", value);
  }
  string value()() {
    return Object_Getter__string(this._parent, "value");
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  Optional!(string) namespaceURI()() {
    return Object_Getter__OptionalString(this._parent, "namespaceURI");
  }
  Optional!(string) prefix()() {
    return Object_Getter__OptionalString(this._parent, "prefix");
  }
  bool specified()() {
    return Object_Getter__bool(this._parent, "specified");
  }
  auto ownerElement()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "ownerElement"));
  }
}


