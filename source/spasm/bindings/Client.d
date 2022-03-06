module spasm.bindings.Client;

import spasm.types;
import spasm.bindings.Clients;
import spasm.bindings.Document;
import spasm.bindings.MessagePort;

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
    return Client_frameType_Get(this.handle);
  }
  ClientType type()() {
    return Client_type_Get(this.handle);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref Sequence!(JsObject) transfer) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Client_postMessage__Handle_sequence(this.handle, _handle_message, transfer.handle);
    dropHandle!(T0)(_handle_message);
  }
  void postMessage(T0)(scope auto ref T0 message, scope ref PostMessageOptions aOptions) {
    // Any
    Handle _handle_message = getOrCreateHandle(message);
    Client_postMessage__Handle_Handle(this.handle, _handle_message, aOptions.handle);
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
  spasm.bindings.Client.Client _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Client(h);
  }
  VisibilityState visibilityState()() {
    return WindowClient_visibilityState_Get(this._parent);
  }
  bool focused()() {
    return Object_Getter__bool(this._parent, "focused");
  }
  auto focus()() {
    return Promise!(WindowClient)(Object_Getter__Handle(this._parent, "focus"));
  }
  auto navigate()(string url) {
    return Promise!(WindowClient)(Object_Call_string__Handle(this._parent, "navigate", url));
  }
}


extern (C) FrameType Client_frameType_Get(Handle);
extern (C) ClientType Client_type_Get(Handle);
extern (C) void Client_postMessage__Handle_sequence(Handle, Handle, Handle);
extern (C) void Client_postMessage__Handle_Handle(Handle, Handle, Handle);
extern (C) VisibilityState WindowClient_visibilityState_Get(Handle);