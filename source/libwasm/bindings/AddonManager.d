module libwasm.bindings.AddonManager;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct Addon {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  string version_()() {
    return Object_Getter__string(this.handle, "version");
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  string description()() {
    return Object_Getter__string(this.handle, "description");
  }
  bool isEnabled()() {
    return Object_Getter__bool(this.handle, "isEnabled");
  }
  bool isActive()() {
    return Object_Getter__bool(this.handle, "isActive");
  }
  bool canUninstall()() {
    return Object_Getter__bool(this.handle, "canUninstall");
  }
  auto uninstall()() {
    return JsPromise!(bool)(Object_Getter__Handle(this.handle, "uninstall"));
  }
  auto setEnabled()(bool value) {
    return JsPromise!(void)(Object_Call_bool__Handle(this.handle, "setEnabled", value));
  }
}
struct AddonInstall {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string state()() {
    return Object_Getter__string(this._parent, "state");
  }
  Optional!(string) error()() {
    return Object_Getter__OptionalString(this._parent, "error");
  }
  int progress()() {
    return Object_Getter__int(this._parent, "progress");
  }
  int maxProgress()() {
    return Object_Getter__int(this._parent, "maxProgress");
  }
  auto install()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "install"));
  }
  auto cancel()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "cancel"));
  }
}
struct AddonManager {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto getAddonByID()(string id) {
    return JsPromise!(Addon)(Object_Call_string__Handle(this._parent, "getAddonByID", id));
  }
  auto createInstall()(scope ref addonInstallOptions options) {
    return JsPromise!(AddonInstall)(Object_Call_Handle__Handle(this._parent, "createInstall", options.handle));
  }
  auto createInstall()() {
    return JsPromise!(AddonInstall)(Object_Getter__Handle(this._parent, "createInstall"));
  }
  bool permissionPromptsEnabled()() {
    return Object_Getter__bool(this._parent, "permissionPromptsEnabled");
  }
}
struct AddonManagerPermissions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  bool isHostPermitted()(string host) {
    return Object_Call_string__bool(this.handle, "isHostPermitted", host);
  }
}
struct addonInstallOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return addonInstallOptions(libwasm_add__object());
  }
  void url()(string url) {
    Object_Call_string__void(this.handle, "url", url);
  }
  string url()() {
    return Object_Getter__string(this.handle, "url");
  }
  void hash(T0)(scope auto ref Optional!(T0) hash) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "hash", "Optional!(string)", tuple(!hash.empty, hash.front));
  }
  Optional!(string) hash()() {
    return Object_Getter__OptionalString(this.handle, "hash");
  }
}


