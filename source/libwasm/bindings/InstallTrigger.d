module libwasm.bindings.InstallTrigger;

import libwasm.types;

import libwasm.memory.ct: tuple;
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
    return InstallTriggerData(libwasm_add__object());
  }
  void URL()(string urL) {
    Object_Call_string__void(this.handle, "URL", URL);
  }
  string URL()() {
    return Object_Getter__string(this.handle, "URL");
  }
  void IconURL(T0)(scope auto ref Optional!(T0) iconURL) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "IconURL", "Optional!(string)", tuple(!IconURL.empty, IconURL.front));
  }
  Optional!(string) IconURL()() {
    return Object_Getter__OptionalString(this.handle, "IconURL");
  }
  void Hash(T0)(scope auto ref Optional!(T0) hash) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "Hash", "Optional!(string)", tuple(!Hash.empty, Hash.front));
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
    return Serialize_Object_VarArgCall!bool(this.handle, "install", "Handle", tuple(cast(Handle)installs.handle));
  }
  bool installChrome()(ushort type, string url, string skin) {
    return Serialize_Object_VarArgCall!bool(this.handle, "installChrome", "ushort;string;string", tuple(type, url, skin));
  }
  bool startSoftwareUpdate()(string url, ushort flags) {
    return Serialize_Object_VarArgCall!bool(this.handle, "startSoftwareUpdate", "string;ushort", tuple(url, flags));
  }
  bool startSoftwareUpdate()(string url) {
    return Object_Call_string__bool(this.handle, "startSoftwareUpdate", url);
  }
}


extern (C) bool InstallTriggerImpl_install(Handle, Handle, InstallTriggerCallback);