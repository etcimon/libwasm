module spasm.bindings.CSSStyleDeclaration;

import spasm.types;
import spasm.bindings.CSSRule;

@safe:
nothrow:

struct CSSStyleDeclaration {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void cssText()(string cssText) {
    Object_Call_string__void(this.handle, "cssText", cssText);
  }
  string cssText()() {
    return Object_Getter__string(this.handle, "cssText");
  }
  uint length()() {
    return Object_Getter__uint(this.handle, "length");
  }
  string item()(uint index) {
    return Object_Call_uint__string(this.handle, "item", index);
  }
  auto getCSSImageURLs()(string property) {
    return Sequence!(string)(Object_Call_string__Handle(this.handle, "getCSSImageURLs", property));
  }
  string getPropertyValue()(string property) {
    return Object_Call_string__string(this.handle, "getPropertyValue", property);
  }
  string getPropertyPriority()(string property) {
    return Object_Call_string__string(this.handle, "getPropertyPriority", property);
  }
  void setProperty()(string property, string value, string priority /* = "" */) {
    CSSStyleDeclaration_setProperty(this.handle, property, value, priority);
  }
  void setProperty()(string property, string value) {
    Object_Call_string_string__void(this.handle, "setProperty", property, value);
  }
  string removeProperty()(string property) {
    return Object_Call_string__string(this.handle, "removeProperty", property);
  }
  auto parentRule()() {
    return Object_Getter__OptionalHandle(this.handle, "parentRule");
  }
}


extern (C) void CSSStyleDeclaration_setProperty(Handle, string, string, string);