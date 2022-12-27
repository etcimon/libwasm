module libwasm.bindings.HTMLScriptElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.HTMLElement;

@safe:
nothrow:

struct HTMLScriptElement {
  nothrow:
  libwasm.bindings.HTMLElement.HTMLElement _parent;
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
  void noModule()(bool noModule) {
    Object_Call_bool__void(this._parent, "noModule", noModule);
  }
  bool noModule()() {
    return Object_Getter__bool(this._parent, "noModule");
  }
  void charset()(string charset) {
    Object_Call_string__void(this._parent, "charset", charset);
  }
  string charset()() {
    return Object_Getter__string(this._parent, "charset");
  }
  void async()(bool async) {
    Object_Call_bool__void(this._parent, "async", async);
  }
  bool async()() {
    return Object_Getter__bool(this._parent, "async");
  }
  void defer()(bool defer) {
    Object_Call_bool__void(this._parent, "defer", defer);
  }
  bool defer()() {
    return Object_Getter__bool(this._parent, "defer");
  }
  void crossOrigin(T0)(scope auto ref Optional!(T0) crossOrigin) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this._parent, "crossOrigin", "Optional!(string)", tuple(!crossOrigin.empty, crossOrigin.front));
  }
  Optional!(string) crossOrigin()() {
    return Object_Getter__OptionalString(this._parent, "crossOrigin");
  }
  void referrerPolicy()(string referrerPolicy) {
    Object_Call_string__void(this._parent, "referrerPolicy", referrerPolicy);
  }
  string referrerPolicy()() {
    return Object_Getter__string(this._parent, "referrerPolicy");
  }
  void text()(string text) {
    Object_Call_string__void(this._parent, "text", text);
  }
  string text()() {
    return Object_Getter__string(this._parent, "text");
  }
  void event()(string event) {
    Object_Call_string__void(this._parent, "event", event);
  }
  string event()() {
    return Object_Getter__string(this._parent, "event");
  }
  void htmlFor()(string htmlFor) {
    Object_Call_string__void(this._parent, "htmlFor", htmlFor);
  }
  string htmlFor()() {
    return Object_Getter__string(this._parent, "htmlFor");
  }
  void integrity()(string integrity) {
    Object_Call_string__void(this._parent, "integrity", integrity);
  }
  string integrity()() {
    return Object_Getter__string(this._parent, "integrity");
  }
}


