module spasm.bindings.AnimationEffect;

import spasm.types;
@safe:
nothrow:

struct AnimationEffect {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto getTiming()() {
    return EffectTiming(Object_Getter__Handle(this.handle, "getTiming"));
  }
  auto getComputedTiming()() {
    return ComputedEffectTiming(Object_Getter__Handle(this.handle, "getComputedTiming"));
  }
  void updateTiming()(scope ref OptionalEffectTiming timing) {
    Object_Call_Handle__void(this.handle, "updateTiming", timing.handle);
  }
  void updateTiming()() {
    Object_Call__void(this.handle, "updateTiming");
  }
}
struct ComputedEffectTiming {
  nothrow:
  spasm.bindings.AnimationEffect.EffectTiming _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EffectTiming(h);
  }
  static auto create() {
    return ComputedEffectTiming(spasm_add__object());
  }
  void endTime()(double endTime) {
    Object_Call_double__void(this._parent, "endTime", endTime);
  }
  double endTime()() {
    return Object_Getter__double(this._parent, "endTime");
  }
  void activeDuration()(double activeDuration) {
    Object_Call_double__void(this._parent, "activeDuration", activeDuration);
  }
  double activeDuration()() {
    return Object_Getter__double(this._parent, "activeDuration");
  }
  void localTime(T0)(scope auto ref Optional!(T0) localTime) if (isTOrPointer!(T0, double)) {
    ComputedEffectTiming_localTime_Set(this._parent, !localTime.empty, localTime.front);
  }
  Optional!(double) localTime()() {
    return Object_Getter__OptionalDouble(this._parent, "localTime");
  }
  void progress(T0)(scope auto ref Optional!(T0) progress) if (isTOrPointer!(T0, double)) {
    ComputedEffectTiming_progress_Set(this._parent, !progress.empty, progress.front);
  }
  Optional!(double) progress()() {
    return Object_Getter__OptionalDouble(this._parent, "progress");
  }
  void currentIteration(T0)(scope auto ref Optional!(T0) currentIteration) if (isTOrPointer!(T0, double)) {
    ComputedEffectTiming_currentIteration_Set(this._parent, !currentIteration.empty, currentIteration.front);
  }
  Optional!(double) currentIteration()() {
    return Object_Getter__OptionalDouble(this._parent, "currentIteration");
  }
}
struct EffectTiming {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return EffectTiming(spasm_add__object());
  }
  void delay()(double delay) {
    Object_Call_double__void(this.handle, "delay", delay);
  }
  double delay()() {
    return Object_Getter__double(this.handle, "delay");
  }
  void endDelay()(double endDelay) {
    Object_Call_double__void(this.handle, "endDelay", endDelay);
  }
  double endDelay()() {
    return Object_Getter__double(this.handle, "endDelay");
  }
  void fill()(FillMode fill) {
    EffectTiming_fill_Set(this.handle, fill);
  }
  FillMode fill()() {
    return EffectTiming_fill_Get(this.handle);
  }
  void iterationStart()(double iterationStart) {
    Object_Call_double__void(this.handle, "iterationStart", iterationStart);
  }
  double iterationStart()() {
    return Object_Getter__double(this.handle, "iterationStart");
  }
  void iterations()(double iterations) {
    Object_Call_double__void(this.handle, "iterations", iterations);
  }
  double iterations()() {
    return Object_Getter__double(this.handle, "iterations");
  }
  void duration()(scope ref SumType!(double, string) duration) {
    EffectTiming_duration_Set(this.handle, duration);
  }
  auto duration()() {
    return Object_Getter__Handle(this.handle, "duration");
  }
  void direction()(PlaybackDirection direction) {
    EffectTiming_direction_Set(this.handle, direction);
  }
  PlaybackDirection direction()() {
    return EffectTiming_direction_Get(this.handle);
  }
  void easing()(string easing) {
    Object_Call_string__void(this.handle, "easing", easing);
  }
  string easing()() {
    return Object_Getter__string(this.handle, "easing");
  }
}
enum FillMode {
  none,
  forwards,
  backwards,
  both,
  auto_
}
struct OptionalEffectTiming {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return OptionalEffectTiming(spasm_add__object());
  }
  void delay()(double delay) {
    Object_Call_double__void(this.handle, "delay", delay);
  }
  double delay()() {
    return Object_Getter__double(this.handle, "delay");
  }
  void endDelay()(double endDelay) {
    Object_Call_double__void(this.handle, "endDelay", endDelay);
  }
  double endDelay()() {
    return Object_Getter__double(this.handle, "endDelay");
  }
  void fill()(FillMode fill) {
    OptionalEffectTiming_fill_Set(this.handle, fill);
  }
  FillMode fill()() {
    return OptionalEffectTiming_fill_Get(this.handle);
  }
  void iterationStart()(double iterationStart) {
    Object_Call_double__void(this.handle, "iterationStart", iterationStart);
  }
  double iterationStart()() {
    return Object_Getter__double(this.handle, "iterationStart");
  }
  void iterations()(double iterations) {
    Object_Call_double__void(this.handle, "iterations", iterations);
  }
  double iterations()() {
    return Object_Getter__double(this.handle, "iterations");
  }
  void duration()(scope ref SumType!(double, string) duration) {
    OptionalEffectTiming_duration_Set(this.handle, duration);
  }
  auto duration()() {
    return Object_Getter__Handle(this.handle, "duration");
  }
  void direction()(PlaybackDirection direction) {
    OptionalEffectTiming_direction_Set(this.handle, direction);
  }
  PlaybackDirection direction()() {
    return OptionalEffectTiming_direction_Get(this.handle);
  }
  void easing()(string easing) {
    Object_Call_string__void(this.handle, "easing", easing);
  }
  string easing()() {
    return Object_Getter__string(this.handle, "easing");
  }
}
enum PlaybackDirection {
  normal,
  reverse,
  alternate,
  alternate_reverse
}


extern (C) void ComputedEffectTiming_localTime_Set(Handle, bool, double);
extern (C) void ComputedEffectTiming_progress_Set(Handle, bool, double);
extern (C) void ComputedEffectTiming_currentIteration_Set(Handle, bool, double);
extern (C) void EffectTiming_fill_Set(Handle, FillMode);
extern (C) FillMode EffectTiming_fill_Get(Handle);
extern (C) void EffectTiming_duration_Set(Handle, scope ref SumType!(double, string));
extern (C) void EffectTiming_direction_Set(Handle, PlaybackDirection);
extern (C) PlaybackDirection EffectTiming_direction_Get(Handle);
extern (C) void OptionalEffectTiming_fill_Set(Handle, FillMode);
extern (C) FillMode OptionalEffectTiming_fill_Get(Handle);
extern (C) void OptionalEffectTiming_duration_Set(Handle, scope ref SumType!(double, string));
extern (C) void OptionalEffectTiming_direction_Set(Handle, PlaybackDirection);
extern (C) PlaybackDirection OptionalEffectTiming_direction_Get(Handle);