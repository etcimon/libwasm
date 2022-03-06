module spasm.bindings.CSSAnimation;

import spasm.types;
import spasm.bindings.Animation;

@safe:
nothrow:

struct CSSAnimation {
  nothrow:
  spasm.bindings.Animation.Animation _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Animation(h);
  }
  string animationName()() {
    return Object_Getter__string(this._parent, "animationName");
  }
}


