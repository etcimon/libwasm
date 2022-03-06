module spasm.bindings.ServiceWorkerRegistration;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.Notification;
import spasm.bindings.PushManager;
import spasm.bindings.ServiceWorker;

@safe:
nothrow:

struct ServiceWorkerRegistration {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto installing()() {
    return Object_Getter__OptionalHandle(this._parent, "installing");
  }
  auto waiting()() {
    return Object_Getter__OptionalHandle(this._parent, "waiting");
  }
  auto active()() {
    return Object_Getter__OptionalHandle(this._parent, "active");
  }
  string scope_()() {
    return Object_Getter__string(this._parent, "scope");
  }
  ServiceWorkerUpdateViaCache updateViaCache()() {
    return ServiceWorkerRegistration_updateViaCache_Get(this._parent);
  }
  auto update()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "update"));
  }
  auto unregister()() {
    return Promise!(bool)(Object_Getter__Handle(this._parent, "unregister"));
  }
  void onupdatefound(T0)(scope auto ref Optional!(T0) onupdatefound) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onupdatefound", !onupdatefound.empty, onupdatefound.front);
  }
  EventHandler onupdatefound()() {
    return Object_Getter__EventHandler(this._parent, "onupdatefound");
  }
  auto pushManager()() {
    return PushManager(Object_Getter__Handle(this._parent, "pushManager"));
  }
  auto showNotification()(string title, scope ref NotificationOptions options) {
    return Promise!(void)(ServiceWorkerRegistration_showNotification(this._parent, title, options.handle));
  }
  auto showNotification()(string title) {
    return Promise!(void)(Object_Call_string__Handle(this._parent, "showNotification", title));
  }
  auto getNotifications()(scope ref GetNotificationOptions filter) {
    return Promise!(Sequence!(Notification))(Object_Call_Handle__Handle(this._parent, "getNotifications", filter.handle));
  }
  auto getNotifications()() {
    return Promise!(Sequence!(Notification))(Object_Getter__Handle(this._parent, "getNotifications"));
  }
}
enum ServiceWorkerUpdateViaCache {
  imports,
  all,
  none
}


extern (C) ServiceWorkerUpdateViaCache ServiceWorkerRegistration_updateViaCache_Get(Handle);
extern (C) Handle ServiceWorkerRegistration_showNotification(Handle, string, Handle);