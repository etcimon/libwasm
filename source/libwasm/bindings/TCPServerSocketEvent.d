module libwasm.bindings.TCPServerSocketEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.TCPSocket;

@safe:
nothrow:

struct TCPServerSocketEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
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
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return TCPServerSocketEventInit(libwasm_add__object());
  }
  void socket(T0)(scope auto ref Optional!(T0) socket) if (isTOrPointer!(T0, TCPSocket)) {
    Serialize_Object_VarArgCall!void(this._parent, "socket", "Optional!Handle", tuple(!socket.empty, cast(Handle)socket.front._parent));
  }
  auto socket()() {
    return Optional!(TCPSocket)(Object_Getter__OptionalHandle(this._parent, "socket"));
  }
}


