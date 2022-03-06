module spasm.bindings.TCPServerSocketEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.TCPSocket;

@safe:
nothrow:

struct TCPServerSocketEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto socket()() {
    return TCPSocket(Object_Getter__Handle(this._parent, "socket"));
  }
}
struct TCPServerSocketEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return TCPServerSocketEventInit(spasm_add__object());
  }
  void socket(T0)(scope auto ref Optional!(T0) socket) if (isTOrPointer!(T0, TCPSocket)) {
    TCPServerSocketEventInit_socket_Set(this._parent, !socket.empty, socket.front._parent);
  }
  auto socket()() {
    return Object_Getter__OptionalHandle(this._parent, "socket");
  }
}


extern (C) void TCPServerSocketEventInit_socket_Set(Handle, bool, Handle);