module libwasm.bindings.DOMStringList;

import libwasm.types;

import libwasm.memory.ct: tuple;
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
    return Serialize_Object_VarArgCall!(Optional!string)(this.handle, "item", "uint", tuple(index));
  }
  bool contains()(string string) {
    return Object_Call_string__bool(this.handle, "contains", string);
  }
}


