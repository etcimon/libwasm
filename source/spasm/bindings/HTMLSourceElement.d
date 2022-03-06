module spasm.bindings.HTMLSourceElement;

import spasm.types;
import spasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLSourceElement {
  nothrow:
  spasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void src()(string src) {
    Object_Call_string__void(this._parent, "src", src);
  }
  string src()() {
    return Object_Getter__string(this._parent, "src");
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  void srcset()(string srcset) {
    Object_Call_string__void(this._parent, "srcset", srcset);
  }
  string srcset()() {
    return Object_Getter__string(this._parent, "srcset");
  }
  void sizes()(string sizes) {
    Object_Call_string__void(this._parent, "sizes", sizes);
  }
  string sizes()() {
    return Object_Getter__string(this._parent, "sizes");
  }
  void media()(string media) {
    Object_Call_string__void(this._parent, "media", media);
  }
  string media()() {
    return Object_Getter__string(this._parent, "media");
  }
}


