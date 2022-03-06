module spasm.bindings.RTCConfiguration;

import spasm.types;
import spasm.bindings.RTCCertificate;

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
    return RTCConfiguration(spasm_add__object());
  }
  void iceServers()(scope ref Sequence!(RTCIceServer) iceServers) {
    Object_Call_Handle__void(this.handle, "iceServers", iceServers.handle);
  }
  auto iceServers()() {
    return Sequence!(RTCIceServer)(Object_Getter__Handle(this.handle, "iceServers"));
  }
  void iceTransportPolicy()(RTCIceTransportPolicy iceTransportPolicy) {
    RTCConfiguration_iceTransportPolicy_Set(this.handle, iceTransportPolicy);
  }
  RTCIceTransportPolicy iceTransportPolicy()() {
    return RTCConfiguration_iceTransportPolicy_Get(this.handle);
  }
  void bundlePolicy()(RTCBundlePolicy bundlePolicy) {
    RTCConfiguration_bundlePolicy_Set(this.handle, bundlePolicy);
  }
  RTCBundlePolicy bundlePolicy()() {
    return RTCConfiguration_bundlePolicy_Get(this.handle);
  }
  void peerIdentity(T0)(scope auto ref Optional!(T0) peerIdentity) if (isTOrPointer!(T0, string)) {
    RTCConfiguration_peerIdentity_Set(this.handle, !peerIdentity.empty, peerIdentity.front);
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
    return RTCIceServer(spasm_add__object());
  }
  void urls()(scope ref SumType!(string, Sequence!(string)) urls) {
    RTCIceServer_urls_Set(this.handle, urls);
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
    RTCIceServer_credentialType_Set(this.handle, credentialType);
  }
  RTCIceCredentialType credentialType()() {
    return RTCIceServer_credentialType_Get(this.handle);
  }
}
enum RTCIceTransportPolicy {
  relay,
  all
}


extern (C) void RTCConfiguration_iceTransportPolicy_Set(Handle, RTCIceTransportPolicy);
extern (C) RTCIceTransportPolicy RTCConfiguration_iceTransportPolicy_Get(Handle);
extern (C) void RTCConfiguration_bundlePolicy_Set(Handle, RTCBundlePolicy);
extern (C) RTCBundlePolicy RTCConfiguration_bundlePolicy_Get(Handle);
extern (C) void RTCConfiguration_peerIdentity_Set(Handle, bool, string);
extern (C) void RTCIceServer_urls_Set(Handle, scope ref SumType!(string, Sequence!(string)));
extern (C) void RTCIceServer_credentialType_Set(Handle, RTCIceCredentialType);
extern (C) RTCIceCredentialType RTCIceServer_credentialType_Get(Handle);