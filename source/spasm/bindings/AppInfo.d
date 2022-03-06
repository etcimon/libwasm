module spasm.bindings.AppInfo;

import spasm.types;
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
    return AppInfo(spasm_add__object());
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


