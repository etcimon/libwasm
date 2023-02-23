module libwasm.bindings.BarProp;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct BarProp {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void visible()(bool visible) {
    Object_Call_bool__void(this.handle, "visible", visible);
  }
  bool visible()() {
    return Object_Getter__bool(this.handle, "visible");
  }
}


