module libwasm.bindings.MimeType;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Plugin;

@safe:
nothrow:

struct MimeType {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string description()() {
    return Object_Getter__string(this.handle, "description");
  }
  auto enabledPlugin()() {
    return recastOpt!(Plugin)(Object_Getter__OptionalHandle(this.handle, "enabledPlugin"));
  }
  string suffixes()() {
    return Object_Getter__string(this.handle, "suffixes");
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
}


