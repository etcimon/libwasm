module spasm.bindings.KeyframeEffect;

import spasm.types;
import spasm.bindings.AnimationEffect;
import spasm.bindings.BaseKeyframeTypes;
import spasm.bindings.CSSPseudoElement;
import spasm.bindings.Element;

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
    return AnimationPropertyDetails(spasm_add__object());
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
    return AnimationPropertyValueDetails(spasm_add__object());
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
    AnimationPropertyValueDetails_composite_Set(this.handle, composite);
  }
  CompositeOperation composite()() {
    return AnimationPropertyValueDetails_composite_Get(this.handle);
  }
}
enum IterationCompositeOperation {
  replace,
  accumulate
}
struct KeyframeEffect {
  nothrow:
  spasm.bindings.AnimationEffect.AnimationEffect _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AnimationEffect(h);
  }
  void target(T0)(scope auto ref Optional!(T0) target) if (isTOrPointer!(T0, SumType!(Element, CSSPseudoElement))) {
    KeyframeEffect_target_Set(this._parent, !target.empty, *target.frontRef);
  }
  auto target()() {
    return KeyframeEffect_target_Get(this._parent);
  }
  void iterationComposite()(IterationCompositeOperation iterationComposite) {
    KeyframeEffect_iterationComposite_Set(this._parent, iterationComposite);
  }
  IterationCompositeOperation iterationComposite()() {
    return KeyframeEffect_iterationComposite_Get(this._parent);
  }
  void composite()(CompositeOperation composite) {
    KeyframeEffect_composite_Set(this._parent, composite);
  }
  CompositeOperation composite()() {
    return KeyframeEffect_composite_Get(this._parent);
  }
  auto getKeyframes()() {
    return Sequence!(JsObject)(Object_Getter__Handle(this._parent, "getKeyframes"));
  }
  void setKeyframes(T0)(scope auto ref Optional!(T0) keyframes) if (isTOrPointer!(T0, JsObject)) {
    KeyframeEffect_setKeyframes(this._parent, !keyframes.empty, keyframes.front.handle);
  }
  auto getProperties()() {
    return Sequence!(AnimationPropertyDetails)(Object_Getter__Handle(this._parent, "getProperties"));
  }
}
struct KeyframeEffectOptions {
  nothrow:
  spasm.bindings.AnimationEffect.EffectTiming _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EffectTiming(h);
  }
  static auto create() {
    return KeyframeEffectOptions(spasm_add__object());
  }
  void iterationComposite()(IterationCompositeOperation iterationComposite) {
    KeyframeEffectOptions_iterationComposite_Set(this._parent, iterationComposite);
  }
  IterationCompositeOperation iterationComposite()() {
    return KeyframeEffectOptions_iterationComposite_Get(this._parent);
  }
  void composite()(CompositeOperation composite) {
    KeyframeEffectOptions_composite_Set(this._parent, composite);
  }
  CompositeOperation composite()() {
    return KeyframeEffectOptions_composite_Get(this._parent);
  }
}


extern (C) void AnimationPropertyValueDetails_composite_Set(Handle, CompositeOperation);
extern (C) CompositeOperation AnimationPropertyValueDetails_composite_Get(Handle);
extern (C) void KeyframeEffect_target_Set(Handle, bool, scope ref SumType!(Element, CSSPseudoElement));
extern (C) Optional!(SumType!(Element, CSSPseudoElement)) KeyframeEffect_target_Get(Handle);
extern (C) void KeyframeEffect_iterationComposite_Set(Handle, IterationCompositeOperation);
extern (C) IterationCompositeOperation KeyframeEffect_iterationComposite_Get(Handle);
extern (C) void KeyframeEffect_composite_Set(Handle, CompositeOperation);
extern (C) CompositeOperation KeyframeEffect_composite_Get(Handle);
extern (C) void KeyframeEffect_setKeyframes(Handle, bool, Handle);
extern (C) void KeyframeEffectOptions_iterationComposite_Set(Handle, IterationCompositeOperation);
extern (C) IterationCompositeOperation KeyframeEffectOptions_iterationComposite_Get(Handle);
extern (C) void KeyframeEffectOptions_composite_Set(Handle, CompositeOperation);
extern (C) CompositeOperation KeyframeEffectOptions_composite_Get(Handle);