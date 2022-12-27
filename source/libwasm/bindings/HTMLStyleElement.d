module libwasm.bindings.HTMLStyleElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.LinkStyle;
import libwasm.bindings.StyleSheet;

@safe:
nothrow:

struct HTMLStyleElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
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
    return recastOpt!(StyleSheet)(Object_Getter__OptionalHandle(this._parent, "sheet"));
  }
}


