module libwasm.bindings.AnimationTimeline;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct AnimationTimeline {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  Optional!(double) currentTime()() {
    return Object_Getter__OptionalDouble(this.handle, "currentTime");
  }
}


