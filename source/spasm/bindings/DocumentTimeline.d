module spasm.bindings.DocumentTimeline;

import spasm.types;
import spasm.bindings.AnimationTimeline;
import spasm.bindings.Performance;

@safe:
nothrow:

struct DocumentTimeline {
  nothrow:
  spasm.bindings.AnimationTimeline.AnimationTimeline _parent;
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
    return DocumentTimelineOptions(spasm_add__object());
  }
  void originTime()(double originTime) {
    Object_Call_double__void(this.handle, "originTime", originTime);
  }
  double originTime()() {
    return Object_Getter__double(this.handle, "originTime");
  }
}


