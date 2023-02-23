module libwasm.bindings.ChildSHistory;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct ChildSHistory {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  int count()() {
    return Object_Getter__int(this.handle, "count");
  }
  int index()() {
    return Object_Getter__int(this.handle, "index");
  }
  bool canGo()(int aOffset) {
    return Serialize_Object_VarArgCall!bool(this.handle, "canGo", "int", tuple(aOffset));
  }
  void go()(int aOffset) {
    Object_Call_int__void(this.handle, "go", aOffset);
  }
  void reload()(uint aReloadFlags) {
    Object_Call_uint__void(this.handle, "reload", aReloadFlags);
  }
  auto legacySHistory()() {
    return nsISHistory(Object_Getter__Handle(this.handle, "legacySHistory"));
  }
}


