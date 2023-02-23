module libwasm.bindings.CSSNamespaceRule;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.CSSRule;

@safe:
nothrow:

struct CSSNamespaceRule {
  nothrow:
  libwasm.bindings.CSSRule.CSSRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSRule(h);
  }
  string namespaceURI()() {
    return Object_Getter__string(this._parent, "namespaceURI");
  }
  string prefix()() {
    return Object_Getter__string(this._parent, "prefix");
  }
}


