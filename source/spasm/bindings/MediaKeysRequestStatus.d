module spasm.bindings.MediaKeysRequestStatus;

import spasm.types;
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
    return RequestMediaKeySystemAccessNotification(spasm_add__object());
  }
  void keySystem()(string keySystem) {
    Object_Call_string__void(this.handle, "keySystem", keySystem);
  }
  string keySystem()() {
    return Object_Getter__string(this.handle, "keySystem");
  }
  void status()(MediaKeySystemStatus status) {
    RequestMediaKeySystemAccessNotification_status_Set(this.handle, status);
  }
  MediaKeySystemStatus status()() {
    return RequestMediaKeySystemAccessNotification_status_Get(this.handle);
  }
}


extern (C) void RequestMediaKeySystemAccessNotification_status_Set(Handle, MediaKeySystemStatus);
extern (C) MediaKeySystemStatus RequestMediaKeySystemAccessNotification_status_Get(Handle);