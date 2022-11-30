module libwasm.bindings.CSSPseudoElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Animatable;
import libwasm.bindings.Animation;
import libwasm.bindings.Element;
import libwasm.bindings.KeyframeAnimationOptions;

@safe:
nothrow:

struct CSSPseudoElement {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  auto element()() {
    return Element(Object_Getter__Handle(this.handle, "element"));
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


