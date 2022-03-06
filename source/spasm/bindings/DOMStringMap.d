module spasm.bindings.DOMStringMap;

import spasm.types;
@safe:
nothrow:

struct DOMStringMap {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string opIndex()(string name) {
    return Object_Call_string__string(this.handle, "getter", name);
  }
  string opDispatch(string name)() {
    return Object_Call_string__string(this.handle, "getter", name);
  }
  void opIndexAssign()(string value, string name) {
    Object_Call_string_string__void(this.handle, "setter", name, value);
  }
  void opDispatch(string name)(string value) {
    Object_Call_string_string__void(this.handle, "setter", name, value);
  }
  void remove()(string name) {
    Object_Call_string__void(this.handle, "remove", name);
  }
}


