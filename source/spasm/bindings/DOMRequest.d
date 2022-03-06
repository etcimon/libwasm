module spasm.bindings.DOMRequest;

import spasm.types;
import spasm.bindings.DOMException;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.Promise;

@safe:
nothrow:

struct DOMRequest {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto then(T0, T1)(scope auto ref Optional!(T0) fulfillCallback /* = no!(AnyCallback) */, scope auto ref Optional!(T1) rejectCallback /* = no!(AnyCallback) */) if (isTOrPointer!(T0, AnyCallback) && isTOrPointer!(T1, AnyCallback)) {
    return Any(DOMRequest_then(this._parent, !fulfillCallback.empty, fulfillCallback.front, !rejectCallback.empty, rejectCallback.front));
  }
  auto then(T0)(scope auto ref Optional!(T0) fulfillCallback /* = no!(AnyCallback) */) if (isTOrPointer!(T0, AnyCallback)) {
    return Any(DOMRequest_then_0(this._parent, !fulfillCallback.empty, fulfillCallback.front));
  }
  auto then()() {
    return Any(Object_Getter__Handle(this._parent, "then"));
  }
  void fireDetailedError()(scope ref DOMException aError) {
    Object_Call_Handle__void(this._parent, "fireDetailedError", aError.handle);
  }
  DOMRequestReadyState readyState()() {
    return DOMRequestShared_readyState_Get(this._parent);
  }
  auto result()() {
    return Any(Object_Getter__Handle(this._parent, "result"));
  }
  auto error()() {
    return Object_Getter__OptionalHandle(this._parent, "error");
  }
  void onsuccess(T0)(scope auto ref Optional!(T0) onsuccess) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onsuccess", !onsuccess.empty, onsuccess.front);
  }
  EventHandler onsuccess()() {
    return Object_Getter__EventHandler(this._parent, "onsuccess");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
}
enum DOMRequestReadyState {
  pending,
  done
}
struct DOMRequestShared {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  DOMRequestReadyState readyState()() {
    return DOMRequestShared_readyState_Get(this.handle);
  }
  auto result()() {
    return Any(Object_Getter__Handle(this.handle, "result"));
  }
  auto error()() {
    return Object_Getter__OptionalHandle(this.handle, "error");
  }
  void onsuccess(T0)(scope auto ref Optional!(T0) onsuccess) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this.handle, "onsuccess", !onsuccess.empty, onsuccess.front);
  }
  EventHandler onsuccess()() {
    return Object_Getter__EventHandler(this.handle, "onsuccess");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this.handle, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this.handle, "onerror");
  }
}


extern (C) Handle DOMRequest_then(Handle, bool, AnyCallback, bool, AnyCallback);
extern (C) Handle DOMRequest_then_0(Handle, bool, AnyCallback);
extern (C) DOMRequestReadyState DOMRequestShared_readyState_Get(Handle);