module spasm.bindings.ServiceWorker;

import spasm.types;
import spasm.bindings.AbstractWorker;
import spasm.bindings.Client;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.ExtendableEvent;
import spasm.bindings.ExtendableMessageEvent;
import spasm.bindings.FetchEvent;
import spasm.bindings.MessagePort;
import spasm.bindings.Request;
import spasm.bindings.Response;

@safe:
nothrow:

struct ServiceWorker {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string scriptURL()() {
    return Object_Getter__string(this._parent, "scriptURL");
  }
  ServiceWorkerState state()() {
    return ServiceWorker_state_Get(this._parent);
  }
  void onstatechange(T0)(scope auto ref Optional!(T0) onstatechange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onstatechange", !onstatechange.empty, onstatechange.front);
  }
  EventHandler onstatechange()() {
    return Object_Getter__EventHandler(this._parent, "onstatechange");
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref Sequence!(JsObject) transferable) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    ServiceWorker_postMessage__Handle_sequence(this._parent, _handle_message, transferable.handle);
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref PostMessageOptions options) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    ServiceWorker_postMessage__Handle_Handle(this._parent, _handle_message, options.handle);
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this._parent, "postMessage", cast(string) message);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this._parent, "postMessage", cast(long) message);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this._parent, "postMessage", cast(double) message);
      return;
    }
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Object_Call_Handle__void(this._parent, "postMessage", _handle_message);
    dropHandle!(T0)(_handle_message);
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  auto FetchEvent()(string type, scope ref FetchEventInit eventInitDict) {
    return .FetchEvent(ServiceWorker_FetchEvent(this._parent, type, eventInitDict._parent));
  }
  auto ExtendableMessageEvent()(string type, scope ref ExtendableMessageEventInit eventInitDict) {
    return .ExtendableMessageEvent(ServiceWorker_ExtendableMessageEvent(this._parent, type, eventInitDict._parent));
  }
}
enum ServiceWorkerState {
  parsed,
  installing,
  installed,
  activating,
  activated,
  redundant
}


extern (C) ServiceWorkerState ServiceWorker_state_Get(Handle);
extern (C) void ServiceWorker_postMessage__Handle_sequence(Handle, Handle, Handle);
extern (C) void ServiceWorker_postMessage__Handle_Handle(Handle, Handle, Handle);
extern (C) Handle ServiceWorker_FetchEvent(Handle, string, Handle);
extern (C) Handle ServiceWorker_ExtendableMessageEvent(Handle, string, Handle);