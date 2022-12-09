module libwasm.bindings.ServiceWorkerGlobalScope;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Clients;
import libwasm.bindings.EventHandler;
import libwasm.bindings.ServiceWorkerRegistration;
import libwasm.bindings.WorkerGlobalScope;

@safe:
nothrow:

struct ServiceWorkerGlobalScope {
  nothrow:
  libwasm.bindings.WorkerGlobalScope.WorkerGlobalScope _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .WorkerGlobalScope(h);
  }
  auto clients()() {
    return Clients(Object_Getter__Handle(this._parent, "clients"));
  }
  auto registration()() {
    return ServiceWorkerRegistration(Object_Getter__Handle(this._parent, "registration"));
  }
  auto skipWaiting()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "skipWaiting"));
  }
  void oninstall(T0)(scope auto ref Optional!(T0) oninstall) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "oninstall", !oninstall.empty, oninstall.front);
  }
  EventHandler oninstall()() {
    return Object_Getter__EventHandler(this._parent, "oninstall");
  }
  void onactivate(T0)(scope auto ref Optional!(T0) onactivate) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onactivate", !onactivate.empty, onactivate.front);
  }
  EventHandler onactivate()() {
    return Object_Getter__EventHandler(this._parent, "onactivate");
  }
  void onfetch(T0)(scope auto ref Optional!(T0) onfetch) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onfetch", !onfetch.empty, onfetch.front);
  }
  EventHandler onfetch()() {
    return Object_Getter__EventHandler(this._parent, "onfetch");
  }
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onmessage", !onmessage.empty, onmessage.front);
  }
  EventHandler onmessage()() {
    return Object_Getter__EventHandler(this._parent, "onmessage");
  }
  void onmessageerror(T0)(scope auto ref Optional!(T0) onmessageerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onmessageerror", !onmessageerror.empty, onmessageerror.front);
  }
  EventHandler onmessageerror()() {
    return Object_Getter__EventHandler(this._parent, "onmessageerror");
  }
  void onpush(T0)(scope auto ref Optional!(T0) onpush) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onpush", !onpush.empty, onpush.front);
  }
  EventHandler onpush()() {
    return Object_Getter__EventHandler(this._parent, "onpush");
  }
  void onpushsubscriptionchange(T0)(scope auto ref Optional!(T0) onpushsubscriptionchange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onpushsubscriptionchange", !onpushsubscriptionchange.empty, onpushsubscriptionchange.front);
  }
  EventHandler onpushsubscriptionchange()() {
    return Object_Getter__EventHandler(this._parent, "onpushsubscriptionchange");
  }
  void onnotificationclick(T0)(scope auto ref Optional!(T0) onnotificationclick) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onnotificationclick", !onnotificationclick.empty, onnotificationclick.front);
  }
  EventHandler onnotificationclick()() {
    return Object_Getter__EventHandler(this._parent, "onnotificationclick");
  }
  void onnotificationclose(T0)(scope auto ref Optional!(T0) onnotificationclose) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onnotificationclose", !onnotificationclose.empty, onnotificationclose.front);
  }
  EventHandler onnotificationclose()() {
    return Object_Getter__EventHandler(this._parent, "onnotificationclose");
  }
}


