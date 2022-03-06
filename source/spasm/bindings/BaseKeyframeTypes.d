module spasm.bindings.BaseKeyframeTypes;

import spasm.types;
@safe:
nothrow:

struct BaseComputedKeyframe {
  nothrow:
  spasm.bindings.BaseKeyframeTypes.BaseKeyframe _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .BaseKeyframe(h);
  }
  static auto create() {
    return BaseComputedKeyframe(spasm_add__object());
  }
  void computedOffset()(double computedOffset) {
    Object_Call_double__void(this._parent, "computedOffset", computedOffset);
  }
  double computedOffset()() {
    return Object_Getter__double(this._parent, "computedOffset");
  }
}
struct BaseKeyframe {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return BaseKeyframe(spasm_add__object());
  }
  void offset(T0)(scope auto ref Optional!(T0) offset) if (isTOrPointer!(T0, double)) {
    BaseKeyframe_offset_Set(this.handle, !offset.empty, offset.front);
  }
  Optional!(double) offset()() {
    return Object_Getter__OptionalDouble(this.handle, "offset");
  }
  void easing()(string easing) {
    Object_Call_string__void(this.handle, "easing", easing);
  }
  string easing()() {
    return Object_Getter__string(this.handle, "easing");
  }
  void composite()(CompositeOperationOrAuto composite) {
    BaseKeyframe_composite_Set(this.handle, composite);
  }
  CompositeOperationOrAuto composite()() {
    return BaseKeyframe_composite_Get(this.handle);
  }
  void simulateComputeValuesFailure()(bool simulateComputeValuesFailure) {
    Object_Call_bool__void(this.handle, "simulateComputeValuesFailure", simulateComputeValuesFailure);
  }
  bool simulateComputeValuesFailure()() {
    return Object_Getter__bool(this.handle, "simulateComputeValuesFailure");
  }
}
struct BasePropertyIndexedKeyframe {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return BasePropertyIndexedKeyframe(spasm_add__object());
  }
  void offset()(scope ref SumType!(Optional!(double), Sequence!(Optional!(double))) offset) {
    BasePropertyIndexedKeyframe_offset_Set(this.handle, offset);
  }
  auto offset()() {
    return Object_Getter__Handle(this.handle, "offset");
  }
  void easing()(scope ref SumType!(string, Sequence!(string)) easing) {
    BasePropertyIndexedKeyframe_easing_Set(this.handle, easing);
  }
  auto easing()() {
    return Object_Getter__Handle(this.handle, "easing");
  }
  void composite()(scope ref SumType!(CompositeOperationOrAuto, Sequence!(CompositeOperationOrAuto)) composite) {
    BasePropertyIndexedKeyframe_composite_Set(this.handle, composite);
  }
  auto composite()() {
    return Object_Getter__Handle(this.handle, "composite");
  }
}
enum CompositeOperation {
  replace,
  add,
  accumulate
}
enum CompositeOperationOrAuto {
  replace,
  add,
  accumulate,
  auto_
}


extern (C) void BaseKeyframe_offset_Set(Handle, bool, double);
extern (C) void BaseKeyframe_composite_Set(Handle, CompositeOperationOrAuto);
extern (C) CompositeOperationOrAuto BaseKeyframe_composite_Get(Handle);
extern (C) void BasePropertyIndexedKeyframe_offset_Set(Handle, scope ref SumType!(double, Sequence!(double)));
extern (C) void BasePropertyIndexedKeyframe_easing_Set(Handle, scope ref SumType!(string, Sequence!(string)));
extern (C) void BasePropertyIndexedKeyframe_composite_Set(Handle, scope ref SumType!(CompositeOperationOrAuto, Sequence!(CompositeOperationOrAuto)));