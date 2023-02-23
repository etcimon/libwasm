module libwasm.bindings.PushManager;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.PushSubscription;

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
    return JsPromise!(PushSubscription)(Object_Call_Handle__Handle(this.handle, "subscribe", options.handle));
  }
  auto subscribe()() {
    return JsPromise!(PushSubscription)(Object_Getter__Handle(this.handle, "subscribe"));
  }
  auto getSubscription()() {
    return JsPromise!(Optional!(PushSubscription))(Object_Getter__Handle(this.handle, "getSubscription"));
  }
  auto permissionState()(scope ref PushSubscriptionOptionsInit options) {
    return JsPromise!(PushPermissionState)(Object_Call_Handle__Handle(this.handle, "permissionState", options.handle));
  }
  auto permissionState()() {
    return JsPromise!(PushPermissionState)(Object_Getter__Handle(this.handle, "permissionState"));
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
    return JsPromise!(PushSubscription)(Object_Call_Handle__Handle(this.handle, "subscribe", options.handle));
  }
  auto subscribe()() {
    return JsPromise!(PushSubscription)(Object_Getter__Handle(this.handle, "subscribe"));
  }
  auto getSubscription()() {
    return JsPromise!(Optional!(PushSubscription))(Object_Getter__Handle(this.handle, "getSubscription"));
  }
  auto permissionState()(scope ref PushSubscriptionOptionsInit options) {
    return JsPromise!(PushPermissionState)(Object_Call_Handle__Handle(this.handle, "permissionState", options.handle));
  }
  auto permissionState()() {
    return JsPromise!(PushPermissionState)(Object_Getter__Handle(this.handle, "permissionState"));
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
    return PushSubscriptionOptionsInit(libwasm_add__object());
  }
  void applicationServerKey(T0)(scope auto ref Optional!(T0) applicationServerKey) if (isTOrPointer!(T0, SumType!(BufferSource, string))) {
    Serialize_Object_VarArgCall!void(this.handle, "applicationServerKey", "Optional!SumType!(Handle,string)", tuple(!applicationServerKey.empty, libwasm.sumtype.match!(((ref applicationServerKey.Types[0] v) => 0),((string v) => 1))(applicationServerKey),tuple(libwasm.sumtype.match!(((ref applicationServerKey.Types[0] v) => cast(Handle)v.handle),((string v) => Handle.init))(applicationServerKey),libwasm.sumtype.match!(((ref applicationServerKey.Types[0] v) => string.init),((string v) => v))(applicationServerKey))));
  }
  auto applicationServerKey()() {
    return PushSubscriptionOptionsInit_applicationServerKey_Get(this.handle);
  }
}


extern (C) Optional!(SumType!(BufferSource, string)) PushSubscriptionOptionsInit_applicationServerKey_Get(Handle);