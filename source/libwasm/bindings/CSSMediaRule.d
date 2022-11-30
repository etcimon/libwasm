module libwasm.bindings.CSSMediaRule;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.CSSConditionRule;
import libwasm.bindings.MediaList;

@safe:
nothrow:

struct CSSMediaRule {
  nothrow:
  libwasm.bindings.CSSConditionRule.CSSConditionRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSConditionRule(h);
  }
  auto media()() {
    return MediaList(Object_Getter__Handle(this._parent, "media"));
  }
}


