module libwasm.bindings.PeerConnectionImplEnums;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

enum PCImplIceConnectionState {
  new_,
  checking,
  connected,
  completed,
  failed,
  disconnected,
  closed
}
enum PCImplIceGatheringState {
  new_,
  gathering,
  complete
}
enum PCImplSignalingState {
  SignalingInvalid,
  SignalingStable,
  SignalingHaveLocalOffer,
  SignalingHaveRemoteOffer,
  SignalingHaveLocalPranswer,
  SignalingHaveRemotePranswer,
  SignalingClosed
}


