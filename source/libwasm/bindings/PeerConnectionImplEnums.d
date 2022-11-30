module libwasm.bindings.PeerConnectionImplEnums;

import libwasm.types;

import std.typecons: tuple;
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


