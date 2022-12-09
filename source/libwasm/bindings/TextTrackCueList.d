module libwasm.bindings.TextTrackCueList;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.VTTCue;

@safe:
nothrow:

struct TextTrackCueList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  auto opIndex()(uint index) {
    return VTTCue(Object_Call_uint__Handle(this.handle, "getter", index));
  }
  auto opDispatch(uint index)() {
    return VTTCue(Object_Call_uint__Handle(this.handle, "getter", index));
  }
  auto getCueById()(string id) {
    return recastOpt!(VTTCue)(Object_Call_string__OptionalHandle(this.handle, "getCueById", id));
  }
}


