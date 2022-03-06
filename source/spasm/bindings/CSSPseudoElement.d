module spasm.bindings.CSSPseudoElement;

import spasm.types;
import spasm.bindings.Animatable;
import spasm.bindings.Animation;
import spasm.bindings.Element;
import spasm.bindings.KeyframeAnimationOptions;

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


