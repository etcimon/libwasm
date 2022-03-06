module spasm.bindings.CredentialManagement;

import spasm.types;
import spasm.bindings.AbortSignal;
import spasm.bindings.WebAuthentication;

@safe:
nothrow:

struct Credential {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
}
struct CredentialCreationOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return CredentialCreationOptions(spasm_add__object());
  }
  void publicKey()(scope ref PublicKeyCredentialCreationOptions publicKey) {
    Object_Call_Handle__void(this.handle, "publicKey", publicKey.handle);
  }
  auto publicKey()() {
    return PublicKeyCredentialCreationOptions(Object_Getter__Handle(this.handle, "publicKey"));
  }
  void signal()(scope ref AbortSignal signal) {
    Object_Call_Handle__void(this.handle, "signal", signal._parent);
  }
  auto signal()() {
    return AbortSignal(Object_Getter__Handle(this.handle, "signal"));
  }
}
struct CredentialRequestOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return CredentialRequestOptions(spasm_add__object());
  }
  void publicKey()(scope ref PublicKeyCredentialRequestOptions publicKey) {
    Object_Call_Handle__void(this.handle, "publicKey", publicKey.handle);
  }
  auto publicKey()() {
    return PublicKeyCredentialRequestOptions(Object_Getter__Handle(this.handle, "publicKey"));
  }
  void signal()(scope ref AbortSignal signal) {
    Object_Call_Handle__void(this.handle, "signal", signal._parent);
  }
  auto signal()() {
    return AbortSignal(Object_Getter__Handle(this.handle, "signal"));
  }
}
struct CredentialsContainer {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto get()(scope ref CredentialRequestOptions options) {
    return Promise!(Optional!(Credential))(Object_Call_Handle__Handle(this.handle, "get", options.handle));
  }
  auto get()() {
    return Promise!(Optional!(Credential))(Object_Getter__Handle(this.handle, "get"));
  }
  auto create()(scope ref CredentialCreationOptions options) {
    return Promise!(Optional!(Credential))(Object_Call_Handle__Handle(this.handle, "create", options.handle));
  }
  auto create()() {
    return Promise!(Optional!(Credential))(Object_Getter__Handle(this.handle, "create"));
  }
  auto store()(scope ref Credential credential) {
    return Promise!(Credential)(Object_Call_Handle__Handle(this.handle, "store", credential.handle));
  }
  auto preventSilentAccess()() {
    return Promise!(void)(Object_Getter__Handle(this.handle, "preventSilentAccess"));
  }
}


