module spasm.bindings.HTMLStyleElement;

import spasm.types;
import spasm.bindings.HTMLElement;
import spasm.bindings.LinkStyle;
import spasm.bindings.StyleSheet;

@safe:
nothrow:

struct HTMLStyleElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void disabled()(bool disabled) {
    Object_Call_bool__void(this._parent, "disabled", disabled);
  }
  bool disabled()() {
    return Object_Getter__bool(this._parent, "disabled");
  }
  void media()(string media) {
    Object_Call_string__void(this._parent, "media", media);
  }
  string media()() {
    return Object_Getter__string(this._parent, "media");
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  auto sheet()() {
    return Object_Getter__OptionalHandle(this._parent, "sheet");
  }
}


