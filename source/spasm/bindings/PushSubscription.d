module spasm.bindings.PushSubscription;

import spasm.types;
import spasm.bindings.PushSubscriptionOptions;

@safe:
nothrow:

enum PushEncryptionKeyName {
  p256dh,
  auth
}
struct PushSubscription {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string endpoint()() {
    return Object_Getter__string(this.handle, "endpoint");
  }
  auto options()() {
    return PushSubscriptionOptions(Object_Getter__Handle(this.handle, "options"));
  }
  auto getKey()(PushEncryptionKeyName name) {
    return PushSubscription_getKey(this.handle, name);
  }
  auto unsubscribe()() {
    return Promise!(bool)(Object_Getter__Handle(this.handle, "unsubscribe"));
  }
  auto toJSON()() {
    return PushSubscriptionJSON(Object_Getter__Handle(this.handle, "toJSON"));
  }
}
struct PushSubscriptionInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PushSubscriptionInit(spasm_add__object());
  }
  void endpoint()(string endpoint) {
    Object_Call_string__void(this.handle, "endpoint", endpoint);
  }
  string endpoint()() {
    return Object_Getter__string(this.handle, "endpoint");
  }
  void scope_()(string scope_) {
    Object_Call_string__void(this.handle, "scope", scope_);
  }
  string scope_()() {
    return Object_Getter__string(this.handle, "scope");
  }
  void p256dhKey(T0)(scope auto ref Optional!(T0) p256dhKey) if (isTOrPointer!(T0, ArrayBuffer)) {
    PushSubscriptionInit_p256dhKey_Set(this.handle, !p256dhKey.empty, p256dhKey.front.handle);
  }
  auto p256dhKey()() {
    return Object_Getter__OptionalHandle(this.handle, "p256dhKey");
  }
  void authSecret(T0)(scope auto ref Optional!(T0) authSecret) if (isTOrPointer!(T0, ArrayBuffer)) {
    PushSubscriptionInit_authSecret_Set(this.handle, !authSecret.empty, authSecret.front.handle);
  }
  auto authSecret()() {
    return Object_Getter__OptionalHandle(this.handle, "authSecret");
  }
  void appServerKey(T0)(scope auto ref Optional!(T0) appServerKey) if (isTOrPointer!(T0, BufferSource)) {
    PushSubscriptionInit_appServerKey_Set(this.handle, !appServerKey.empty, appServerKey.front.handle);
  }
  auto appServerKey()() {
    return Object_Getter__OptionalHandle(this.handle, "appServerKey");
  }
}
struct PushSubscriptionJSON {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PushSubscriptionJSON(spasm_add__object());
  }
  void endpoint()(string endpoint) {
    Object_Call_string__void(this.handle, "endpoint", endpoint);
  }
  string endpoint()() {
    return Object_Getter__string(this.handle, "endpoint");
  }
  void keys()(scope ref PushSubscriptionKeys keys) {
    Object_Call_Handle__void(this.handle, "keys", keys.handle);
  }
  auto keys()() {
    return PushSubscriptionKeys(Object_Getter__Handle(this.handle, "keys"));
  }
}
struct PushSubscriptionKeys {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PushSubscriptionKeys(spasm_add__object());
  }
  void p256dh()(string p256dh) {
    Object_Call_string__void(this.handle, "p256dh", p256dh);
  }
  string p256dh()() {
    return Object_Getter__string(this.handle, "p256dh");
  }
  void auth()(string auth) {
    Object_Call_string__void(this.handle, "auth", auth);
  }
  string auth()() {
    return Object_Getter__string(this.handle, "auth");
  }
}


extern (C) Optional!(ArrayBuffer) PushSubscription_getKey(Handle, PushEncryptionKeyName);
extern (C) void PushSubscriptionInit_p256dhKey_Set(Handle, bool, Handle);
extern (C) void PushSubscriptionInit_authSecret_Set(Handle, bool, Handle);
extern (C) void PushSubscriptionInit_appServerKey_Set(Handle, bool, Handle);