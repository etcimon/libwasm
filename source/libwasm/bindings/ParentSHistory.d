module libwasm.bindings.ParentSHistory;

import libwasm.types;

import std.typecons: tuple;
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


