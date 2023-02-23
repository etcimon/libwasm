module libwasm.bindings.SVGAElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.DOMTokenList;
import libwasm.bindings.SVGAnimatedString;
import libwasm.bindings.SVGGraphicsElement;
import libwasm.bindings.SVGURIReference;

@safe:
nothrow:

struct SVGAElement {
  nothrow:
  libwasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGraphicsElement(h);
  }
  auto target()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "target"));
  }
  void download()(string download) {
    Object_Call_string__void(this._parent, "download", download);
  }
  string download()() {
    return Object_Getter__string(this._parent, "download");
  }
  void ping()(string ping) {
    Object_Call_string__void(this._parent, "ping", ping);
  }
  string ping()() {
    return Object_Getter__string(this._parent, "ping");
  }
  void rel()(string rel) {
    Object_Call_string__void(this._parent, "rel", rel);
  }
  string rel()() {
    return Object_Getter__string(this._parent, "rel");
  }
  void referrerPolicy()(string referrerPolicy) {
    Object_Call_string__void(this._parent, "referrerPolicy", referrerPolicy);
  }
  string referrerPolicy()() {
    return Object_Getter__string(this._parent, "referrerPolicy");
  }
  auto relList()() {
    return DOMTokenList(Object_Getter__Handle(this._parent, "relList"));
  }
  void hreflang()(string hreflang) {
    Object_Call_string__void(this._parent, "hreflang", hreflang);
  }
  string hreflang()() {
    return Object_Getter__string(this._parent, "hreflang");
  }
  void type()(string type) {
    Object_Call_string__void(this._parent, "type", type);
  }
  string type()() {
    return Object_Getter__string(this._parent, "type");
  }
  void text()(string text) {
    Object_Call_string__void(this._parent, "text", text);
  }
  string text()() {
    return Object_Getter__string(this._parent, "text");
  }
  auto href()() {
    return SVGAnimatedString(Object_Getter__Handle(this._parent, "href"));
  }
}


