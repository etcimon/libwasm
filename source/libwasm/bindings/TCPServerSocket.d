module libwasm.bindings.TCPServerSocket;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.TCPSocket;

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
    return ServerSocketOptions(libwasm_add__object());
  }
  void binaryType()(TCPSocketBinaryType binaryType) {
    Object_Call_int__void(this.handle, "binaryType", binaryType);
  }
  TCPSocketBinaryType binaryType()() {
    return Object_Getter__int(this.handle, "binaryType");
  }
}
struct TCPServerSocket {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  ushort localPort()() {
    return Object_Getter__ushort(this._parent, "localPort");
  }
  void onconnect(T0)(scope auto ref Optional!(T0) onconnect) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onconnect", !onconnect.empty, onconnect.front);
  }
  EventHandler onconnect()() {
    return Object_Getter__EventHandler(this._parent, "onconnect");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
}


