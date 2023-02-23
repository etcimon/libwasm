module libwasm.bindings.HTMLMetaElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLMetaElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLElement(h);
  }
  void name()(string name) {
    Object_Call_string__void(this._parent, "name", name);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void httpEquiv()(string httpEquiv) {
    Object_Call_string__void(this._parent, "httpEquiv", httpEquiv);
  }
  string httpEquiv()() {
    return Object_Getter__string(this._parent, "httpEquiv");
  }
  void content()(string content) {
    Object_Call_string__void(this._parent, "content", content);
  }
  string content()() {
    return Object_Getter__string(this._parent, "content");
  }
  void scheme()(string scheme) {
    Object_Call_string__void(this._parent, "scheme", scheme);
  }
  string scheme()() {
    return Object_Getter__string(this._parent, "scheme");
  }
}


