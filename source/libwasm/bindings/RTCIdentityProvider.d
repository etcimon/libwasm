module libwasm.bindings.RTCIdentityProvider;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

alias GenerateAssertionCallback = JsPromise!(RTCIdentityAssertionResult) delegate(string, string, RTCIdentityProviderOptions);
struct RTCIdentityAssertionResult {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCIdentityAssertionResult(libwasm_add__object());
  }
  void idp()(scope ref RTCIdentityProviderDetails idp) {
    Object_Call_Handle__void(this.handle, "idp", idp.handle);
  }
  auto idp()() {
    return RTCIdentityProviderDetails(Object_Getter__Handle(this.handle, "idp"));
  }
  void assertion()(string assertion) {
    Object_Call_string__void(this.handle, "assertion", assertion);
  }
  string assertion()() {
    return Object_Getter__string(this.handle, "assertion");
  }
}
struct RTCIdentityProvider {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCIdentityProvider(libwasm_add__object());
  }
  void generateAssertion()(GenerateAssertionCallback generateAssertion) {
    RTCIdentityProvider_generateAssertion_Set(this.handle, generateAssertion);
  }
  GenerateAssertionCallback generateAssertion()() {
    return RTCIdentityProvider_generateAssertion_Get(this.handle);
  }
  void validateAssertion()(ValidateAssertionCallback validateAssertion) {
    RTCIdentityProvider_validateAssertion_Set(this.handle, validateAssertion);
  }
  ValidateAssertionCallback validateAssertion()() {
    return RTCIdentityProvider_validateAssertion_Get(this.handle);
  }
}
struct RTCIdentityProviderDetails {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCIdentityProviderDetails(libwasm_add__object());
  }
  void domain()(string domain) {
    Object_Call_string__void(this.handle, "domain", domain);
  }
  string domain()() {
    return Object_Getter__string(this.handle, "domain");
  }
  void protocol()(string protocol) {
    Object_Call_string__void(this.handle, "protocol", protocol);
  }
  string protocol()() {
    return Object_Getter__string(this.handle, "protocol");
  }
}
struct RTCIdentityProviderOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCIdentityProviderOptions(libwasm_add__object());
  }
  void protocol()(string protocol) {
    Object_Call_string__void(this.handle, "protocol", protocol);
  }
  string protocol()() {
    return Object_Getter__string(this.handle, "protocol");
  }
  void usernameHint()(string usernameHint) {
    Object_Call_string__void(this.handle, "usernameHint", usernameHint);
  }
  string usernameHint()() {
    return Object_Getter__string(this.handle, "usernameHint");
  }
  void peerIdentity()(string peerIdentity) {
    Object_Call_string__void(this.handle, "peerIdentity", peerIdentity);
  }
  string peerIdentity()() {
    return Object_Getter__string(this.handle, "peerIdentity");
  }
}
struct RTCIdentityProviderRegistrar {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void register()(scope ref RTCIdentityProvider idp) {
    Object_Call_Handle__void(this.handle, "register", idp.handle);
  }
  bool hasIdp()() {
    return Object_Getter__bool(this.handle, "hasIdp");
  }
  auto generateAssertion()(string contents, string origin, scope ref RTCIdentityProviderOptions options) {
    return JsPromise!(RTCIdentityAssertionResult)(Serialize_Object_VarArgCall!Handle(this.handle, "generateAssertion", "string;string;Handle", tuple(contents, origin, cast(Handle)options.handle)));
  }
  auto generateAssertion()(string contents, string origin) {
    return JsPromise!(RTCIdentityAssertionResult)(Object_Call_string_string__Handle(this.handle, "generateAssertion", contents, origin));
  }
  auto validateAssertion()(string assertion, string origin) {
    return JsPromise!(RTCIdentityValidationResult)(Object_Call_string_string__Handle(this.handle, "validateAssertion", assertion, origin));
  }
}
struct RTCIdentityValidationResult {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RTCIdentityValidationResult(libwasm_add__object());
  }
  void identity()(string identity) {
    Object_Call_string__void(this.handle, "identity", identity);
  }
  string identity()() {
    return Object_Getter__string(this.handle, "identity");
  }
  void contents()(string contents) {
    Object_Call_string__void(this.handle, "contents", contents);
  }
  string contents()() {
    return Object_Getter__string(this.handle, "contents");
  }
}
alias ValidateAssertionCallback = JsPromise!(RTCIdentityValidationResult) delegate(string, string);


extern (C) void RTCIdentityProvider_generateAssertion_Set(Handle, GenerateAssertionCallback);
extern (C) GenerateAssertionCallback RTCIdentityProvider_generateAssertion_Get(Handle);
extern (C) void RTCIdentityProvider_validateAssertion_Set(Handle, ValidateAssertionCallback);
extern (C) ValidateAssertionCallback RTCIdentityProvider_validateAssertion_Get(Handle);