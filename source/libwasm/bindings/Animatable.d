module libwasm.bindings.Animatable;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Animation;
import libwasm.bindings.KeyframeAnimationOptions;
import libwasm.bindings.KeyframeEffect;

@safe:
nothrow:

struct Animatable {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto animate(T0)(scope auto ref Optional!(T0) keyframes, scope ref SumType!(double, KeyframeAnimationOptions) options) if (isTOrPointer!(T0, JsObject)) {
    return Animation(Serialize_Object_VarArgCall!Handle(this.handle, "animate", "Optional!Handle;SumType!(double,Handle)", tuple(!keyframes.empty, cast(Handle)keyframes.front.handle, libwasm.sumtype.match!(((double v) => 0),((ref options.Types[1] v) => 1))(options),tuple(libwasm.sumtype.match!(((double v) => v),((ref options.Types[1] v) => double.init))(options),libwasm.sumtype.match!(((double v) => Handle.init),((ref options.Types[1] v) => cast(Handle)v.handle))(options)))));
  }
  auto animate(T0)(scope auto ref Optional!(T0) keyframes) if (isTOrPointer!(T0, JsObject)) {
    return Animation(Serialize_Object_VarArgCall!Handle(this.handle, "animate", "Optional!Handle", tuple(!keyframes.empty, cast(Handle)keyframes.front.handle)));
  }
  auto getAnimations()(scope ref AnimationFilter filter) {
    return Sequence!(Animation)(Object_Call_Handle__Handle(this.handle, "getAnimations", filter.handle));
  }
  auto getAnimations()() {
    return Sequence!(Animation)(Object_Getter__Handle(this.handle, "getAnimations"));
  }
}
struct AnimationFilter {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AnimationFilter(libwasm_add__object());
  }
  void subtree()(bool subtree) {
    Object_Call_bool__void(this.handle, "subtree", subtree);
  }
  bool subtree()() {
    return Object_Getter__bool(this.handle, "subtree");
  }
}
struct KeyframeAnimationOptions {
  nothrow:
  libwasm.bindings.KeyframeEffect.KeyframeEffectOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .KeyframeEffectOptions(h);
  }
  static auto create() {
    return KeyframeAnimationOptions(libwasm_add__object());
  }
  void id()(string id) {
    Object_Call_string__void(this._parent, "id", id);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
}


