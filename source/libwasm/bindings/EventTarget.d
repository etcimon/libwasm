module libwasm.bindings.EventTarget;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventListener;

@safe:
nothrow:

struct AddEventListenerOptions {
  nothrow:
  libwasm.bindings.EventTarget.EventListenerOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventListenerOptions(h);
  }
  static auto create() {
    return AddEventListenerOptions(libwasm_add__object());
  }
  void passive()(bool passive) {
    Object_Call_bool__void(this._parent, "passive", passive);
  }
  bool passive()() {
    return Object_Getter__bool(this._parent, "passive");
  }
  void once()(bool once) {
    Object_Call_bool__void(this._parent, "once", once);
  }
  bool once()() {
    return Object_Getter__bool(this._parent, "once");
  }
  void wantUntrusted()(bool wantUntrusted) {
    Object_Call_bool__void(this._parent, "wantUntrusted", wantUntrusted);
  }
  bool wantUntrusted()() {
    return Object_Getter__bool(this._parent, "wantUntrusted");
  }
}
struct EventListenerOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return EventListenerOptions(libwasm_add__object());
  }
  void capture()(bool capture) {
    Object_Call_bool__void(this.handle, "capture", capture);
  }
  bool capture()() {
    return Object_Getter__bool(this.handle, "capture");
  }
  void mozSystemGroup()(bool mozSystemGroup) {
    Object_Call_bool__void(this.handle, "mozSystemGroup", mozSystemGroup);
  }
  bool mozSystemGroup()() {
    return Object_Getter__bool(this.handle, "mozSystemGroup");
  }
}
struct EventTarget {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void addEventListener(T1, T3)(string type, scope auto ref Optional!(T1) listener, scope ref SumType!(AddEventListenerOptions, bool) options, scope auto ref Optional!(T3) wantsUntrusted /* = no!(bool) */) if (isTOrPointer!(T1, EventListener) && isTOrPointer!(T3, bool)) {
    EventTarget_addEventListener(this.handle, type, !listener.empty, listener.front.handle, options, !wantsUntrusted.empty, wantsUntrusted.front);
  }
  void addEventListener(T1)(string type, scope auto ref Optional!(T1) listener, scope ref SumType!(AddEventListenerOptions, bool) options) if (isTOrPointer!(T1, EventListener)) {
    EventTarget_addEventListener_0(this.handle, type, !listener.empty, listener.front.handle, options);
  }
  void addEventListener(T1)(string type, scope auto ref Optional!(T1) listener) if (isTOrPointer!(T1, EventListener)) {
    EventTarget_addEventListener_1(this.handle, type, !listener.empty, listener.front.handle);
  }
  void removeEventListener(T1)(string type, scope auto ref Optional!(T1) listener, scope ref SumType!(EventListenerOptions, bool) options) if (isTOrPointer!(T1, EventListener)) {
    EventTarget_removeEventListener(this.handle, type, !listener.empty, listener.front.handle, options);
  }
  void removeEventListener(T1)(string type, scope auto ref Optional!(T1) listener) if (isTOrPointer!(T1, EventListener)) {
    EventTarget_removeEventListener_0(this.handle, type, !listener.empty, listener.front.handle);
  }
  bool dispatchEvent()(scope ref Event event) {
    return Serialize_Object_VarArgCall!bool(this.handle, "dispatchEvent", "Handle", tuple(cast(Handle)event.handle));
  }
  void setEventHandler(T1)(string type, scope auto ref Optional!(T1) handler) if (isTOrPointer!(T1, EventHandlerNonNull)) {
    EventTarget_setEventHandler(this.handle, type, !handler.empty, handler.front);
  }
  EventHandler getEventHandler()(string type) {
    return EventTarget_getEventHandler(this.handle, type);
  }
  auto ownerGlobal()() {
    return recastOpt!(WindowProxy)(Object_Getter__OptionalHandle(this.handle, "ownerGlobal"));
  }
}


extern (C) void EventTarget_addEventListener(Handle, string, bool, Handle, scope ref SumType!(AddEventListenerOptions, bool), bool, bool);
extern (C) void EventTarget_addEventListener_0(Handle, string, bool, Handle, scope ref SumType!(AddEventListenerOptions, bool));
extern (C) void EventTarget_addEventListener_1(Handle, string, bool, Handle);
extern (C) void EventTarget_removeEventListener(Handle, string, bool, Handle, scope ref SumType!(EventListenerOptions, bool));
extern (C) void EventTarget_removeEventListener_0(Handle, string, bool, Handle);
extern (C) void EventTarget_setEventHandler(Handle, string, bool, EventHandlerNonNull);
extern (C) EventHandler EventTarget_getEventHandler(Handle, string);