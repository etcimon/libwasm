module spasm.bindings.WebSocket;

import spasm.types;
import spasm.bindings.Blob;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;

@safe:
nothrow:

enum BinaryType {
  blob,
  arraybuffer
}
struct WebSocket {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string url()() {
    return Object_Getter__string(this._parent, "url");
  }
  enum ushort CONNECTING = 0;
  enum ushort OPEN = 1;
  enum ushort CLOSING = 2;
  enum ushort CLOSED = 3;
  ushort readyState()() {
    return Object_Getter__ushort(this._parent, "readyState");
  }
  uint bufferedAmount()() {
    return Object_Getter__uint(this._parent, "bufferedAmount");
  }
  void onopen(T0)(scope auto ref Optional!(T0) onopen) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onopen", !onopen.empty, onopen.front);
  }
  EventHandler onopen()() {
    return Object_Getter__EventHandler(this._parent, "onopen");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void onclose(T0)(scope auto ref Optional!(T0) onclose) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onclose", !onclose.empty, onclose.front);
  }
  EventHandler onclose()() {
    return Object_Getter__EventHandler(this._parent, "onclose");
  }
  string extensions()() {
    return Object_Getter__string(this._parent, "extensions");
  }
  string protocol()() {
    return Object_Getter__string(this._parent, "protocol");
  }
  void close()(ushort code, string reason) {
    WebSocket_close(this._parent, code, reason);
  }
  void close()(ushort code) {
    WebSocket_close_0(this._parent, code);
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
  void binaryType()(BinaryType binaryType) {
    WebSocket_binaryType_Set(this._parent, binaryType);
  }
  BinaryType binaryType()() {
    return WebSocket_binaryType_Get(this._parent);
  }
  void send()(string data) {
    Object_Call_string__void(this._parent, "send", data);
  }
  void send()(scope ref Blob data) {
    Object_Call_Handle__void(this._parent, "send", data.handle);
  }
  void send()(scope ref ArrayBuffer data) {
    Object_Call_Handle__void(this._parent, "send", data.handle);
  }
  void send()(scope ref ArrayBufferView data) {
    Object_Call_Handle__void(this._parent, "send", data.handle);
  }
  auto createServerWebSocket()(string url, scope ref Sequence!(string) protocols, scope ref nsITransportProvider transportProvider, string negotiatedExtensions) {
    return WebSocket(WebSocket_createServerWebSocket(this._parent, url, protocols.handle, transportProvider.handle, negotiatedExtensions));
  }
}


extern (C) void WebSocket_close(Handle, ushort, string);
extern (C) void WebSocket_close_0(Handle, ushort);
extern (C) void WebSocket_binaryType_Set(Handle, BinaryType);
extern (C) BinaryType WebSocket_binaryType_Get(Handle);
extern (C) Handle WebSocket_createServerWebSocket(Handle, string, Handle, Handle, string);