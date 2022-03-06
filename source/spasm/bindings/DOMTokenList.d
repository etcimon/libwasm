module spasm.bindings.DOMTokenList;

import spasm.types;
@safe:
nothrow:

struct DOMTokenList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  Optional!(string) item()(uint index) {
    return DOMTokenList_item_getter(this.handle, index);
  }
  bool contains()(string token) {
    return Object_Call_string__bool(this.handle, "contains", token);
  }
  void add()(string tokens) {
    Object_Call_string__void(this.handle, "add", tokens);
  }
  void remove()(string tokens) {
    Object_Call_string__void(this.handle, "remove", tokens);
  }
  bool replace()(string token, string newToken) {
    return DOMTokenList_replace(this.handle, token, newToken);
  }
  bool toggle()(string token, bool force) {
    return DOMTokenList_toggle(this.handle, token, force);
  }
  bool toggle()(string token) {
    return Object_Call_string__bool(this.handle, "toggle", token);
  }
  bool supports()(string token) {
    return Object_Call_string__bool(this.handle, "supports", token);
  }
  void value()(string value) {
    Object_Call_string__void(this.handle, "value", value);
  }
  string value()() {
    return Object_Getter__string(this.handle, "value");
  }
  auto DOMString()() {
    return stringifier(Object_Getter__Handle(this.handle, "DOMString"));
  }
}


extern (C) Optional!(string) DOMTokenList_item_getter(Handle, uint);
extern (C) bool DOMTokenList_replace(Handle, string, string);
extern (C) bool DOMTokenList_toggle(Handle, string, bool);