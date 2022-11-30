module libwasm.bindings.MediaTrackConstraintSet;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct ConstrainBooleanParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConstrainBooleanParameters(libwasm_add__object());
  }
  void exact()(bool exact) {
    Object_Call_bool__void(this.handle, "exact", exact);
  }
  bool exact()() {
    return Object_Getter__bool(this.handle, "exact");
  }
  void ideal()(bool ideal) {
    Object_Call_bool__void(this.handle, "ideal", ideal);
  }
  bool ideal()() {
    return Object_Getter__bool(this.handle, "ideal");
  }
}
struct ConstrainDOMStringParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConstrainDOMStringParameters(libwasm_add__object());
  }
  void exact()(scope ref SumType!(string, Sequence!(string)) exact) {
    Serialize_Object_VarArgCall!void(this.handle, "exact", "SumType!(string,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref exact.Types[1] v) => 1))(exact),tuple(libwasm.sumtype.match!(((string v) => v),((ref exact.Types[1] v) => string.init))(exact),libwasm.sumtype.match!(((string v) => Handle.init),((ref exact.Types[1] v) => cast(Handle)v.handle))(exact))));
  }
  auto exact()() {
    return Object_Getter__Handle(this.handle, "exact");
  }
  void ideal()(scope ref SumType!(string, Sequence!(string)) ideal) {
    Serialize_Object_VarArgCall!void(this.handle, "ideal", "SumType!(string,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref ideal.Types[1] v) => 1))(ideal),tuple(libwasm.sumtype.match!(((string v) => v),((ref ideal.Types[1] v) => string.init))(ideal),libwasm.sumtype.match!(((string v) => Handle.init),((ref ideal.Types[1] v) => cast(Handle)v.handle))(ideal))));
  }
  auto ideal()() {
    return Object_Getter__Handle(this.handle, "ideal");
  }
}
struct ConstrainDoubleRange {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConstrainDoubleRange(libwasm_add__object());
  }
  void min()(double min) {
    Object_Call_double__void(this.handle, "min", min);
  }
  double min()() {
    return Object_Getter__double(this.handle, "min");
  }
  void max()(double max) {
    Object_Call_double__void(this.handle, "max", max);
  }
  double max()() {
    return Object_Getter__double(this.handle, "max");
  }
  void exact()(double exact) {
    Object_Call_double__void(this.handle, "exact", exact);
  }
  double exact()() {
    return Object_Getter__double(this.handle, "exact");
  }
  void ideal()(double ideal) {
    Object_Call_double__void(this.handle, "ideal", ideal);
  }
  double ideal()() {
    return Object_Getter__double(this.handle, "ideal");
  }
}
struct ConstrainLongRange {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConstrainLongRange(libwasm_add__object());
  }
  void min()(int min) {
    Object_Call_int__void(this.handle, "min", min);
  }
  int min()() {
    return Object_Getter__int(this.handle, "min");
  }
  void max()(int max) {
    Object_Call_int__void(this.handle, "max", max);
  }
  int max()() {
    return Object_Getter__int(this.handle, "max");
  }
  void exact()(int exact) {
    Object_Call_int__void(this.handle, "exact", exact);
  }
  int exact()() {
    return Object_Getter__int(this.handle, "exact");
  }
  void ideal()(int ideal) {
    Object_Call_int__void(this.handle, "ideal", ideal);
  }
  int ideal()() {
    return Object_Getter__int(this.handle, "ideal");
  }
}


