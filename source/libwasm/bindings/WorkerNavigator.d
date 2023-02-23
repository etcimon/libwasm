module libwasm.bindings.WorkerNavigator;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.MediaCapabilities;
import libwasm.bindings.Navigator;
import libwasm.bindings.NetworkInformation;
import libwasm.bindings.StorageManager;

@safe:
nothrow:

struct WorkerNavigator {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto connection()() {
    return NetworkInformation(Object_Getter__Handle(this.handle, "connection"));
  }
  auto mediaCapabilities()() {
    return MediaCapabilities(Object_Getter__Handle(this.handle, "mediaCapabilities"));
  }
  string appCodeName()() {
    return Object_Getter__string(this.handle, "appCodeName");
  }
  string appName()() {
    return Object_Getter__string(this.handle, "appName");
  }
  string appVersion()() {
    return Object_Getter__string(this.handle, "appVersion");
  }
  string platform()() {
    return Object_Getter__string(this.handle, "platform");
  }
  string userAgent()() {
    return Object_Getter__string(this.handle, "userAgent");
  }
  string product()() {
    return Object_Getter__string(this.handle, "product");
  }
  bool taintEnabled()() {
    return Object_Getter__bool(this.handle, "taintEnabled");
  }
  Optional!(string) language()() {
    return Object_Getter__OptionalString(this.handle, "language");
  }
  auto languages()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "languages"));
  }
  bool onLine()() {
    return Object_Getter__bool(this.handle, "onLine");
  }
  uint hardwareConcurrency()() {
    return Object_Getter__uint(this.handle, "hardwareConcurrency");
  }
  auto storage()() {
    return StorageManager(Object_Getter__Handle(this.handle, "storage"));
  }
}


