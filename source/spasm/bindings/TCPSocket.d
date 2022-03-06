module spasm.bindings.TCPSocket;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.TCPServerSocket;

@safe:
nothrow:

struct LegacyMozTCPSocket {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto open()(string host, ushort port, scope ref SocketOptions options) {
    return TCPSocket(LegacyMozTCPSocket_open(this.handle, host, port, options.handle));
  }
  auto open()(string host, ushort port) {
    return TCPSocket(LegacyMozTCPSocket_open_0(this.handle, host, port));
  }
  auto listen()(ushort port, scope ref ServerSocketOptions options, ushort backlog /* = 0 */) {
    return TCPServerSocket(LegacyMozTCPSocket_listen(this.handle, port, options.handle, backlog));
  }
  auto listen()(ushort port, scope ref ServerSocketOptions options) {
    return TCPServerSocket(LegacyMozTCPSocket_listen_0(this.handle, port, options.handle));
  }
  auto listen()(ushort port) {
    return TCPServerSocket(LegacyMozTCPSocket_listen_1(this.handle, port));
  }
}
struct SocketOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return SocketOptions(spasm_add__object());
  }
  void useSecureTransport()(bool useSecureTransport) {
    Object_Call_bool__void(this.handle, "useSecureTransport", useSecureTransport);
  }
  bool useSecureTransport()() {
    return Object_Getter__bool(this.handle, "useSecureTransport");
  }
  void binaryType()(TCPSocketBinaryType binaryType) {
    SocketOptions_binaryType_Set(this.handle, binaryType);
  }
  TCPSocketBinaryType binaryType()() {
    return SocketOptions_binaryType_Get(this.handle);
  }
}
enum TCPReadyState {
  connecting,
  open,
  closing,
  closed
}
struct TCPSocket {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  void upgradeToSecure()() {
    Object_Call__void(this._parent, "upgradeToSecure");
  }
  string host()() {
    return Object_Getter__string(this._parent, "host");
  }
  ushort port()() {
    return Object_Getter__ushort(this._parent, "port");
  }
  bool ssl()() {
    return Object_Getter__bool(this._parent, "ssl");
  }
  uint bufferedAmount()() {
    return Object_Getter__uint(this._parent, "bufferedAmount");
  }
  void suspend()() {
    Object_Call__void(this._parent, "suspend");
  }
  void resume()() {
    Object_Call__void(this._parent, "resume");
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
  void closeImmediately()() {
    Object_Call__void(this._parent, "closeImmediately");
  }
  bool send()(string data) {
    return Object_Call_string__bool(this._parent, "send", data);
  }
  bool send()(scope ref ArrayBuffer data, uint byteOffset /* = 0 */, uint byteLength) {
    return TCPSocket_send__Handle_uint_uint(this._parent, data.handle, byteOffset, byteLength);
  }
  bool send()(scope ref ArrayBuffer data, uint byteOffset /* = 0 */) {
    return TCPSocket_send_0(this._parent, data.handle, byteOffset);
  }
  bool send()(scope ref ArrayBuffer data) {
    return TCPSocket_send_1(this._parent, data.handle);
  }
  TCPReadyState readyState()() {
    return TCPSocket_readyState_Get(this._parent);
  }
  TCPSocketBinaryType binaryType()() {
    return TCPSocket_binaryType_Get(this._parent);
  }
  void onopen(T0)(scope auto ref Optional!(T0) onopen) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onopen", !onopen.empty, onopen.front);
  }
  EventHandler onopen()() {
    return Object_Getter__EventHandler(this._parent, "onopen");
  }
  void ondrain(T0)(scope auto ref Optional!(T0) ondrain) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondrain", !ondrain.empty, ondrain.front);
  }
  EventHandler ondrain()() {
    return Object_Getter__EventHandler(this._parent, "ondrain");
  }
  void ondata(T0)(scope auto ref Optional!(T0) ondata) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondata", !ondata.empty, ondata.front);
  }
  EventHandler ondata()() {
    return Object_Getter__EventHandler(this._parent, "ondata");
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
}
enum TCPSocketBinaryType {
  arraybuffer,
  string
}


extern (C) Handle LegacyMozTCPSocket_open(Handle, string, ushort, Handle);
extern (C) Handle LegacyMozTCPSocket_open_0(Handle, string, ushort);
extern (C) Handle LegacyMozTCPSocket_listen(Handle, ushort, Handle, ushort);
extern (C) Handle LegacyMozTCPSocket_listen_0(Handle, ushort, Handle);
extern (C) Handle LegacyMozTCPSocket_listen_1(Handle, ushort);
extern (C) void SocketOptions_binaryType_Set(Handle, TCPSocketBinaryType);
extern (C) TCPSocketBinaryType SocketOptions_binaryType_Get(Handle);
extern (C) bool TCPSocket_send__Handle_uint_uint(Handle, Handle, uint, uint);
extern (C) bool TCPSocket_send_0(Handle, Handle, uint);
extern (C) bool TCPSocket_send_1(Handle, Handle);
extern (C) TCPReadyState TCPSocket_readyState_Get(Handle);
extern (C) TCPSocketBinaryType TCPSocket_binaryType_Get(Handle);