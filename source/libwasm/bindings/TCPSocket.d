module libwasm.bindings.TCPSocket;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.TCPServerSocket;

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
    return TCPSocket(Serialize_Object_VarArgCall!Handle(this.handle, "open", "string;ushort;Handle", tuple(host, port, cast(Handle)options.handle)));
  }
  auto open()(string host, ushort port) {
    return TCPSocket(Serialize_Object_VarArgCall!Handle(this.handle, "open", "string;ushort", tuple(host, port)));
  }
  auto listen()(ushort port, scope ref ServerSocketOptions options, ushort backlog /* = 0 */) {
    return TCPServerSocket(Serialize_Object_VarArgCall!Handle(this.handle, "listen", "ushort;Handle;ushort", tuple(port, cast(Handle)options.handle, backlog)));
  }
  auto listen()(ushort port, scope ref ServerSocketOptions options) {
    return TCPServerSocket(Serialize_Object_VarArgCall!Handle(this.handle, "listen", "ushort;Handle", tuple(port, cast(Handle)options.handle)));
  }
  auto listen()(ushort port) {
    return TCPServerSocket(Serialize_Object_VarArgCall!Handle(this.handle, "listen", "ushort", tuple(port)));
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
    return SocketOptions(libwasm_add__object());
  }
  void useSecureTransport()(bool useSecureTransport) {
    Object_Call_bool__void(this.handle, "useSecureTransport", useSecureTransport);
  }
  bool useSecureTransport()() {
    return Object_Getter__bool(this.handle, "useSecureTransport");
  }
  void binaryType()(TCPSocketBinaryType binaryType) {
    Object_Call_int__void(this.handle, "binaryType", binaryType);
  }
  TCPSocketBinaryType binaryType()() {
    return Object_Getter__int(this.handle, "binaryType");
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
  libwasm.bindings.EventTarget.EventTarget _parent;
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
    return Serialize_Object_VarArgCall!bool(this._parent, "send", "Handle;uint;uint", tuple(cast(Handle)data.handle, byteOffset, byteLength));
  }
  bool send()(scope ref ArrayBuffer data, uint byteOffset /* = 0 */) {
    return Serialize_Object_VarArgCall!bool(this._parent, "send", "Handle;uint", tuple(cast(Handle)data.handle, byteOffset));
  }
  bool send()(scope ref ArrayBuffer data) {
    return Serialize_Object_VarArgCall!bool(this._parent, "send", "Handle", tuple(cast(Handle)data.handle));
  }
  TCPReadyState readyState()() {
    return Object_Getter__int(this._parent, "readyState");
  }
  TCPSocketBinaryType binaryType()() {
    return Object_Getter__int(this._parent, "binaryType");
  }
  void onopen(T0)(scope auto ref Optional!(T0) onopen) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onopen", !onopen.empty, onopen.front);
  }
  EventHandler onopen()() {
    return Object_Getter__EventHandler(this._parent, "onopen");
  }
  void ondrain(T0)(scope auto ref Optional!(T0) ondrain) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "ondrain", !ondrain.empty, ondrain.front);
  }
  EventHandler ondrain()() {
    return Object_Getter__EventHandler(this._parent, "ondrain");
  }
  void ondata(T0)(scope auto ref Optional!(T0) ondata) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "ondata", !ondata.empty, ondata.front);
  }
  EventHandler ondata()() {
    return Object_Getter__EventHandler(this._parent, "ondata");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void onclose(T0)(scope auto ref Optional!(T0) onclose) if (isTOrPointer!(T0, EventHandlerNonNull)) {
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


