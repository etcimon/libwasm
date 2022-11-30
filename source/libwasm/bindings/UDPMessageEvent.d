module libwasm.bindings.UDPMessageEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;

@safe:
nothrow:

struct UDPMessageEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  string remoteAddress()() {
    return Object_Getter__string(this._parent, "remoteAddress");
  }
  ushort remotePort()() {
    return Object_Getter__ushort(this._parent, "remotePort");
  }
  auto data()() {
    return Any(Object_Getter__Handle(this._parent, "data"));
  }
}
struct UDPMessageEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return UDPMessageEventInit(libwasm_add__object());
  }
  void remoteAddress()(string remoteAddress) {
    Object_Call_string__void(this._parent, "remoteAddress", remoteAddress);
  }
  string remoteAddress()() {
    return Object_Getter__string(this._parent, "remoteAddress");
  }
  void remotePort()(ushort remotePort) {
    Serialize_Object_VarArgCall!void(this._parent, "remotePort", "ushort", tuple(remotePort));
  }
  ushort remotePort()() {
    return Object_Getter__ushort(this._parent, "remotePort");
  }
  void data(T0)(scope auto ref T0 data) {
    import std.traits : isNumeric, isFloatingPoint, isSomeString;
    if (isSomeString!T0) {
      Object_Call_string__void(this._parent, "data", cast(string) data);
      return;
    } else if (isNumeric!T0 && !isFloatingPoint!T0) {
      Object_Call_long__void(this._parent, "data", cast(long) data);
      return;
    } else if (isFloatingPoint!T0) {
      Object_Call_double__void(this._parent, "data", cast(double) data);
      return;
    }
    // Any
    Handle _handle_data = getOrCreateHandle(data);
    Object_Call_Handle__void(this._parent, "data", _handle_data);
    dropHandle!(T0)(_handle_data);
  }
  auto data()() {
    return Any(Object_Getter__Handle(this._parent, "data"));
  }
}


