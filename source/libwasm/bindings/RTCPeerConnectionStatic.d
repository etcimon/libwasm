module libwasm.bindings.RTCPeerConnectionStatic;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.RTCPeerConnection;

@safe:
nothrow:

alias PeerConnectionLifecycleCallback = void delegate(RTCPeerConnection, uint, RTCLifecycleEvent);
enum RTCLifecycleEvent {
  initialized,
  icegatheringstatechange,
  iceconnectionstatechange
}
struct RTCPeerConnectionStatic {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void registerPeerConnectionLifecycleCallback()(PeerConnectionLifecycleCallback cb) {
    RTCPeerConnectionStatic_registerPeerConnectionLifecycleCallback(this.handle, cb);
  }
}


extern (C) void RTCPeerConnectionStatic_registerPeerConnectionLifecycleCallback(Handle, PeerConnectionLifecycleCallback);