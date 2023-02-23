module libwasm.bindings.Client;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Clients;
import libwasm.bindings.Document;
import libwasm.bindings.MessagePort;

@safe:
nothrow:

struct Client {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string url()() {
    return Object_Getter__string(this.handle, "url");
  }
  FrameType frameType()() {
    return Object_Getter__int(this.handle, "frameType");
  }
  ClientType type()() {
    return Object_Getter__int(this.handle, "type");
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref Sequence!(JsObject) transfer) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Serialize_Object_VarArgCall!void(this.handle, "postMessage", "Handle;Handle", tuple(_handle_message, cast(Handle)transfer.handle));
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref PostMessageOptions aOptions) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Serialize_Object_VarArgCall!void(this.handle, "postMessage", "Handle;Handle", tuple(_handle_message, cast(Handle)aOptions.handle));
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this.handle, "postMessage", cast(string) message);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this.handle, "postMessage", cast(long) message);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this.handle, "postMessage", cast(double) message);
      return;
    }
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Object_Call_Handle__void(this.handle, "postMessage", _handle_message);
    dropHandle!(T0)(_handle_message);
  }
}
enum FrameType {
  auxiliary,
  top_level,
  nested,
  none
}
struct WindowClient {
  nothrow:
  libwasm.bindings.Client.Client _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Client(h);
  }
  VisibilityState visibilityState()() {
    return Object_Getter__int(this._parent, "visibilityState");
  }
  bool focused()() {
    return Object_Getter__bool(this._parent, "focused");
  }
  auto focus()() {
    return JsPromise!(WindowClient)(Object_Getter__Handle(this._parent, "focus"));
  }
  auto navigate()(string url) {
    return JsPromise!(WindowClient)(Object_Call_string__Handle(this._parent, "navigate", url));
  }
}


