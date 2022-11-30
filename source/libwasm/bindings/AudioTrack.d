module libwasm.bindings.AudioTrack;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct AudioTrack {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  string kind()() {
    return Object_Getter__string(this.handle, "kind");
  }
  string label()() {
    return Object_Getter__string(this.handle, "label");
  }
  string language()() {
    return Object_Getter__string(this.handle, "language");
  }
  void enabled()(bool enabled) {
    Object_Call_bool__void(this.handle, "enabled", enabled);
  }
  bool enabled()() {
    return Object_Getter__bool(this.handle, "enabled");
  }
}


