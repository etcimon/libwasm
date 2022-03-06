module spasm.bindings.URLSearchParams;

import spasm.types;
@safe:
nothrow:

struct URLSearchParams {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void append()(string name, string value) {
    Object_Call_string_string__void(this.handle, "append", name, value);
  }
  void delete_()(string name) {
    Object_Call_string__void(this.handle, "delete", name);
  }
  Optional!(string) get()(string name) {
    return Object_Call_string__OptionalString(this.handle, "get", name);
  }
  auto getAll()(string name) {
    return Sequence!(string)(Object_Call_string__Handle(this.handle, "getAll", name));
  }
  bool has()(string name) {
    return Object_Call_string__bool(this.handle, "has", name);
  }
  void set()(string name, string value) {
    Object_Call_string_string__void(this.handle, "set", name, value);
  }
  void sort()() {
    Object_Call__void(this.handle, "sort");
  }
}


