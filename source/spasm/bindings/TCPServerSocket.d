module spasm.bindings.TCPServerSocket;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.TCPSocket;

@safe:
nothrow:

struct ServerSocketOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ServerSocketOptions(spasm_add__object());
  }
  void binaryType()(TCPSocketBinaryType binaryType) {
    ServerSocketOptions_binaryType_Set(this.handle, binaryType);
  }
  TCPSocketBinaryType binaryType()() {
    return ServerSocketOptions_binaryType_Get(this.handle);
  }
}
struct TCPServerSocket {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  ushort localPort()() {
    return Object_Getter__ushort(this._parent, "localPort");
  }
  void onconnect(T0)(scope auto ref Optional!(T0) onconnect) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onconnect", !onconnect.empty, onconnect.front);
  }
  EventHandler onconnect()() {
    return Object_Getter__EventHandler(this._parent, "onconnect");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
}


extern (C) void ServerSocketOptions_binaryType_Set(Handle, TCPSocketBinaryType);
extern (C) TCPSocketBinaryType ServerSocketOptions_binaryType_Get(Handle);