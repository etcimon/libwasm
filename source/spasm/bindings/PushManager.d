module spasm.bindings.PushManager;

import spasm.types;
import spasm.bindings.PushSubscription;

@safe:
nothrow:

struct PushManager {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto subscribe()(scope ref PushSubscriptionOptionsInit options) {
    return Promise!(PushSubscription)(Object_Call_Handle__Handle(this.handle, "subscribe", options.handle));
  }
  auto subscribe()() {
    return Promise!(PushSubscription)(Object_Getter__Handle(this.handle, "subscribe"));
  }
  auto getSubscription()() {
    return Promise!(Optional!(PushSubscription))(Object_Getter__Handle(this.handle, "getSubscription"));
  }
  auto permissionState()(scope ref PushSubscriptionOptionsInit options) {
    return Promise!(PushPermissionState)(Object_Call_Handle__Handle(this.handle, "permissionState", options.handle));
  }
  auto permissionState()() {
    return Promise!(PushPermissionState)(Object_Getter__Handle(this.handle, "permissionState"));
  }
}
struct PushManagerImpl {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto subscribe()(scope ref PushSubscriptionOptionsInit options) {
    return Promise!(PushSubscription)(Object_Call_Handle__Handle(this.handle, "subscribe", options.handle));
  }
  auto subscribe()() {
    return Promise!(PushSubscription)(Object_Getter__Handle(this.handle, "subscribe"));
  }
  auto getSubscription()() {
    return Promise!(Optional!(PushSubscription))(Object_Getter__Handle(this.handle, "getSubscription"));
  }
  auto permissionState()(scope ref PushSubscriptionOptionsInit options) {
    return Promise!(PushPermissionState)(Object_Call_Handle__Handle(this.handle, "permissionState", options.handle));
  }
  auto permissionState()() {
    return Promise!(PushPermissionState)(Object_Getter__Handle(this.handle, "permissionState"));
  }
}
enum PushPermissionState {
  granted,
  denied,
  prompt
}
struct PushSubscriptionOptionsInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PushSubscriptionOptionsInit(spasm_add__object());
  }
  void applicationServerKey(T0)(scope auto ref Optional!(T0) applicationServerKey) if (isTOrPointer!(T0, SumType!(BufferSource, string))) {
    PushSubscriptionOptionsInit_applicationServerKey_Set(this.handle, !applicationServerKey.empty, *applicationServerKey.frontRef);
  }
  auto applicationServerKey()() {
    return PushSubscriptionOptionsInit_applicationServerKey_Get(this.handle);
  }
}


extern (C) void PushSubscriptionOptionsInit_applicationServerKey_Set(Handle, bool, scope ref SumType!(BufferSource, string));
extern (C) Optional!(SumType!(BufferSource, string)) PushSubscriptionOptionsInit_applicationServerKey_Get(Handle);