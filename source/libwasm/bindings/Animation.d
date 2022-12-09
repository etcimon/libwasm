module libwasm.bindings.Animation;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AnimationEffect;
import libwasm.bindings.AnimationTimeline;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct Animation {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  void id()(string id) {
    Object_Call_string__void(this._parent, "id", id);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
  void effect(T0)(scope auto ref Optional!(T0) effect) if (isTOrPointer!(T0, AnimationEffect)) {
    Serialize_Object_VarArgCall!void(this._parent, "effect", "Optional!Handle", tuple(!effect.empty, cast(Handle)effect.front.handle));
  }
  auto effect()() {
    return recastOpt!(AnimationEffect)(Object_Getter__OptionalHandle(this._parent, "effect"));
  }
  void timeline(T0)(scope auto ref Optional!(T0) timeline) if (isTOrPointer!(T0, AnimationTimeline)) {
    Serialize_Object_VarArgCall!void(this._parent, "timeline", "Optional!Handle", tuple(!timeline.empty, cast(Handle)timeline.front.handle));
  }
  auto timeline()() {
    return recastOpt!(AnimationTimeline)(Object_Getter__OptionalHandle(this._parent, "timeline"));
  }
  void startTime(T0)(scope auto ref Optional!(T0) startTime) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "startTime", "Optional!(double)", tuple(!startTime.empty, startTime.front));
  }
  Optional!(double) startTime()() {
    return Object_Getter__OptionalDouble(this._parent, "startTime");
  }
  void currentTime(T0)(scope auto ref Optional!(T0) currentTime) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "currentTime", "Optional!(double)", tuple(!currentTime.empty, currentTime.front));
  }
  Optional!(double) currentTime()() {
    return Object_Getter__OptionalDouble(this._parent, "currentTime");
  }
  void playbackRate()(double playbackRate) {
    Object_Call_double__void(this._parent, "playbackRate", playbackRate);
  }
  double playbackRate()() {
    return Object_Getter__double(this._parent, "playbackRate");
  }
  AnimationPlayState playState()() {
    return Object_Getter__int(this._parent, "playState");
  }
  bool pending()() {
    return Object_Getter__bool(this._parent, "pending");
  }
  auto ready()() {
    return JsPromise!(Animation)(Object_Getter__Handle(this._parent, "ready"));
  }
  auto finished()() {
    return JsPromise!(Animation)(Object_Getter__Handle(this._parent, "finished"));
  }
  void onfinish(T0)(scope auto ref Optional!(T0) onfinish) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onfinish", !onfinish.empty, onfinish.front);
  }
  EventHandler onfinish()() {
    return Object_Getter__EventHandler(this._parent, "onfinish");
  }
  void oncancel(T0)(scope auto ref Optional!(T0) oncancel) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "oncancel", !oncancel.empty, oncancel.front);
  }
  EventHandler oncancel()() {
    return Object_Getter__EventHandler(this._parent, "oncancel");
  }
  void cancel()() {
    Object_Call__void(this._parent, "cancel");
  }
  void finish()() {
    Object_Call__void(this._parent, "finish");
  }
  void play()() {
    Object_Call__void(this._parent, "play");
  }
  void pause()() {
    Object_Call__void(this._parent, "pause");
  }
  void updatePlaybackRate()(double playbackRate) {
    Object_Call_double__void(this._parent, "updatePlaybackRate", playbackRate);
  }
  void reverse()() {
    Object_Call__void(this._parent, "reverse");
  }
  bool isRunningOnCompositor()() {
    return Object_Getter__bool(this._parent, "isRunningOnCompositor");
  }
}
enum AnimationPlayState {
  idle,
  running,
  paused,
  finished
}


