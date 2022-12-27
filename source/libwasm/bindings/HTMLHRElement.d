module libwasm.bindings.HTMLHRElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLHRElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void align_()(string align_) {
    Object_Call_string__void(this._parent, "align", align_);
  }
  string align_()() {
    return Object_Getter__string(this._parent, "align");
  }
  void color()(string color) {
    Object_Call_string__void(this._parent, "color", color);
  }
  string color()() {
    return Object_Getter__string(this._parent, "color");
  }
  void noShade()(bool noShade) {
    Object_Call_bool__void(this._parent, "noShade", noShade);
  }
  bool noShade()() {
    return Object_Getter__bool(this._parent, "noShade");
  }
  void size()(string size) {
    Object_Call_string__void(this._parent, "size", size);
  }
  string size()() {
    return Object_Getter__string(this._parent, "size");
  }
  void width()(string width) {
    Object_Call_string__void(this._parent, "width", width);
  }
  string width()() {
    return Object_Getter__string(this._parent, "width");
  }
}


