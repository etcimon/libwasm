module spasm.bindings.ParentSHistory;

import spasm.types;
@safe:
nothrow:

struct ParentSHistory {
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
}


