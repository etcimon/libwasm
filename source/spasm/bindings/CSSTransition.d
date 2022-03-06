module spasm.bindings.CSSTransition;

import spasm.types;
import spasm.bindings.Animation;

@safe:
nothrow:

struct CSSTransition {
  nothrow:
  spasm.bindings.Animation.Animation _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Animation(h);
  }
  string transitionProperty()() {
    return Object_Getter__string(this._parent, "transitionProperty");
  }
}


