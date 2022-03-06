module spasm.bindings.WebAuthentication;

import spasm.types;
import spasm.bindings.CredentialManagement;

@safe:
nothrow:

alias AAGUID = BufferSource;
enum AttestationConveyancePreference {
  none,
  indirect,
  direct
}
alias AuthenticationExtensionsAuthenticatorInputs = Record!(string, string);
struct AuthenticationExtensionsClientInputs {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AuthenticationExtensionsClientInputs(spasm_add__object());
  }
  void appid()(string appid) {
    Object_Call_string__void(this.handle, "appid", appid);
  }
  string appid()() {
    return Object_Getter__string(this.handle, "appid");
  }
}
struct AuthenticationExtensionsClientOutputs {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AuthenticationExtensionsClientOutputs(spasm_add__object());
  }
  void appid()(bool appid) {
    Object_Call_bool__void(this.handle, "appid", appid);
  }
  bool appid()() {
    return Object_Getter__bool(this.handle, "appid");
  }
}
struct AuthenticatorAssertionResponse {
  nothrow:
  spasm.bindings.WebAuthentication.AuthenticatorResponse _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AuthenticatorResponse(h);
  }
  auto authenticatorData()() {
    return ArrayBuffer(Object_Getter__Handle(this._parent, "authenticatorData"));
  }
  auto signature()() {
    return ArrayBuffer(Object_Getter__Handle(this._parent, "signature"));
  }
  auto userHandle()() {
    return Object_Getter__OptionalHandle(this._parent, "userHandle");
  }
}
enum AuthenticatorAttachment {
  platform,
  cross_platform
}
struct AuthenticatorAttestationResponse {
  nothrow:
  spasm.bindings.WebAuthentication.AuthenticatorResponse _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AuthenticatorResponse(h);
  }
  auto attestationObject()() {
    return ArrayBuffer(Object_Getter__Handle(this._parent, "attestationObject"));
  }
}
struct AuthenticatorResponse {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto clientDataJSON()() {
    return ArrayBuffer(Object_Getter__Handle(this.handle, "clientDataJSON"));
  }
}
struct AuthenticatorSelectionCriteria {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AuthenticatorSelectionCriteria(spasm_add__object());
  }
  void authenticatorAttachment()(AuthenticatorAttachment authenticatorAttachment) {
    AuthenticatorSelectionCriteria_authenticatorAttachment_Set(this.handle, authenticatorAttachment);
  }
  AuthenticatorAttachment authenticatorAttachment()() {
    return AuthenticatorSelectionCriteria_authenticatorAttachment_Get(this.handle);
  }
  void requireResidentKey()(bool requireResidentKey) {
    Object_Call_bool__void(this.handle, "requireResidentKey", requireResidentKey);
  }
  bool requireResidentKey()() {
    return Object_Getter__bool(this.handle, "requireResidentKey");
  }
  void userVerification()(UserVerificationRequirement userVerification) {
    AuthenticatorSelectionCriteria_userVerification_Set(this.handle, userVerification);
  }
  UserVerificationRequirement userVerification()() {
    return AuthenticatorSelectionCriteria_userVerification_Get(this.handle);
  }
}
alias AuthenticatorSelectionList = Sequence!(AAGUID);
enum AuthenticatorTransport {
  usb,
  nfc,
  ble,
  internal
}
alias COSEAlgorithmIdentifier = int;
struct CollectedClientData {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return CollectedClientData(spasm_add__object());
  }
  void type()(string type) {
    Object_Call_string__void(this.handle, "type", type);
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  void challenge()(string challenge) {
    Object_Call_string__void(this.handle, "challenge", challenge);
  }
  string challenge()() {
    return Object_Getter__string(this.handle, "challenge");
  }
  void origin()(string origin) {
    Object_Call_string__void(this.handle, "origin", origin);
  }
  string origin()() {
    return Object_Getter__string(this.handle, "origin");
  }
  void hashAlgorithm()(string hashAlgorithm) {
    Object_Call_string__void(this.handle, "hashAlgorithm", hashAlgorithm);
  }
  string hashAlgorithm()() {
    return Object_Getter__string(this.handle, "hashAlgorithm");
  }
  void tokenBindingId()(string tokenBindingId) {
    Object_Call_string__void(this.handle, "tokenBindingId", tokenBindingId);
  }
  string tokenBindingId()() {
    return Object_Getter__string(this.handle, "tokenBindingId");
  }
  void clientExtensions()(scope ref AuthenticationExtensionsClientInputs clientExtensions) {
    Object_Call_Handle__void(this.handle, "clientExtensions", clientExtensions.handle);
  }
  auto clientExtensions()() {
    return AuthenticationExtensionsClientInputs(Object_Getter__Handle(this.handle, "clientExtensions"));
  }
  void authenticatorExtensions()(scope ref Record!(string, string) authenticatorExtensions) {
    Object_Call_Handle__void(this.handle, "authenticatorExtensions", authenticatorExtensions.handle);
  }
  auto authenticatorExtensions()() {
    return Record!(string, string)(Object_Getter__Handle(this.handle, "authenticatorExtensions"));
  }
}
struct PublicKeyCredential {
  nothrow:
  spasm.bindings.CredentialManagement.Credential _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Credential(h);
  }
  auto rawId()() {
    return ArrayBuffer(Object_Getter__Handle(this._parent, "rawId"));
  }
  auto response()() {
    return AuthenticatorResponse(Object_Getter__Handle(this._parent, "response"));
  }
  auto getClientExtensionResults()() {
    return AuthenticationExtensionsClientOutputs(Object_Getter__Handle(this._parent, "getClientExtensionResults"));
  }
  auto isUserVerifyingPlatformAuthenticatorAvailable()() {
    return Promise!(bool)(Object_Getter__Handle(this._parent, "isUserVerifyingPlatformAuthenticatorAvailable"));
  }
  auto isExternalCTAP2SecurityKeySupported()() {
    return Promise!(bool)(Object_Getter__Handle(this._parent, "isExternalCTAP2SecurityKeySupported"));
  }
}
struct PublicKeyCredentialCreationOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PublicKeyCredentialCreationOptions(spasm_add__object());
  }
  void rp()(scope ref PublicKeyCredentialRpEntity rp) {
    Object_Call_Handle__void(this.handle, "rp", rp.handle);
  }
  auto rp()() {
    return PublicKeyCredentialRpEntity(Object_Getter__Handle(this.handle, "rp"));
  }
  void user()(scope ref PublicKeyCredentialUserEntity user) {
    Object_Call_Handle__void(this.handle, "user", user.handle);
  }
  auto user()() {
    return PublicKeyCredentialUserEntity(Object_Getter__Handle(this.handle, "user"));
  }
  void challenge()(scope ref BufferSource challenge) {
    Object_Call_Handle__void(this.handle, "challenge", challenge.handle);
  }
  auto challenge()() {
    return BufferSource(Object_Getter__Handle(this.handle, "challenge"));
  }
  void pubKeyCredParams()(scope ref Sequence!(PublicKeyCredentialParameters) pubKeyCredParams) {
    Object_Call_Handle__void(this.handle, "pubKeyCredParams", pubKeyCredParams.handle);
  }
  auto pubKeyCredParams()() {
    return Sequence!(PublicKeyCredentialParameters)(Object_Getter__Handle(this.handle, "pubKeyCredParams"));
  }
  void timeout()(uint timeout) {
    Object_Call_uint__void(this.handle, "timeout", timeout);
  }
  uint timeout()() {
    return Object_Getter__uint(this.handle, "timeout");
  }
  void excludeCredentials()(scope ref Sequence!(PublicKeyCredentialDescriptor) excludeCredentials) {
    Object_Call_Handle__void(this.handle, "excludeCredentials", excludeCredentials.handle);
  }
  auto excludeCredentials()() {
    return Sequence!(PublicKeyCredentialDescriptor)(Object_Getter__Handle(this.handle, "excludeCredentials"));
  }
  void authenticatorSelection()(scope ref AuthenticatorSelectionCriteria authenticatorSelection) {
    Object_Call_Handle__void(this.handle, "authenticatorSelection", authenticatorSelection.handle);
  }
  auto authenticatorSelection()() {
    return AuthenticatorSelectionCriteria(Object_Getter__Handle(this.handle, "authenticatorSelection"));
  }
  void attestation()(AttestationConveyancePreference attestation) {
    PublicKeyCredentialCreationOptions_attestation_Set(this.handle, attestation);
  }
  AttestationConveyancePreference attestation()() {
    return PublicKeyCredentialCreationOptions_attestation_Get(this.handle);
  }
  void extensions()(scope ref AuthenticationExtensionsClientInputs extensions) {
    Object_Call_Handle__void(this.handle, "extensions", extensions.handle);
  }
  auto extensions()() {
    return AuthenticationExtensionsClientInputs(Object_Getter__Handle(this.handle, "extensions"));
  }
}
struct PublicKeyCredentialDescriptor {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PublicKeyCredentialDescriptor(spasm_add__object());
  }
  void type()(PublicKeyCredentialType type) {
    PublicKeyCredentialDescriptor_type_Set(this.handle, type);
  }
  PublicKeyCredentialType type()() {
    return PublicKeyCredentialDescriptor_type_Get(this.handle);
  }
  void id()(scope ref BufferSource id) {
    Object_Call_Handle__void(this.handle, "id", id.handle);
  }
  auto id()() {
    return BufferSource(Object_Getter__Handle(this.handle, "id"));
  }
  void transports()(scope ref Sequence!(AuthenticatorTransport) transports) {
    Object_Call_Handle__void(this.handle, "transports", transports.handle);
  }
  auto transports()() {
    return Sequence!(AuthenticatorTransport)(Object_Getter__Handle(this.handle, "transports"));
  }
}
struct PublicKeyCredentialEntity {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PublicKeyCredentialEntity(spasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  void icon()(string icon) {
    Object_Call_string__void(this.handle, "icon", icon);
  }
  string icon()() {
    return Object_Getter__string(this.handle, "icon");
  }
}
struct PublicKeyCredentialParameters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PublicKeyCredentialParameters(spasm_add__object());
  }
  void type()(PublicKeyCredentialType type) {
    PublicKeyCredentialParameters_type_Set(this.handle, type);
  }
  PublicKeyCredentialType type()() {
    return PublicKeyCredentialParameters_type_Get(this.handle);
  }
  void alg()(int alg) {
    Object_Call_int__void(this.handle, "alg", alg);
  }
  int alg()() {
    return Object_Getter__int(this.handle, "alg");
  }
}
struct PublicKeyCredentialRequestOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PublicKeyCredentialRequestOptions(spasm_add__object());
  }
  void challenge()(scope ref BufferSource challenge) {
    Object_Call_Handle__void(this.handle, "challenge", challenge.handle);
  }
  auto challenge()() {
    return BufferSource(Object_Getter__Handle(this.handle, "challenge"));
  }
  void timeout()(uint timeout) {
    Object_Call_uint__void(this.handle, "timeout", timeout);
  }
  uint timeout()() {
    return Object_Getter__uint(this.handle, "timeout");
  }
  void rpId()(string rpId) {
    Object_Call_string__void(this.handle, "rpId", rpId);
  }
  string rpId()() {
    return Object_Getter__string(this.handle, "rpId");
  }
  void allowCredentials()(scope ref Sequence!(PublicKeyCredentialDescriptor) allowCredentials) {
    Object_Call_Handle__void(this.handle, "allowCredentials", allowCredentials.handle);
  }
  auto allowCredentials()() {
    return Sequence!(PublicKeyCredentialDescriptor)(Object_Getter__Handle(this.handle, "allowCredentials"));
  }
  void userVerification()(UserVerificationRequirement userVerification) {
    PublicKeyCredentialRequestOptions_userVerification_Set(this.handle, userVerification);
  }
  UserVerificationRequirement userVerification()() {
    return PublicKeyCredentialRequestOptions_userVerification_Get(this.handle);
  }
  void extensions()(scope ref AuthenticationExtensionsClientInputs extensions) {
    Object_Call_Handle__void(this.handle, "extensions", extensions.handle);
  }
  auto extensions()() {
    return AuthenticationExtensionsClientInputs(Object_Getter__Handle(this.handle, "extensions"));
  }
}
struct PublicKeyCredentialRpEntity {
  nothrow:
  spasm.bindings.WebAuthentication.PublicKeyCredentialEntity _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PublicKeyCredentialEntity(h);
  }
  static auto create() {
    return PublicKeyCredentialRpEntity(spasm_add__object());
  }
  void id()(string id) {
    Object_Call_string__void(this._parent, "id", id);
  }
  string id()() {
    return Object_Getter__string(this._parent, "id");
  }
}
enum PublicKeyCredentialType {
  public_key
}
struct PublicKeyCredentialUserEntity {
  nothrow:
  spasm.bindings.WebAuthentication.PublicKeyCredentialEntity _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PublicKeyCredentialEntity(h);
  }
  static auto create() {
    return PublicKeyCredentialUserEntity(spasm_add__object());
  }
  void id()(scope ref BufferSource id) {
    Object_Call_Handle__void(this._parent, "id", id.handle);
  }
  auto id()() {
    return BufferSource(Object_Getter__Handle(this._parent, "id"));
  }
  void displayName()(string displayName) {
    Object_Call_string__void(this._parent, "displayName", displayName);
  }
  string displayName()() {
    return Object_Getter__string(this._parent, "displayName");
  }
}
enum UserVerificationRequirement {
  required,
  preferred,
  discouraged
}


