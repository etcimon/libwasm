module libwasm.bindings.RTCPeerConnectionIceEvent;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.RTCIceCandidate;

@safe:
nothrow:

struct RTCPeerConnectionIceEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto candidate()() {
    return recastOpt!(RTCIceCandidate)(Object_Getter__OptionalHandle(this._parent, "candidate"));
  }
}
struct RTCPeerConnectionIceEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return RTCPeerConnectionIceEventInit(libwasm_add__object());
  }
  void candidate(T0)(scope auto ref Optional!(T0) candidate) if (isTOrPointer!(T0, RTCIceCandidate)) {
    Serialize_Object_VarArgCall!void(this._parent, "candidate", "Optional!Handle", tuple(!candidate.empty, cast(Handle)candidate.front.handle));
  }
  auto candidate()() {
    return recastOpt!(RTCIceCandidate)(Object_Getter__OptionalHandle(this._parent, "candidate"));
  }
}


