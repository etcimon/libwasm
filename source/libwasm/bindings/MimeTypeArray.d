module libwasm.bindings.MimeTypeArray;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.MimeType;

@safe:
nothrow:

struct MimeTypeArray {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  auto item()(uint index) {
    return recastOpt!(MimeType)(Object_Call_uint__OptionalHandle(this.handle, "item", index));
  }
  auto namedItem()(string name) {
    return recastOpt!(MimeType)(Object_Call_string__OptionalHandle(this.handle, "namedItem", name));
  }
}


