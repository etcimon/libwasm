module libwasm.bindings.AnimationEffect;

import libwasm.types;

import memutils.ct: tuple;
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
  libwasm.bindings.AnimationEffect.EffectTiming _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EffectTiming(h);
  }
  static auto create() {
    return ComputedEffectTiming(libwasm_add__object());
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
    Serialize_Object_VarArgCall!void(this._parent, "localTime", "Optional!(double)", tuple(!localTime.empty, localTime.front));
  }
  Optional!(double) localTime()() {
    return Object_Getter__OptionalDouble(this._parent, "localTime");
  }
  void progress(T0)(scope auto ref Optional!(T0) progress) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "progress", "Optional!(double)", tuple(!progress.empty, progress.front));
  }
  Optional!(double) progress()() {
    return Object_Getter__OptionalDouble(this._parent, "progress");
  }
  void currentIteration(T0)(scope auto ref Optional!(T0) currentIteration) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this._parent, "currentIteration", "Optional!(double)", tuple(!currentIteration.empty, currentIteration.front));
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
    return EffectTiming(libwasm_add__object());
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
    Object_Call_int__void(this.handle, "fill", fill);
  }
  FillMode fill()() {
    return Object_Getter__int(this.handle, "fill");
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
    Serialize_Object_VarArgCall!void(this.handle, "duration", "SumType!(double,string)", tuple(libwasm.sumtype.match!(((double v) => 0),((string v) => 1))(duration),tuple(libwasm.sumtype.match!(((double v) => v),((string v) => double.init))(duration),libwasm.sumtype.match!(((double v) => string.init),((string v) => v))(duration))));
  }
  auto duration()() {
    return Object_Getter__Handle(this.handle, "duration");
  }
  void direction()(PlaybackDirection direction) {
    Object_Call_int__void(this.handle, "direction", direction);
  }
  PlaybackDirection direction()() {
    return Object_Getter__int(this.handle, "direction");
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
    return OptionalEffectTiming(libwasm_add__object());
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
    Object_Call_int__void(this.handle, "fill", fill);
  }
  FillMode fill()() {
    return Object_Getter__int(this.handle, "fill");
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
    Serialize_Object_VarArgCall!void(this.handle, "duration", "SumType!(double,string)", tuple(libwasm.sumtype.match!(((double v) => 0),((string v) => 1))(duration),tuple(libwasm.sumtype.match!(((double v) => v),((string v) => double.init))(duration),libwasm.sumtype.match!(((double v) => string.init),((string v) => v))(duration))));
  }
  auto duration()() {
    return Object_Getter__Handle(this.handle, "duration");
  }
  void direction()(PlaybackDirection direction) {
    Object_Call_int__void(this.handle, "direction", direction);
  }
  PlaybackDirection direction()() {
    return Object_Getter__int(this.handle, "direction");
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


