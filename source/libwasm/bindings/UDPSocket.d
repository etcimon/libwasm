module libwasm.bindings.UDPSocket;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Blob;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.SocketCommon;

@safe:
nothrow:

struct UDPOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return UDPOptions(libwasm_add__object());
  }
  void localAddress()(string localAddress) {
    Object_Call_string__void(this.handle, "localAddress", localAddress);
  }
  string localAddress()() {
    return Object_Getter__string(this.handle, "localAddress");
  }
  void localPort()(ushort localPort) {
    Serialize_Object_VarArgCall!void(this.handle, "localPort", "ushort", tuple(localPort));
  }
  ushort localPort()() {
    return Object_Getter__ushort(this.handle, "localPort");
  }
  void remoteAddress()(string remoteAddress) {
    Object_Call_string__void(this.handle, "remoteAddress", remoteAddress);
  }
  string remoteAddress()() {
    return Object_Getter__string(this.handle, "remoteAddress");
  }
  void remotePort()(ushort remotePort) {
    Serialize_Object_VarArgCall!void(this.handle, "remotePort", "ushort", tuple(remotePort));
  }
  ushort remotePort()() {
    return Object_Getter__ushort(this.handle, "remotePort");
  }
  void addressReuse()(bool addressReuse) {
    Object_Call_bool__void(this.handle, "addressReuse", addressReuse);
  }
  bool addressReuse()() {
    return Object_Getter__bool(this.handle, "addressReuse");
  }
  void loopback()(bool loopback) {
    Object_Call_bool__void(this.handle, "loopback", loopback);
  }
  bool loopback()() {
    return Object_Getter__bool(this.handle, "loopback");
  }
}
struct UDPSocket {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  Optional!(string) localAddress()() {
    return Object_Getter__OptionalString(this._parent, "localAddress");
  }
  Optional!(ushort) localPort()() {
    return UDPSocket_localPort_Get(this._parent);
  }
  Optional!(string) remoteAddress()() {
    return Object_Getter__OptionalString(this._parent, "remoteAddress");
  }
  Optional!(ushort) remotePort()() {
    return UDPSocket_remotePort_Get(this._parent);
  }
  bool addressReuse()() {
    return Object_Getter__bool(this._parent, "addressReuse");
  }
  bool loopback()() {
    return Object_Getter__bool(this._parent, "loopback");
  }
  SocketReadyState readyState()() {
    return Object_Getter__int(this._parent, "readyState");
  }
  auto opened()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "opened"));
  }
  auto closed()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "closed"));
  }
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onmessage", !onmessage.empty, onmessage.front);
  }
  EventHandler onmessage()() {
    return Object_Getter__EventHandler(this._parent, "onmessage");
  }
  auto close()() {
    return JsPromise!(void)(Object_Getter__Handle(this._parent, "close"));
  }
  void joinMulticastGroup()(string multicastGroupAddress) {
    Object_Call_string__void(this._parent, "joinMulticastGroup", multicastGroupAddress);
  }
  void leaveMulticastGroup()(string multicastGroupAddress) {
    Object_Call_string__void(this._parent, "leaveMulticastGroup", multicastGroupAddress);
  }
  bool send(T1, T2)(scope ref SumType!(string, Blob, ArrayBuffer, ArrayBufferView) data, scope auto ref Optional!(T1) remoteAddress, scope auto ref Optional!(T2) remotePort) if (isTOrPointer!(T1, string) && isTOrPointer!(T2, ushort)) {
    return Serialize_Object_VarArgCall!bool(this._parent, "send", "SumType!(string,Handle,Handle,Handle);Optional!(string);Optional!(ushort)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref data.Types[1] v) => 1),((ref data.Types[2] v) => 2),((ref data.Types[3] v) => 3))(data),tuple(libwasm.sumtype.match!(((string v) => v),((ref data.Types[1] v) => string.init),((ref data.Types[2] v) => string.init),((ref data.Types[3] v) => string.init))(data),libwasm.sumtype.match!(((string v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle),((ref data.Types[2] v) => Handle.init),((ref data.Types[3] v) => Handle.init))(data),libwasm.sumtype.match!(((string v) => Handle.init),((ref data.Types[1] v) => Handle.init),((ref data.Types[2] v) => cast(Handle)v.handle),((ref data.Types[3] v) => Handle.init))(data),libwasm.sumtype.match!(((string v) => Handle.init),((ref data.Types[1] v) => Handle.init),((ref data.Types[2] v) => Handle.init),((ref data.Types[3] v) => cast(Handle)v.handle))(data)), !remoteAddress.empty, remoteAddress.front, !remotePort.empty, remotePort.front));
  }
  bool send(T1)(scope ref SumType!(string, Blob, ArrayBuffer, ArrayBufferView) data, scope auto ref Optional!(T1) remoteAddress) if (isTOrPointer!(T1, string)) {
    return Serialize_Object_VarArgCall!bool(this._parent, "send", "SumType!(string,Handle,Handle,Handle);Optional!(string)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref data.Types[1] v) => 1),((ref data.Types[2] v) => 2),((ref data.Types[3] v) => 3))(data),tuple(libwasm.sumtype.match!(((string v) => v),((ref data.Types[1] v) => string.init),((ref data.Types[2] v) => string.init),((ref data.Types[3] v) => string.init))(data),libwasm.sumtype.match!(((string v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle),((ref data.Types[2] v) => Handle.init),((ref data.Types[3] v) => Handle.init))(data),libwasm.sumtype.match!(((string v) => Handle.init),((ref data.Types[1] v) => Handle.init),((ref data.Types[2] v) => cast(Handle)v.handle),((ref data.Types[3] v) => Handle.init))(data),libwasm.sumtype.match!(((string v) => Handle.init),((ref data.Types[1] v) => Handle.init),((ref data.Types[2] v) => Handle.init),((ref data.Types[3] v) => cast(Handle)v.handle))(data)), !remoteAddress.empty, remoteAddress.front));
  }
  bool send()(scope ref SumType!(string, Blob, ArrayBuffer, ArrayBufferView) data) {
    return Serialize_Object_VarArgCall!bool(this._parent, "send", "SumType!(string,Handle,Handle,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref data.Types[1] v) => 1),((ref data.Types[2] v) => 2),((ref data.Types[3] v) => 3))(data),tuple(libwasm.sumtype.match!(((string v) => v),((ref data.Types[1] v) => string.init),((ref data.Types[2] v) => string.init),((ref data.Types[3] v) => string.init))(data),libwasm.sumtype.match!(((string v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle),((ref data.Types[2] v) => Handle.init),((ref data.Types[3] v) => Handle.init))(data),libwasm.sumtype.match!(((string v) => Handle.init),((ref data.Types[1] v) => Handle.init),((ref data.Types[2] v) => cast(Handle)v.handle),((ref data.Types[3] v) => Handle.init))(data),libwasm.sumtype.match!(((string v) => Handle.init),((ref data.Types[1] v) => Handle.init),((ref data.Types[2] v) => Handle.init),((ref data.Types[3] v) => cast(Handle)v.handle))(data))));
  }
}


extern (C) Optional!(ushort) UDPSocket_localPort_Get(Handle);
extern (C) Optional!(ushort) UDPSocket_remotePort_Get(Handle);