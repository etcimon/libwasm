module libwasm.bindings.PeerConnectionObserverEnums;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

enum PCObserverStateType {
  None,
  IceConnectionState,
  IceGatheringState,
  SignalingState
}


