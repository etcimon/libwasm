module spasm.bindings.ServiceWorkerContainer;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.ServiceWorker;
import spasm.bindings.ServiceWorkerRegistration;

@safe:
nothrow:

struct RegistrationOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return RegistrationOptions(spasm_add__object());
  }
  void scope_()(string scope_) {
    Object_Call_string__void(this.handle, "scope", scope_);
  }
  string scope_()() {
    return Object_Getter__string(this.handle, "scope");
  }
  void updateViaCache()(ServiceWorkerUpdateViaCache updateViaCache) {
    RegistrationOptions_updateViaCache_Set(this.handle, updateViaCache);
  }
  ServiceWorkerUpdateViaCache updateViaCache()() {
    return RegistrationOptions_updateViaCache_Get(this.handle);
  }
}
struct ServiceWorkerContainer {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto controller()() {
    return Object_Getter__OptionalHandle(this._parent, "controller");
  }
  auto ready()() {
    return Promise!(ServiceWorkerRegistration)(Object_Getter__Handle(this._parent, "ready"));
  }
  auto register()(string scriptURL, scope ref RegistrationOptions options) {
    return Promise!(ServiceWorkerRegistration)(ServiceWorkerContainer_register(this._parent, scriptURL, options.handle));
  }
  auto register()(string scriptURL) {
    return Promise!(ServiceWorkerRegistration)(Object_Call_string__Handle(this._parent, "register", scriptURL));
  }
  auto getRegistration()(string documentURL /* = "" */) {
    return Promise!(Any)(Object_Call_string__Handle(this._parent, "getRegistration", documentURL));
  }
  auto getRegistration()() {
    return Promise!(Any)(Object_Getter__Handle(this._parent, "getRegistration"));
  }
  auto getRegistrations()() {
    return Promise!(Sequence!(ServiceWorkerRegistration))(Object_Getter__Handle(this._parent, "getRegistrations"));
  }
  void startMessages()() {
    Object_Call__void(this._parent, "startMessages");
  }
  void oncontrollerchange(T0)(scope auto ref Optional!(T0) oncontrollerchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "oncontrollerchange", !oncontrollerchange.empty, oncontrollerchange.front);
  }
  EventHandler oncontrollerchange()() {
    return Object_Getter__EventHandler(this._parent, "oncontrollerchange");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmessage", !onmessage.empty, onmessage.front);
  }
  EventHandler onmessage()() {
    return Object_Getter__EventHandler(this._parent, "onmessage");
  }
  void onmessageerror(T0)(scope auto ref Optional!(T0) onmessageerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmessageerror", !onmessageerror.empty, onmessageerror.front);
  }
  EventHandler onmessageerror()() {
    return Object_Getter__EventHandler(this._parent, "onmessageerror");
  }
  string getScopeForUrl()(string url) {
    return Object_Call_string__string(this._parent, "getScopeForUrl", url);
  }
}


extern (C) void RegistrationOptions_updateViaCache_Set(Handle, ServiceWorkerUpdateViaCache);
extern (C) ServiceWorkerUpdateViaCache RegistrationOptions_updateViaCache_Get(Handle);
extern (C) Handle ServiceWorkerContainer_register(Handle, string, Handle);