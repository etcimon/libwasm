module spasm.bindings.ChildSHistory;

import spasm.types;
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
    return ChildSHistory_canGo(this.handle, aOffset);
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


extern (C) bool ChildSHistory_canGo(Handle, int);