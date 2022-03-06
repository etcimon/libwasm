module spasm.bindings.MediaKeys;

import spasm.types;
import spasm.bindings.MediaKeySession;
import spasm.bindings.MediaKeyStatusMap;

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
    return MediaKeySession(MediaKeys_createSession(this.handle, sessionType));
  }
  auto createSession()() {
    return MediaKeySession(Object_Getter__Handle(this.handle, "createSession"));
  }
  auto setServerCertificate()(scope ref BufferSource serverCertificate) {
    return Promise!(void)(Object_Call_Handle__Handle(this.handle, "setServerCertificate", serverCertificate.handle));
  }
  auto getStatusForPolicy()(scope ref MediaKeysPolicy policy) {
    return Promise!(MediaKeyStatus)(Object_Call_Handle__Handle(this.handle, "getStatusForPolicy", policy.handle));
  }
  auto getStatusForPolicy()() {
    return Promise!(MediaKeyStatus)(Object_Getter__Handle(this.handle, "getStatusForPolicy"));
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
    return MediaKeysPolicy(spasm_add__object());
  }
  void minHdcpVersion()(string minHdcpVersion) {
    Object_Call_string__void(this.handle, "minHdcpVersion", minHdcpVersion);
  }
  string minHdcpVersion()() {
    return Object_Getter__string(this.handle, "minHdcpVersion");
  }
}


extern (C) Handle MediaKeys_createSession(Handle, MediaKeySessionType);