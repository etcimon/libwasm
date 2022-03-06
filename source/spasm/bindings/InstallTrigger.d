module spasm.bindings.InstallTrigger;

import spasm.types;
@safe:
nothrow:

alias InstallTriggerCallback = void delegate(string, short);
struct InstallTriggerData {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return InstallTriggerData(spasm_add__object());
  }
  void URL()(string urL) {
    Object_Call_string__void(this.handle, "URL", URL);
  }
  string URL()() {
    return Object_Getter__string(this.handle, "URL");
  }
  void IconURL(T0)(scope auto ref Optional!(T0) iconURL) if (isTOrPointer!(T0, string)) {
    InstallTriggerData_IconURL_Set(this.handle, !IconURL.empty, IconURL.front);
  }
  Optional!(string) IconURL()() {
    return Object_Getter__OptionalString(this.handle, "IconURL");
  }
  void Hash(T0)(scope auto ref Optional!(T0) hash) if (isTOrPointer!(T0, string)) {
    InstallTriggerData_Hash_Set(this.handle, !Hash.empty, Hash.front);
  }
  Optional!(string) Hash()() {
    return Object_Getter__OptionalString(this.handle, "Hash");
  }
}
struct InstallTriggerImpl {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort SKIN = 1;
  enum ushort LOCALE = 2;
  enum ushort CONTENT = 4;
  enum ushort PACKAGE = 7;
  bool enabled()() {
    return Object_Getter__bool(this.handle, "enabled");
  }
  bool updateEnabled()() {
    return Object_Getter__bool(this.handle, "updateEnabled");
  }
  bool install()(scope ref Record!(string, SumType!(string, InstallTriggerData)) installs, InstallTriggerCallback callback) {
    return InstallTriggerImpl_install(this.handle, installs.handle, callback);
  }
  bool install()(scope ref Record!(string, SumType!(string, InstallTriggerData)) installs) {
    return InstallTriggerImpl_install_0(this.handle, installs.handle);
  }
  bool installChrome()(ushort type, string url, string skin) {
    return InstallTriggerImpl_installChrome(this.handle, type, url, skin);
  }
  bool startSoftwareUpdate()(string url, ushort flags) {
    return InstallTriggerImpl_startSoftwareUpdate(this.handle, url, flags);
  }
  bool startSoftwareUpdate()(string url) {
    return Object_Call_string__bool(this.handle, "startSoftwareUpdate", url);
  }
}


extern (C) void InstallTriggerData_IconURL_Set(Handle, bool, string);
extern (C) void InstallTriggerData_Hash_Set(Handle, bool, string);
extern (C) bool InstallTriggerImpl_install(Handle, Handle, InstallTriggerCallback);
extern (C) bool InstallTriggerImpl_install_0(Handle, Handle);
extern (C) bool InstallTriggerImpl_installChrome(Handle, ushort, string, string);
extern (C) bool InstallTriggerImpl_startSoftwareUpdate(Handle, string, ushort);