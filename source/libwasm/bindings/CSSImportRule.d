module libwasm.bindings.CSSImportRule;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.CSSRule;
import libwasm.bindings.CSSStyleSheet;
import libwasm.bindings.MediaList;

@safe:
nothrow:

struct CSSImportRule {
  nothrow:
  libwasm.bindings.CSSRule.CSSRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSRule(h);
  }
  string href()() {
    return Object_Getter__string(this._parent, "href");
  }
  auto media()() {
    return Optional!(MediaList)(Object_Getter__OptionalHandle(this._parent, "media"));
  }
  auto styleSheet()() {
    return Optional!(CSSStyleSheet)(Object_Getter__OptionalHandle(this._parent, "styleSheet"));
  }
}


