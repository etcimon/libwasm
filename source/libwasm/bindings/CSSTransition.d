module libwasm.bindings.CSSTransition;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Animation;

@safe:
nothrow:

struct CSSTransition {
  nothrow:
  libwasm.bindings.Animation.Animation _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Animation(h);
  }
  string transitionProperty()() {
    return Object_Getter__string(this._parent, "transitionProperty");
  }
}


