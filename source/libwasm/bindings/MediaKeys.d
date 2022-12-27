module libwasm.bindings.MediaKeys;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.MediaKeySession;
import libwasm.bindings.MediaKeyStatusMap;

@safe:
nothrow:

enum MediaKeySessionType {
  temporary,
  persistent_license
}
struct MediaKeys {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string keySystem()() {
    return Object_Getter__string(this.handle, "keySystem");
  }
  auto createSession()(MediaKeySessionType sessionType /* = "temporary" */) {
    return MediaKeySession(Object_Call_int__Handle(this.handle, "createSession", sessionType));
  }
  auto createSession()() {
    return MediaKeySession(Object_Getter__Handle(this.handle, "createSession"));
  }
  auto setServerCertificate()(scope ref BufferSource serverCertificate) {
    return JsPromise!(void)(Object_Call_Handle__Handle(this.handle, "setServerCertificate", serverCertificate.handle));
  }
  auto getStatusForPolicy()(scope ref MediaKeysPolicy policy) {
    return JsPromise!(MediaKeyStatus)(Object_Call_Handle__Handle(this.handle, "getStatusForPolicy", policy.handle));
  }
  auto getStatusForPolicy()() {
    return JsPromise!(MediaKeyStatus)(Object_Getter__Handle(this.handle, "getStatusForPolicy"));
  }
}
struct MediaKeysPolicy {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MediaKeysPolicy(libwasm_add__object());
  }
  void minHdcpVersion()(string minHdcpVersion) {
    Object_Call_string__void(this.handle, "minHdcpVersion", minHdcpVersion);
  }
  string minHdcpVersion()() {
    return Object_Getter__string(this.handle, "minHdcpVersion");
  }
}


