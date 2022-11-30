module libwasm.bindings.DocumentTimeline;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AnimationTimeline;
import libwasm.bindings.Performance;

@safe:
nothrow:

struct DocumentTimeline {
  nothrow:
  libwasm.bindings.AnimationTimeline.AnimationTimeline _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AnimationTimeline(h);
  }
}
struct DocumentTimelineOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DocumentTimelineOptions(libwasm_add__object());
  }
  void originTime()(double originTime) {
    Object_Call_double__void(this.handle, "originTime", originTime);
  }
  double originTime()() {
    return Object_Getter__double(this.handle, "originTime");
  }
}


