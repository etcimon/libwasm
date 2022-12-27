module libwasm.bindings.PushSubscription;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.PushSubscriptionOptions;

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
    return recastOpt!(ArrayBuffer)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "getKey", "Enum", tuple(name)));
  }
  auto unsubscribe()() {
    return JsPromise!(bool)(Object_Getter__Handle(this.handle, "unsubscribe"));
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
    return PushSubscriptionInit(libwasm_add__object());
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
    Serialize_Object_VarArgCall!void(this.handle, "p256dhKey", "Optional!Handle", tuple(!p256dhKey.empty, cast(Handle)p256dhKey.front.handle));
  }
  auto p256dhKey()() {
    return recastOpt!(ArrayBuffer)(Object_Getter__OptionalHandle(this.handle, "p256dhKey"));
  }
  void authSecret(T0)(scope auto ref Optional!(T0) authSecret) if (isTOrPointer!(T0, ArrayBuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "authSecret", "Optional!Handle", tuple(!authSecret.empty, cast(Handle)authSecret.front.handle));
  }
  auto authSecret()() {
    return recastOpt!(ArrayBuffer)(Object_Getter__OptionalHandle(this.handle, "authSecret"));
  }
  void appServerKey(T0)(scope auto ref Optional!(T0) appServerKey) if (isTOrPointer!(T0, BufferSource)) {
    Serialize_Object_VarArgCall!void(this.handle, "appServerKey", "Optional!Handle", tuple(!appServerKey.empty, cast(Handle)appServerKey.front.handle));
  }
  auto appServerKey()() {
    return recastOpt!(BufferSource)(Object_Getter__OptionalHandle(this.handle, "appServerKey"));
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
    return PushSubscriptionJSON(libwasm_add__object());
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
    return PushSubscriptionKeys(libwasm_add__object());
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


