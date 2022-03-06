module spasm.bindings.UDPSocket;

import spasm.types;
import spasm.bindings.Blob;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.SocketCommon;

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
    return UDPOptions(spasm_add__object());
  }
  void localAddress()(string localAddress) {
    Object_Call_string__void(this.handle, "localAddress", localAddress);
  }
  string localAddress()() {
    return Object_Getter__string(this.handle, "localAddress");
  }
  void localPort()(ushort localPort) {
    UDPOptions_localPort_Set(this.handle, localPort);
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
    UDPOptions_remotePort_Set(this.handle, remotePort);
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
  spasm.bindings.EventTarget.EventTarget _parent;
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
    return UDPSocket_readyState_Get(this._parent);
  }
  auto opened()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "opened"));
  }
  auto closed()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "closed"));
  }
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmessage", !onmessage.empty, onmessage.front);
  }
  EventHandler onmessage()() {
    return Object_Getter__EventHandler(this._parent, "onmessage");
  }
  auto close()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "close"));
  }
  void joinMulticastGroup()(string multicastGroupAddress) {
    Object_Call_string__void(this._parent, "joinMulticastGroup", multicastGroupAddress);
  }
  void leaveMulticastGroup()(string multicastGroupAddress) {
    Object_Call_string__void(this._parent, "leaveMulticastGroup", multicastGroupAddress);
  }
  bool send(T1, T2)(scope ref SumType!(string, Blob, ArrayBuffer, ArrayBufferView) data, scope auto ref Optional!(T1) remoteAddress, scope auto ref Optional!(T2) remotePort) if (isTOrPointer!(T1, string) && isTOrPointer!(T2, ushort)) {
    return UDPSocket_send(this._parent, data, !remoteAddress.empty, remoteAddress.front, !remotePort.empty, remotePort.front);
  }
  bool send(T1)(scope ref SumType!(string, Blob, ArrayBuffer, ArrayBufferView) data, scope auto ref Optional!(T1) remoteAddress) if (isTOrPointer!(T1, string)) {
    return UDPSocket_send_0(this._parent, data, !remoteAddress.empty, remoteAddress.front);
  }
  bool send()(scope ref SumType!(string, Blob, ArrayBuffer, ArrayBufferView) data) {
    return UDPSocket_send_1(this._parent, data);
  }
}


extern (C) void UDPOptions_localPort_Set(Handle, ushort);
extern (C) void UDPOptions_remotePort_Set(Handle, ushort);
extern (C) Optional!(ushort) UDPSocket_localPort_Get(Handle);
extern (C) Optional!(ushort) UDPSocket_remotePort_Get(Handle);
extern (C) SocketReadyState UDPSocket_readyState_Get(Handle);
extern (C) bool UDPSocket_send(Handle, scope ref SumType!(string, Blob, ArrayBuffer, ArrayBufferView), bool, string, bool, ushort);
extern (C) bool UDPSocket_send_0(Handle, scope ref SumType!(string, Blob, ArrayBuffer, ArrayBufferView), bool, string);
extern (C) bool UDPSocket_send_1(Handle, scope ref SumType!(string, Blob, ArrayBuffer, ArrayBufferView));