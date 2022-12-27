module libwasm.bindings.DedicatedWorkerGlobalScope;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.MessagePort;
import libwasm.bindings.WorkerGlobalScope;

@safe:
nothrow:

struct DedicatedWorkerGlobalScope {
  nothrow:
  libwasm.bindings.WorkerGlobalScope.WorkerGlobalScope _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .WorkerGlobalScope(h);
  }
  string name()() {
    return Object_Getter__string(this._parent, "name");
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref Sequence!(JsObject) transfer) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Serialize_Object_VarArgCall!void(this._parent, "postMessage", "Handle;Handle", tuple(_handle_message, cast(Handle)transfer.handle));
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
  void close()() {
    Object_Call__void(this._parent, "close");
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
}


