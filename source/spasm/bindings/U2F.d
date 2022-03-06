module spasm.bindings.U2F;

import spasm.types;
@safe:
nothrow:

alias ErrorCode = ushort;
struct GlobalU2F {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto u2f()() {
    return U2F(Object_Getter__Handle(this.handle, "u2f"));
  }
}
struct RegisterRequest {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RegisterRequest(spasm_add__object());
  }
  void version_()(string version_) {
    Object_Call_string__void(this.handle, "version", version_);
  }
  string version_()() {
    return Object_Getter__string(this.handle, "version");
  }
  void challenge()(string challenge) {
    Object_Call_string__void(this.handle, "challenge", challenge);
  }
  string challenge()() {
    return Object_Getter__string(this.handle, "challenge");
  }
}
struct RegisterResponse {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RegisterResponse(spasm_add__object());
  }
  void version_()(string version_) {
    Object_Call_string__void(this.handle, "version", version_);
  }
  string version_()() {
    return Object_Getter__string(this.handle, "version");
  }
  void registrationData()(string registrationData) {
    Object_Call_string__void(this.handle, "registrationData", registrationData);
  }
  string registrationData()() {
    return Object_Getter__string(this.handle, "registrationData");
  }
  void clientData()(string clientData) {
    Object_Call_string__void(this.handle, "clientData", clientData);
  }
  string clientData()() {
    return Object_Getter__string(this.handle, "clientData");
  }
  void errorCode(T0)(scope auto ref Optional!(T0) errorCode) if (isTOrPointer!(T0, ushort)) {
    RegisterResponse_errorCode_Set(this.handle, !errorCode.empty, errorCode.front);
  }
  Optional!(ushort) errorCode()() {
    return RegisterResponse_errorCode_Get(this.handle);
  }
  void errorMessage(T0)(scope auto ref Optional!(T0) errorMessage) if (isTOrPointer!(T0, string)) {
    RegisterResponse_errorMessage_Set(this.handle, !errorMessage.empty, errorMessage.front);
  }
  Optional!(string) errorMessage()() {
    return Object_Getter__OptionalString(this.handle, "errorMessage");
  }
}
struct RegisteredKey {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RegisteredKey(spasm_add__object());
  }
  void version_()(string version_) {
    Object_Call_string__void(this.handle, "version", version_);
  }
  string version_()() {
    return Object_Getter__string(this.handle, "version");
  }
  void keyHandle()(string keyHandle) {
    Object_Call_string__void(this.handle, "keyHandle", keyHandle);
  }
  string keyHandle()() {
    return Object_Getter__string(this.handle, "keyHandle");
  }
  void transports(T0)(scope auto ref Optional!(T0) transports) if (isTOrPointer!(T0, Transports)) {
    RegisteredKey_transports_Set(this.handle, !transports.empty, transports.front.handle);
  }
  auto transports()() {
    return Object_Getter__OptionalHandle(this.handle, "transports");
  }
  void appId(T0)(scope auto ref Optional!(T0) appId) if (isTOrPointer!(T0, string)) {
    RegisteredKey_appId_Set(this.handle, !appId.empty, appId.front);
  }
  Optional!(string) appId()() {
    return Object_Getter__OptionalString(this.handle, "appId");
  }
}
struct SignResponse {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return SignResponse(spasm_add__object());
  }
  void keyHandle()(string keyHandle) {
    Object_Call_string__void(this.handle, "keyHandle", keyHandle);
  }
  string keyHandle()() {
    return Object_Getter__string(this.handle, "keyHandle");
  }
  void signatureData()(string signatureData) {
    Object_Call_string__void(this.handle, "signatureData", signatureData);
  }
  string signatureData()() {
    return Object_Getter__string(this.handle, "signatureData");
  }
  void clientData()(string clientData) {
    Object_Call_string__void(this.handle, "clientData", clientData);
  }
  string clientData()() {
    return Object_Getter__string(this.handle, "clientData");
  }
  void errorCode(T0)(scope auto ref Optional!(T0) errorCode) if (isTOrPointer!(T0, ushort)) {
    SignResponse_errorCode_Set(this.handle, !errorCode.empty, errorCode.front);
  }
  Optional!(ushort) errorCode()() {
    return SignResponse_errorCode_Get(this.handle);
  }
  void errorMessage(T0)(scope auto ref Optional!(T0) errorMessage) if (isTOrPointer!(T0, string)) {
    SignResponse_errorMessage_Set(this.handle, !errorMessage.empty, errorMessage.front);
  }
  Optional!(string) errorMessage()() {
    return Object_Getter__OptionalString(this.handle, "errorMessage");
  }
}
enum Transport {
  bt,
  ble,
  nfc,
  usb
}
alias Transports = Sequence!(Transport);
struct U2F {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort OK = 0;
  enum ushort OTHER_ERROR = 1;
  enum ushort BAD_REQUEST = 2;
  enum ushort CONFIGURATION_UNSUPPORTED = 3;
  enum ushort DEVICE_INELIGIBLE = 4;
  enum ushort TIMEOUT = 5;
  void register(T4)(string appId, scope ref Sequence!(RegisterRequest) registerRequests, scope ref Sequence!(RegisteredKey) registeredKeys, U2FRegisterCallback callback, scope auto ref Optional!(T4) opt_timeoutSeconds) if (isTOrPointer!(T4, int)) {
    U2F_register(this.handle, appId, registerRequests.handle, registeredKeys.handle, callback, !opt_timeoutSeconds.empty, opt_timeoutSeconds.front);
  }
  void register()(string appId, scope ref Sequence!(RegisterRequest) registerRequests, scope ref Sequence!(RegisteredKey) registeredKeys, U2FRegisterCallback callback) {
    U2F_register_0(this.handle, appId, registerRequests.handle, registeredKeys.handle, callback);
  }
  void sign(T4)(string appId, string challenge, scope ref Sequence!(RegisteredKey) registeredKeys, U2FSignCallback callback, scope auto ref Optional!(T4) opt_timeoutSeconds) if (isTOrPointer!(T4, int)) {
    U2F_sign(this.handle, appId, challenge, registeredKeys.handle, callback, !opt_timeoutSeconds.empty, opt_timeoutSeconds.front);
  }
  void sign()(string appId, string challenge, scope ref Sequence!(RegisteredKey) registeredKeys, U2FSignCallback callback) {
    U2F_sign_0(this.handle, appId, challenge, registeredKeys.handle, callback);
  }
}
struct U2FClientData {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return U2FClientData(spasm_add__object());
  }
  void typ()(string typ) {
    Object_Call_string__void(this.handle, "typ", typ);
  }
  string typ()() {
    return Object_Getter__string(this.handle, "typ");
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
}
alias U2FRegisterCallback = void delegate(RegisterResponse);
alias U2FSignCallback = void delegate(SignResponse);


extern (C) void RegisterResponse_errorCode_Set(Handle, ushort);
extern (C) Optional!(ushort) RegisterResponse_errorCode_Get(Handle);
extern (C) void RegisterResponse_errorMessage_Set(Handle, bool, string);
extern (C) void RegisteredKey_transports_Set(Handle, Handle);
extern (C) void RegisteredKey_appId_Set(Handle, bool, string);
extern (C) void SignResponse_errorCode_Set(Handle, ushort);
extern (C) Optional!(ushort) SignResponse_errorCode_Get(Handle);
extern (C) void SignResponse_errorMessage_Set(Handle, bool, string);
extern (C) void U2F_register(Handle, string, Handle, Handle, U2FRegisterCallback, bool, int);
extern (C) void U2F_register_0(Handle, string, Handle, Handle, U2FRegisterCallback);
extern (C) void U2F_sign(Handle, string, string, Handle, U2FSignCallback, bool, int);
extern (C) void U2F_sign_0(Handle, string, string, Handle, U2FSignCallback);