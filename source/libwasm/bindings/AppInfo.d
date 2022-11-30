module libwasm.bindings.AppInfo;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct AppInfo {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AppInfo(libwasm_add__object());
  }
  void path()(string path) {
    Object_Call_string__void(this.handle, "path", path);
  }
  string path()() {
    return Object_Getter__string(this.handle, "path");
  }
  void isCoreApp()(bool isCoreApp) {
    Object_Call_bool__void(this.handle, "isCoreApp", isCoreApp);
  }
  bool isCoreApp()() {
    return Object_Getter__bool(this.handle, "isCoreApp");
  }
}


