module libwasm.bindings.WidevineCDMManifest;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct WidevineCDMManifest {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return WidevineCDMManifest(libwasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  void description()(string description) {
    Object_Call_string__void(this.handle, "description", description);
  }
  string description()() {
    return Object_Getter__string(this.handle, "description");
  }
  void version_()(string version_) {
    Object_Call_string__void(this.handle, "version", version_);
  }
  string version_()() {
    return Object_Getter__string(this.handle, "version");
  }
  void x_cdm_module_versions()(string x_cdm_module_versions) {
    Object_Call_string__void(this.handle, "x-cdm-module-versions", x_cdm_module_versions);
  }
  string x_cdm_module_versions()() {
    return Object_Getter__string(this.handle, "x-cdm-module-versions");
  }
  void x_cdm_interface_versions()(string x_cdm_interface_versions) {
    Object_Call_string__void(this.handle, "x-cdm-interface-versions", x_cdm_interface_versions);
  }
  string x_cdm_interface_versions()() {
    return Object_Getter__string(this.handle, "x-cdm-interface-versions");
  }
  void x_cdm_host_versions()(string x_cdm_host_versions) {
    Object_Call_string__void(this.handle, "x-cdm-host-versions", x_cdm_host_versions);
  }
  string x_cdm_host_versions()() {
    return Object_Getter__string(this.handle, "x-cdm-host-versions");
  }
  void x_cdm_codecs()(string x_cdm_codecs) {
    Object_Call_string__void(this.handle, "x-cdm-codecs", x_cdm_codecs);
  }
  string x_cdm_codecs()() {
    return Object_Getter__string(this.handle, "x-cdm-codecs");
  }
}


