module libwasm.bindings.CSSRule;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.CSSStyleSheet;

@safe:
nothrow:

struct CSSRule {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort STYLE_RULE = 1;
  enum ushort CHARSET_RULE = 2;
  enum ushort IMPORT_RULE = 3;
  enum ushort MEDIA_RULE = 4;
  enum ushort FONT_FACE_RULE = 5;
  enum ushort PAGE_RULE = 6;
  enum ushort NAMESPACE_RULE = 10;
  ushort type()() {
    return Object_Getter__ushort(this.handle, "type");
  }
  void cssText()(string cssText) {
    Object_Call_string__void(this.handle, "cssText", cssText);
  }
  string cssText()() {
    return Object_Getter__string(this.handle, "cssText");
  }
  auto parentRule()() {
    return Optional!(CSSRule)(Object_Getter__OptionalHandle(this.handle, "parentRule"));
  }
  auto parentStyleSheet()() {
    return Optional!(CSSStyleSheet)(Object_Getter__OptionalHandle(this.handle, "parentStyleSheet"));
  }
}


