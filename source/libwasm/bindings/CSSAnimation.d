module libwasm.bindings.CSSAnimation;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Animation;

@safe:
nothrow:

struct CSSAnimation {
  nothrow:
  libwasm.bindings.Animation.Animation _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Animation(h);
  }
  string animationName()() {
    return Object_Getter__string(this._parent, "animationName");
  }
}


