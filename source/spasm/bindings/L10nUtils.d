module spasm.bindings.L10nUtils;

import spasm.types;
@safe:
nothrow:

struct AttributeNameValue {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AttributeNameValue(spasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  void value()(string value) {
    Object_Call_string__void(this.handle, "value", value);
  }
  string value()() {
    return Object_Getter__string(this.handle, "value");
  }
}
alias L10nCallback = Promise!(Sequence!(L10nValue)) delegate(Sequence!(L10nElement));
struct L10nElement {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return L10nElement(spasm_add__object());
  }
  void namespaceURI()(string namespaceURI) {
    Object_Call_string__void(this.handle, "namespaceURI", namespaceURI);
  }
  string namespaceURI()() {
    return Object_Getter__string(this.handle, "namespaceURI");
  }
  void localName()(string localName) {
    Object_Call_string__void(this.handle, "localName", localName);
  }
  string localName()() {
    return Object_Getter__string(this.handle, "localName");
  }
  void l10nId()(string l10nId) {
    Object_Call_string__void(this.handle, "l10nId", l10nId);
  }
  string l10nId()() {
    return Object_Getter__string(this.handle, "l10nId");
  }
  void type(T0)(scope auto ref Optional!(T0) type) if (isTOrPointer!(T0, string)) {
    L10nElement_type_Set(this.handle, !type.empty, type.front);
  }
  Optional!(string) type()() {
    return Object_Getter__OptionalString(this.handle, "type");
  }
  void l10nAttrs(T0)(scope auto ref Optional!(T0) l10nAttrs) if (isTOrPointer!(T0, string)) {
    L10nElement_l10nAttrs_Set(this.handle, !l10nAttrs.empty, l10nAttrs.front);
  }
  Optional!(string) l10nAttrs()() {
    return Object_Getter__OptionalString(this.handle, "l10nAttrs");
  }
  void l10nArgs(T0)(scope auto ref Optional!(T0) l10nArgs) if (isTOrPointer!(T0, JsObject)) {
    L10nElement_l10nArgs_Set(this.handle, !l10nArgs.empty, l10nArgs.front.handle);
  }
  auto l10nArgs()() {
    return Object_Getter__OptionalHandle(this.handle, "l10nArgs");
  }
}
struct L10nValue {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return L10nValue(spasm_add__object());
  }
  void value(T0)(scope auto ref Optional!(T0) value) if (isTOrPointer!(T0, string)) {
    L10nValue_value_Set(this.handle, !value.empty, value.front);
  }
  Optional!(string) value()() {
    return Object_Getter__OptionalString(this.handle, "value");
  }
  void attributes(T0)(scope auto ref Optional!(T0) attributes) if (isTOrPointer!(T0, Sequence!(AttributeNameValue))) {
    L10nValue_attributes_Set(this.handle, !attributes.empty, attributes.front.handle);
  }
  auto attributes()() {
    return Object_Getter__OptionalHandle(this.handle, "attributes");
  }
}


extern (C) void L10nElement_type_Set(Handle, bool, string);
extern (C) void L10nElement_l10nAttrs_Set(Handle, bool, string);
extern (C) void L10nElement_l10nArgs_Set(Handle, bool, Handle);
extern (C) void L10nValue_value_Set(Handle, bool, string);
extern (C) void L10nValue_attributes_Set(Handle, Handle);