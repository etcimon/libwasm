module libwasm.bindings.BaseKeyframeTypes;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct BaseComputedKeyframe {
  nothrow:
  libwasm.bindings.BaseKeyframeTypes.BaseKeyframe _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .BaseKeyframe(h);
  }
  static auto create() {
    return BaseComputedKeyframe(libwasm_add__object());
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
    return BaseKeyframe(libwasm_add__object());
  }
  void offset(T0)(scope auto ref Optional!(T0) offset) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this.handle, "offset", "Optional!(double)", tuple(!offset.empty, offset.front));
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
    Object_Call_int__void(this.handle, "composite", composite);
  }
  CompositeOperationOrAuto composite()() {
    return Object_Getter__int(this.handle, "composite");
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
    return BasePropertyIndexedKeyframe(libwasm_add__object());
  }
  void offset()(scope ref SumType!(Optional!(double), Sequence!(Optional!(double))) offset) {
    Serialize_Object_VarArgCall!void(this.handle, "offset", "SumType!(Optional,Handle)", tuple(libwasm.sumtype.match!(((Optional v) => 0),((ref offset.Types[1] v) => 1))(offset),tuple(libwasm.sumtype.match!(((Optional v) => v),((ref offset.Types[1] v) => Optional.init))(offset),libwasm.sumtype.match!(((Optional v) => Handle.init),((ref offset.Types[1] v) => cast(Handle)v.handle))(offset))));
  }
  auto offset()() {
    return Object_Getter__Handle(this.handle, "offset");
  }
  void easing()(scope ref SumType!(string, Sequence!(string)) easing) {
    Serialize_Object_VarArgCall!void(this.handle, "easing", "SumType!(string,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref easing.Types[1] v) => 1))(easing),tuple(libwasm.sumtype.match!(((string v) => v),((ref easing.Types[1] v) => string.init))(easing),libwasm.sumtype.match!(((string v) => Handle.init),((ref easing.Types[1] v) => cast(Handle)v.handle))(easing))));
  }
  auto easing()() {
    return Object_Getter__Handle(this.handle, "easing");
  }
  void composite()(scope ref SumType!(CompositeOperationOrAuto, Sequence!(CompositeOperationOrAuto)) composite) {
    Serialize_Object_VarArgCall!void(this.handle, "composite", "SumType!(int,Handle)", tuple(libwasm.sumtype.match!(((CompositeOperationOrAuto v) => 0),((ref composite.Types[1] v) => 1))(composite),tuple(libwasm.sumtype.match!(((CompositeOperationOrAuto v) => v),((ref composite.Types[1] v) => CompositeOperationOrAuto.init))(composite),libwasm.sumtype.match!(((CompositeOperationOrAuto v) => Handle.init),((ref composite.Types[1] v) => cast(Handle)v.handle))(composite))));
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


