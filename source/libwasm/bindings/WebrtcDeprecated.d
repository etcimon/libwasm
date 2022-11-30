module libwasm.bindings.WebrtcDeprecated;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.RTCIceCandidate;
import libwasm.bindings.RTCPeerConnection;
import libwasm.bindings.RTCSessionDescription;

@safe:
nothrow:

struct mozRTCIceCandidate {
  nothrow:
  libwasm.bindings.RTCIceCandidate.RTCIceCandidate _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCIceCandidate(h);
  }
}
struct mozRTCPeerConnection {
  nothrow:
  libwasm.bindings.RTCPeerConnection.RTCPeerConnection _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCPeerConnection(h);
  }
}
struct mozRTCSessionDescription {
  nothrow:
  libwasm.bindings.RTCSessionDescription.RTCSessionDescription _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCSessionDescription(h);
  }
}


