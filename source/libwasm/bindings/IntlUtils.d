module libwasm.bindings.IntlUtils;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct DisplayNameOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DisplayNameOptions(libwasm_add__object());
  }
  void style()(string style) {
    Object_Call_string__void(this.handle, "style", style);
  }
  string style()() {
    return Object_Getter__string(this.handle, "style");
  }
  void keys()(scope ref Sequence!(string) keys) {
    Object_Call_Handle__void(this.handle, "keys", keys.handle);
  }
  auto keys()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "keys"));
  }
}
struct DisplayNameResult {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DisplayNameResult(libwasm_add__object());
  }
  void locale()(string locale) {
    Object_Call_string__void(this.handle, "locale", locale);
  }
  string locale()() {
    return Object_Getter__string(this.handle, "locale");
  }
  void style()(string style) {
    Object_Call_string__void(this.handle, "style", style);
  }
  string style()() {
    return Object_Getter__string(this.handle, "style");
  }
  void values()(scope ref Record!(string, string) values) {
    Object_Call_Handle__void(this.handle, "values", values.handle);
  }
  auto values()() {
    return Record!(string, string)(Object_Getter__Handle(this.handle, "values"));
  }
}
struct IntlUtils {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto getDisplayNames()(scope ref Sequence!(string) locales, scope ref DisplayNameOptions options) {
    return DisplayNameResult(Serialize_Object_VarArgCall!Handle(this.handle, "getDisplayNames", "Handle;Handle", tuple(cast(Handle)locales.handle, cast(Handle)options.handle)));
  }
  auto getDisplayNames()(scope ref Sequence!(string) locales) {
    return DisplayNameResult(Object_Call_Handle__Handle(this.handle, "getDisplayNames", locales.handle));
  }
  auto getLocaleInfo()(scope ref Sequence!(string) locales) {
    return LocaleInfo(Object_Call_Handle__Handle(this.handle, "getLocaleInfo", locales.handle));
  }
}
struct LocaleInfo {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return LocaleInfo(libwasm_add__object());
  }
  void locale()(string locale) {
    Object_Call_string__void(this.handle, "locale", locale);
  }
  string locale()() {
    return Object_Getter__string(this.handle, "locale");
  }
  void direction()(string direction) {
    Object_Call_string__void(this.handle, "direction", direction);
  }
  string direction()() {
    return Object_Getter__string(this.handle, "direction");
  }
}


