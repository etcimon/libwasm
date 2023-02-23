module libwasm.bindings.ServiceWorker;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.AbstractWorker;
import libwasm.bindings.Client;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.ExtendableEvent;
import libwasm.bindings.ExtendableMessageEvent;
import libwasm.bindings.FetchEvent;
import libwasm.bindings.MessagePort;
import libwasm.bindings.Request;
import libwasm.bindings.Response;

@safe:
nothrow:

struct ServiceWorker {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string scriptURL()() {
    return Object_Getter__string(this._parent, "scriptURL");
  }
  ServiceWorkerState state()() {
    return Object_Getter__int(this._parent, "state");
  }
  void onstatechange(T0)(scope auto ref Optional!(T0) onstatechange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onstatechange", !onstatechange.empty, onstatechange.front);
  }
  EventHandler onstatechange()() {
    return Object_Getter__EventHandler(this._parent, "onstatechange");
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref Sequence!(JsObject) transferable) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Serialize_Object_VarArgCall!void(this._parent, "postMessage", "Handle;Handle", tuple(_handle_message, cast(Handle)transferable.handle));
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref PostMessageOptions options) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Serialize_Object_VarArgCall!void(this._parent, "postMessage", "Handle;Handle", tuple(_handle_message, cast(Handle)options.handle));
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
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  auto FetchEvent()(string type, scope ref FetchEventInit eventInitDict) {
    return .FetchEvent(Serialize_Object_VarArgCall!Handle(this._parent, "FetchEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
  }
  auto ExtendableMessageEvent()(string type, scope ref ExtendableMessageEventInit eventInitDict) {
    return .ExtendableMessageEvent(Serialize_Object_VarArgCall!Handle(this._parent, "ExtendableMessageEvent", "string;Handle", tuple(type, cast(Handle)eventInitDict._parent)));
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


