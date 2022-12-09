module libwasm.bindings.ServiceWorkerRegistration;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.Notification;
import libwasm.bindings.PushManager;
import libwasm.bindings.ServiceWorker;

@safe:
nothrow:

struct ServiceWorkerRegistration {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto installing()() {
    return recastOpt!(ServiceWorker)(Object_Getter__OptionalHandle(this._parent, "installing"));
  }
  auto waiting()() {
    return recastOpt!(ServiceWorker)(Object_Getter__OptionalHandle(this._parent, "waiting"));
  }
  auto active()() {
    return recastOpt!(ServiceWorker)(Object_Getter__OptionalHandle(this._parent, "active"));
  }
  string scope_()() {
    return Object_Getter__string(this._parent, "scope");
  }
  ServiceWorkerUpdateViaCache updateViaCache()() {
    return Object_Getter__int(this._parent, "updateViaCache");
  }
  auto update()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "update"));
  }
  auto unregister()() {
    return JsPromise!(bool)(Object_Getter__Handle(this._parent, "unregister"));
  }
  void onupdatefound(T0)(scope auto ref Optional!(T0) onupdatefound) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onupdatefound", !onupdatefound.empty, onupdatefound.front);
  }
  EventHandler onupdatefound()() {
    return Object_Getter__EventHandler(this._parent, "onupdatefound");
  }
  auto pushManager()() {
    return PushManager(Object_Getter__Handle(this._parent, "pushManager"));
  }
  auto showNotification()(string title, scope ref NotificationOptions options) {
    return JsPromise!(void)(Serialize_Object_VarArgCall!Handle(this._parent, "showNotification", "string;Handle", tuple(title, cast(Handle)options.handle)));
  }
  auto showNotification()(string title) {
    return JsPromise!(void)(Object_Call_string__Handle(this._parent, "showNotification", title));
  }
  auto getNotifications()(scope ref GetNotificationOptions filter) {
    return JsPromise!(Sequence!(Notification))(Object_Call_Handle__Handle(this._parent, "getNotifications", filter.handle));
  }
  auto getNotifications()() {
    return JsPromise!(Sequence!(Notification))(Object_Getter__Handle(this._parent, "getNotifications"));
  }
}
enum ServiceWorkerUpdateViaCache {
  imports,
  all,
  none
}


