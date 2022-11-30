module libwasm.bindings.FileList;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.File;

@safe:
nothrow:

struct FileList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto item()(uint index) {
    return Optional!(File)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
}


