module spasm.bindings.CSSNamespaceRule;

import spasm.types;
import spasm.bindings.CSSRule;

@safe:
nothrow:

struct CSSNamespaceRule {
  nothrow:
  spasm.bindings.CSSRule.CSSRule _parent;
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