extern (C) void AuthenticatorSelectionCriteria_authenticatorAttachment_Set(Handle, AuthenticatorAttachment);
extern (C) AuthenticatorAttachment AuthenticatorSelectionCriteria_authenticatorAttachment_Get(Handle);
extern (C) void AuthenticatorSelectionCriteria_userVerification_Set(Handle, UserVerificationRequirement);
extern (C) UserVerificationRequirement AuthenticatorSelectionCriteria_userVerification_Get(Handle);
extern (C) void PublicKeyCredentialCreationOptions_attestation_Set(Handle, AttestationConveyancePreference);
extern (C) AttestationConveyancePreference PublicKeyCredentialCreationOptions_attestation_Get(Handle);
extern (C) void PublicKeyCredentialDescriptor_type_Set(Handle, PublicKeyCredentialType);
extern (C) PublicKeyCredentialType PublicKeyCredentialDescriptor_type_Get(Handle);
extern (C) void PublicKeyCredentialParameters_type_Set(Handle, PublicKeyCredentialType);
extern (C) PublicKeyCredentialType PublicKeyCredentialParameters_type_Get(Handle);
extern (C) void PublicKeyCredentialRequestOptions_userVerification_Set(Handle, UserVerificationRequirement);
extern (C) UserVerificationRequirement PublicKeyCredentialRequestOptions_userVerification_Get(Handle);