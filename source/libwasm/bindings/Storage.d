module libwasm.bindings.Storage;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct Storage {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  Optional!(string) key()(uint index) {
    return Serialize_Object_VarArgCall!(Optional!string)(this.handle, "key", "uint", tuple(index));
  }
  Optional!(string) getItem()(string key) {
    return Object_Call_string__OptionalString(this.handle, "getItem", key);
  }
  void setItem()(string key, string value) {
    Object_Call_string_string__void(this.handle, "setItem", key, value);
  }
  void removeItem()(string key) {
    Object_Call_string__void(this.handle, "removeItem", key);
  }
  void clear()() {
    Object_Call__void(this.handle, "clear");
  }
  bool isSessionOnly()() {
    return Object_Getter__bool(this.handle, "isSessionOnly");
  }
  void open()() {
    Object_Call__void(this.handle, "open");
  }
  void close()() {
    Object_Call__void(this.handle, "close");
  }
  void beginExplicitSnapshot()() {
    Object_Call__void(this.handle, "beginExplicitSnapshot");
  }
  void endExplicitSnapshot()() {
    Object_Call__void(this.handle, "endExplicitSnapshot");
  }
}


