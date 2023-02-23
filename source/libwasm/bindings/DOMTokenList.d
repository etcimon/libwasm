module libwasm.bindings.DOMTokenList;

import libwasm.types;

import libwasm.memory.ct: tuple;
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
    return Serialize_Object_VarArgCall!(Optional!string)(this.handle, "item", "uint", tuple(index));
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
    return Serialize_Object_VarArgCall!bool(this.handle, "replace", "string;string", tuple(token, newToken));
  }
  bool toggle()(string token, bool force) {
    return Serialize_Object_VarArgCall!bool(this.handle, "toggle", "string;bool", tuple(token, force));
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


