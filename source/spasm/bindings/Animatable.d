module spasm.bindings.Animatable;

import spasm.types;
import spasm.bindings.Animation;
import spasm.bindings.KeyframeAnimationOptions;
import spasm.bindings.KeyframeEffect;

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
    return Animation(Animatable_animate(this.handle, !keyframes.empty, keyframes.front.handle, options));
  }
  auto animate(T0)(scope auto ref Optional!(T0) keyframes) if (isTOrPointer!(T0, JsObject)) {
    return Animation(Animatable_animate_0(this.handle, !keyframes.empty, keyframes.front.handle));
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
    return AnimationFilter(spasm_add__object());
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
  spasm.bindings.KeyframeEffect.KeyframeEffectOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .KeyframeEffectOptions(h);
  }
  static auto create() {
    return KeyframeAnimationOptions(spasm_add__object());
  }
  void id()(string id) {
    Object_Call_string__void(this._parent, "id", id);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
}


extern (C) Handle Animatable_animate(Handle, bool, Handle, scope ref SumType!(double, KeyframeAnimationOptions));
extern (C) Handle Animatable_animate_0(Handle, bool, Handle);