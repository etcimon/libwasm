module libwasm.bindings.KeyframeEffect;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AnimationEffect;
import libwasm.bindings.BaseKeyframeTypes;
import libwasm.bindings.CSSPseudoElement;
import libwasm.bindings.Element;

@safe:
nothrow:

struct AnimationPropertyDetails {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AnimationPropertyDetails(libwasm_add__object());
  }
  void property()(string property) {
    Object_Call_string__void(this.handle, "property", property);
  }
  string property()() {
    return Object_Getter__string(this.handle, "property");
  }
  void runningOnCompositor()(bool runningOnCompositor) {
    Object_Call_bool__void(this.handle, "runningOnCompositor", runningOnCompositor);
  }
  bool runningOnCompositor()() {
    return Object_Getter__bool(this.handle, "runningOnCompositor");
  }
  void warning()(string warning) {
    Object_Call_string__void(this.handle, "warning", warning);
  }
  string warning()() {
    return Object_Getter__string(this.handle, "warning");
  }
  void values()(scope ref Sequence!(AnimationPropertyValueDetails) values) {
    Object_Call_Handle__void(this.handle, "values", values.handle);
  }
  auto values()() {
    return Sequence!(AnimationPropertyValueDetails)(Object_Getter__Handle(this.handle, "values"));
  }
}
struct AnimationPropertyValueDetails {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AnimationPropertyValueDetails(libwasm_add__object());
  }
  void offset()(double offset) {
    Object_Call_double__void(this.handle, "offset", offset);
  }
  double offset()() {
    return Object_Getter__double(this.handle, "offset");
  }
  void value()(string value) {
    Object_Call_string__void(this.handle, "value", value);
  }
  string value()() {
    return Object_Getter__string(this.handle, "value");
  }
  void easing()(string easing) {
    Object_Call_string__void(this.handle, "easing", easing);
  }
  string easing()() {
    return Object_Getter__string(this.handle, "easing");
  }
  void composite()(CompositeOperation composite) {
    Object_Call_int__void(this.handle, "composite", composite);
  }
  CompositeOperation composite()() {
    return Object_Getter__int(this.handle, "composite");
  }
}
enum IterationCompositeOperation {
  replace,
  accumulate
}
struct KeyframeEffect {
  nothrow:
  libwasm.bindings.AnimationEffect.AnimationEffect _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AnimationEffect(h);
  }
  void target(T0)(scope auto ref Optional!(T0) target) if (isTOrPointer!(T0, SumType!(Element, CSSPseudoElement))) {
    Serialize_Object_VarArgCall!void(this._parent, "target", "Optional!SumType!(Handle,Handle)", tuple(!target.empty, libwasm.sumtype.match!(((ref target.Types[0] v) => 0),((ref target.Types[1] v) => 1))(target),tuple(libwasm.sumtype.match!(((ref target.Types[0] v) => cast(Handle)v.handle),((ref target.Types[1] v) => Handle.init))(target),libwasm.sumtype.match!(((ref target.Types[0] v) => Handle.init),((ref target.Types[1] v) => cast(Handle)v.handle))(target))));
  }
  auto target()() {
    return KeyframeEffect_target_Get(this._parent);
  }
  void iterationComposite()(IterationCompositeOperation iterationComposite) {
    Object_Call_int__void(this._parent, "iterationComposite", iterationComposite);
  }
  IterationCompositeOperation iterationComposite()() {
    return Object_Getter__int(this._parent, "iterationComposite");
  }
  void composite()(CompositeOperation composite) {
    Object_Call_int__void(this._parent, "composite", composite);
  }
  CompositeOperation composite()() {
    return Object_Getter__int(this._parent, "composite");
  }
  auto getKeyframes()() {
    return Sequence!(JsObject)(Object_Getter__Handle(this._parent, "getKeyframes"));
  }
  void setKeyframes(T0)(scope auto ref Optional!(T0) keyframes) if (isTOrPointer!(T0, JsObject)) {
    Serialize_Object_VarArgCall!void(this._parent, "setKeyframes", "Optional!Handle", tuple(!keyframes.empty, cast(Handle)keyframes.front.handle));
  }
  auto getProperties()() {
    return Sequence!(AnimationPropertyDetails)(Object_Getter__Handle(this._parent, "getProperties"));
  }
}
struct KeyframeEffectOptions {
  nothrow:
  libwasm.bindings.AnimationEffect.EffectTiming _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EffectTiming(h);
  }
  static auto create() {
    return KeyframeEffectOptions(libwasm_add__object());
  }
  void iterationComposite()(IterationCompositeOperation iterationComposite) {
    Object_Call_int__void(this._parent, "iterationComposite", iterationComposite);
  }
  IterationCompositeOperation iterationComposite()() {
    return Object_Getter__int(this._parent, "iterationComposite");
  }
  void composite()(CompositeOperation composite) {
    Object_Call_int__void(this._parent, "composite", composite);
  }
  CompositeOperation composite()() {
    return Object_Getter__int(this._parent, "composite");
  }
}


extern (C) Optional!(SumType!(Element, CSSPseudoElement)) KeyframeEffect_target_Get(Handle);