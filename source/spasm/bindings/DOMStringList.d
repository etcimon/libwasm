module spasm.bindings.DOMStringList;

import spasm.types;
@safe:
nothrow:

struct DOMStringList {
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
    return DOMStringList_item_getter(this.handle, index);
  }
  bool contains()(string string) {
    return Object_Call_string__bool(this.handle, "contains", string);
  }
}


extern (C) Optional!(string) DOMStringList_item_getter(Handle, uint);