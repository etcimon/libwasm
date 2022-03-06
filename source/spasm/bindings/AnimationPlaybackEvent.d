module spasm.bindings.AnimationPlaybackEvent;

import spasm.types;
import spasm.bindings.Event;

@safe:
nothrow:

struct AnimationPlaybackEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  Optional!(double) currentTime()() {
    return Object_Getter__OptionalDouble(this._parent, "currentTime");
  }
  Optional!(double) timelineTime()() {
    return Object_Getter__OptionalDouble(this._parent, "timelineTime");
  }
}
struct AnimationPlaybackEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return AnimationPlaybackEventInit(spasm_add__object());
  }
  void currentTime(T0)(scope auto ref Optional!(T0) currentTime) if (isTOrPointer!(T0, double)) {
    AnimationPlaybackEventInit_currentTime_Set(this._parent, !currentTime.empty, currentTime.front);
  }
  Optional!(double) currentTime()() {
    return Object_Getter__OptionalDouble(this._parent, "currentTime");
  }
  void timelineTime(T0)(scope auto ref Optional!(T0) timelineTime) if (isTOrPointer!(T0, double)) {
    AnimationPlaybackEventInit_timelineTime_Set(this._parent, !timelineTime.empty, timelineTime.front);
  }
  Optional!(double) timelineTime()() {
    return Object_Getter__OptionalDouble(this._parent, "timelineTime");
  }
}


extern (C) void AnimationPlaybackEventInit_currentTime_Set(Handle, bool, double);
extern (C) void AnimationPlaybackEventInit_timelineTime_Set(Handle, bool, double);