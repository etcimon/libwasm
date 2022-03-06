module spasm.bindings.CSSImportRule;

import spasm.types;
import spasm.bindings.CSSRule;
import spasm.bindings.CSSStyleSheet;
import spasm.bindings.MediaList;

@safe:
nothrow:

struct CSSImportRule {
  nothrow:
  spasm.bindings.CSSRule.CSSRule _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CSSRule(h);
  }
  string href()() {
    return Object_Getter__string(this._parent, "href");
  }
  auto media()() {
    return Object_Getter__OptionalHandle(this._parent, "media");
  }
  auto styleSheet()() {
    return Object_Getter__OptionalHandle(this._parent, "styleSheet");
  }
}


