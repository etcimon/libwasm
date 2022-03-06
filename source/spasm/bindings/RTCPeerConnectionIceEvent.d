module spasm.bindings.RTCPeerConnectionIceEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.RTCIceCandidate;

@safe:
nothrow:

struct RTCPeerConnectionIceEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto candidate()() {
    return Object_Getter__OptionalHandle(this._parent, "candidate");
  }
}
struct RTCPeerConnectionIceEventInit {
  nothrow:
  spasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return RTCPeerConnectionIceEventInit(spasm_add__object());
  }
  void candidate(T0)(scope auto ref Optional!(T0) candidate) if (isTOrPointer!(T0, RTCIceCandidate)) {
    RTCPeerConnectionIceEventInit_candidate_Set(this._parent, !candidate.empty, candidate.front.handle);
  }
  auto candidate()() {
    return Object_Getter__OptionalHandle(this._parent, "candidate");
  }
}


extern (C) void RTCPeerConnectionIceEventInit_candidate_Set(Handle, bool, Handle);