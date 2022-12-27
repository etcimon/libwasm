module libwasm.bindings.FileList;

import libwasm.types;

import memutils.ct: tuple;
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
    return recastOpt!(File)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
}


