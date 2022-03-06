module spasm.bindings.TimeRanges;

import spasm.types;
@safe:
nothrow:

struct TimeRanges {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  double start()(uint index) {
    return TimeRanges_start(this.handle, index);
  }
  double end()(uint index) {
    return TimeRanges_end(this.handle, index);
  }
}


extern (C) double TimeRanges_start(Handle, uint);
extern (C) double TimeRanges_end(Handle, uint);