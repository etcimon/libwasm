module spasm.bindings.IntlUtils;

import spasm.types;
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
    return DisplayNameOptions(spasm_add__object());
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
    return DisplayNameResult(spasm_add__object());
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
    return DisplayNameResult(IntlUtils_getDisplayNames(this.handle, locales.handle, options.handle));
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
    return LocaleInfo(spasm_add__object());
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


extern (C) Handle IntlUtils_getDisplayNames(Handle, Handle, Handle);