module libwasm.bindings.MediaKeysRequestStatus;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

enum MediaKeySystemStatus {
  available,
  api_disabled,
  cdm_disabled,
  cdm_not_supported,
  cdm_not_installed,
  cdm_created
}
struct RequestMediaKeySystemAccessNotification {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RequestMediaKeySystemAccessNotification(libwasm_add__object());
  }
  void keySystem()(string keySystem) {
    Object_Call_string__void(this.handle, "keySystem", keySystem);
  }
  string keySystem()() {
    return Object_Getter__string(this.handle, "keySystem");
  }
  void status()(MediaKeySystemStatus status) {
    Object_Call_int__void(this.handle, "status", status);
  }
  MediaKeySystemStatus status()() {
    return Object_Getter__int(this.handle, "status");
  }
}


