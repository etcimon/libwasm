module libwasm.bindings.HTMLLinkElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.DOMTokenList;
import libwasm.bindings.HTMLElement;
import libwasm.bindings.LinkStyle;
import libwasm.bindings.StyleSheet;

@safe:
nothrow:

struct HTMLLinkElement {
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
  void href()(string href) {
    Object_Call_string__void(this._parent, "href", href);
  }
  string href()() {
    return Object_Getter__string(this._parent, "href");
  }
  void crossOrigin(T0)(scope auto ref Optional!(T0) crossOrigin) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "crossOrigin", "Optional!(string)", tuple(!crossOrigin.empty, crossOrigin.front));
  }
  Optional!(string) crossOrigin()() {
    return Object_Getter__OptionalString(this._parent, "crossOrigin");
  }
  void rel()(string rel) {
    Object_Call_string__void(this._parent, "rel", rel);
  }
  string rel()() {
    return Object_Getter__string(this._parent, "rel");
  }
  auto relList()() {
    return DOMTokenList(Object_Getter__Handle(this._parent, "relList"));
  }
  void media()(string media) {
    Object_Call_string__void(this._parent, "media", media);
  }
  string media()() {
    return Object_Getter__string(this._parent, "media");
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
  void referrerPolicy()(string referrerPolicy) {
    Object_Call_string__void(this._parent, "referrerPolicy", referrerPolicy);
  }
  string referrerPolicy()() {
    return Object_Getter__string(this._parent, "referrerPolicy");
  }
  auto sizes()() {
    return DOMTokenList(Object_Getter__Handle(this._parent, "sizes"));
  }
  void charset()(string charset) {
    Object_Call_string__void(this._parent, "charset", charset);
  }
  string charset()() {
    return Object_Getter__string(this._parent, "charset");
  }
  void rev()(string rev) {
    Object_Call_string__void(this._parent, "rev", rev);
  }
  string rev()() {
    return Object_Getter__string(this._parent, "rev");
  }
  void target()(string target) {
    Object_Call_string__void(this._parent, "target", target);
  }
  string target()() {
    return Object_Getter__string(this._parent, "target");
  }
  void integrity()(string integrity) {
    Object_Call_string__void(this._parent, "integrity", integrity);
  }
  string integrity()() {
    return Object_Getter__string(this._parent, "integrity");
  }
  void as()(string as) {
    Object_Call_string__void(this._parent, "as", as);
  }
  string as()() {
    return Object_Getter__string(this._parent, "as");
  }
  auto sheet()() {
    return recastOpt!(StyleSheet)(Object_Getter__OptionalHandle(this._parent, "sheet"));
  }
}


