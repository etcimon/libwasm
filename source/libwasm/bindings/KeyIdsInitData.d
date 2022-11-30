module libwasm.bindings.KeyIdsInitData;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct KeyIdsInitData {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return KeyIdsInitData(libwasm_add__object());
  }
  void kids()(scope ref Sequence!(string) kids) {
    Object_Call_Handle__void(this.handle, "kids", kids.handle);
  }
  auto kids()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "kids"));
  }
}


