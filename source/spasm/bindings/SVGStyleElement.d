module spasm.bindings.SVGStyleElement;

import spasm.types;
import spasm.bindings.LinkStyle;
import spasm.bindings.SVGElement;
import spasm.bindings.StyleSheet;

@safe:
nothrow:

struct SVGStyleElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  void xmlspace()(string xmlspace) {
    Object_Call_string__void(this._parent, "xmlspace", xmlspace);
  }
  string xmlspace()() {
    return Object_Getter__string(this._parent, "xmlspace");
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  void media()(string media) {
    Object_Call_string__void(this._parent, "media", media);
  }
  string media()() {
    return Object_Getter__string(this._parent, "media");
  }
  void title()(string title) {
    Object_Call_string__void(this._parent, "title", title);
  }
  string title()() {
    return Object_Getter__string(this._parent, "title");
  }
  auto sheet()() {
    return Object_Getter__OptionalHandle(this._parent, "sheet");
  }
}


