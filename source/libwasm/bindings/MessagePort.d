module libwasm.bindings.MessagePort;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct MessagePort {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
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
  void start()() {
    Object_Call__void(this._parent, "start");
  }
  void close()() {
    Object_Call__void(this._parent, "close");
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
}
struct PostMessageOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PostMessageOptions(libwasm_add__object());
  }
  void transfer()(scope ref Sequence!(JsObject) transfer) {
    Object_Call_Handle__void(this.handle, "transfer", transfer.handle);
  }
  auto transfer()() {
    return Sequence!(JsObject)(Object_Getter__Handle(this.handle, "transfer"));
  }
}


