module libwasm.bindings.TimeRanges;

import libwasm.types;

import libwasm.memory.ct: tuple;
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
    return Serialize_Object_VarArgCall!double(this.handle, "start", "uint", tuple(index));
  }
  double end()(uint index) {
    return Serialize_Object_VarArgCall!double(this.handle, "end", "uint", tuple(index));
  }
}


