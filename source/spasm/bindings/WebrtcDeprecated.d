module spasm.bindings.WebrtcDeprecated;

import spasm.types;
import spasm.bindings.RTCIceCandidate;
import spasm.bindings.RTCPeerConnection;
import spasm.bindings.RTCSessionDescription;

@safe:
nothrow:

struct mozRTCIceCandidate {
  nothrow:
  spasm.bindings.RTCIceCandidate.RTCIceCandidate _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCIceCandidate(h);
  }
}
struct mozRTCPeerConnection {
  nothrow:
  spasm.bindings.RTCPeerConnection.RTCPeerConnection _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCPeerConnection(h);
  }
}
struct mozRTCSessionDescription {
  nothrow:
  spasm.bindings.RTCSessionDescription.RTCSessionDescription _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .RTCSessionDescription(h);
  }
}


