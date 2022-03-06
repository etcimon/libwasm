module spasm.bindings.HTMLFontElement;

import spasm.types;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLFontElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void color()(string color) {
    Object_Call_string__void(this._parent, "color", color);
  }
  string color()() {
    return Object_Getter__string(this._parent, "color");
  }
  void face()(string face) {
    Object_Call_string__void(this._parent, "face", face);
  }
  string face()() {
    return Object_Getter__string(this._parent, "face");
  }
  void size()(string size) {
    Object_Call_string__void(this._parent, "size", size);
  }
  string size()() {
    return Object_Getter__string(this._parent, "size");
  }
}


