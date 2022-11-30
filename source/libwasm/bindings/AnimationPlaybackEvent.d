module libwasm.bindings.AnimationPlaybackEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct AnimationPlaybackEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
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
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return AnimationPlaybackEventInit(libwasm_add__object());
  }
  void currentTime(T0)(scope auto ref Optional!(T0) currentTime) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "currentTime", "Optional!(double)", tuple(!currentTime.empty, currentTime.front));
  }
  Optional!(double) currentTime()() {
    return Object_Getter__OptionalDouble(this._parent, "currentTime");
  }
  void timelineTime(T0)(scope auto ref Optional!(T0) timelineTime) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "timelineTime", "Optional!(double)", tuple(!timelineTime.empty, timelineTime.front));
  }
  Optional!(double) timelineTime()() {
    return Object_Getter__OptionalDouble(this._parent, "timelineTime");
  }
}


