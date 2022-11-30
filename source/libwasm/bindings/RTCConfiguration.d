module libwasm.bindings.RTCConfiguration;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.RTCCertificate;

@safe:
nothrow:

enum RTCBundlePolicy {
  balanced,
  max_compat,
  max_bundle
}
struct RTCConfiguration {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCConfiguration(libwasm_add__object());
  }
  void iceServers()(scope ref Sequence!(RTCIceServer) iceServers) {
    Object_Call_Handle__void(this.handle, "iceServers", iceServers.handle);
  }
  auto iceServers()() {
    return Sequence!(RTCIceServer)(Object_Getter__Handle(this.handle, "iceServers"));
  }
  void iceTransportPolicy()(RTCIceTransportPolicy iceTransportPolicy) {
    Object_Call_int__void(this.handle, "iceTransportPolicy", iceTransportPolicy);
  }
  RTCIceTransportPolicy iceTransportPolicy()() {
    return Object_Getter__int(this.handle, "iceTransportPolicy");
  }
  void bundlePolicy()(RTCBundlePolicy bundlePolicy) {
    Object_Call_int__void(this.handle, "bundlePolicy", bundlePolicy);
  }
  RTCBundlePolicy bundlePolicy()() {
    return Object_Getter__int(this.handle, "bundlePolicy");
  }
  void peerIdentity(T0)(scope auto ref Optional!(T0) peerIdentity) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "peerIdentity", "Optional!(string)", tuple(!peerIdentity.empty, peerIdentity.front));
  }
  Optional!(string) peerIdentity()() {
    return Object_Getter__OptionalString(this.handle, "peerIdentity");
  }
  void certificates()(scope ref Sequence!(RTCCertificate) certificates) {
    Object_Call_Handle__void(this.handle, "certificates", certificates.handle);
  }
  auto certificates()() {
    return Sequence!(RTCCertificate)(Object_Getter__Handle(this.handle, "certificates"));
  }
}
enum RTCIceCredentialType {
  password,
  token
}
struct RTCIceServer {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCIceServer(libwasm_add__object());
  }
  void urls()(scope ref SumType!(string, Sequence!(string)) urls) {
    Serialize_Object_VarArgCall!void(this.handle, "urls", "SumType!(string,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref urls.Types[1] v) => 1))(urls),tuple(libwasm.sumtype.match!(((string v) => v),((ref urls.Types[1] v) => string.init))(urls),libwasm.sumtype.match!(((string v) => Handle.init),((ref urls.Types[1] v) => cast(Handle)v.handle))(urls))));
  }
  auto urls()() {
    return Object_Getter__Handle(this.handle, "urls");
  }
  void url()(string url) {
    Object_Call_string__void(this.handle, "url", url);
  }
  string url()() {
    return Object_Getter__string(this.handle, "url");
  }
  void username()(string username) {
    Object_Call_string__void(this.handle, "username", username);
  }
  string username()() {
    return Object_Getter__string(this.handle, "username");
  }
  void credential()(string credential) {
    Object_Call_string__void(this.handle, "credential", credential);
  }
  string credential()() {
    return Object_Getter__string(this.handle, "credential");
  }
  void credentialType()(RTCIceCredentialType credentialType) {
    Object_Call_int__void(this.handle, "credentialType", credentialType);
  }
  RTCIceCredentialType credentialType()() {
    return Object_Getter__int(this.handle, "credentialType");
  }
}
enum RTCIceTransportPolicy {
  relay,
  all
}


