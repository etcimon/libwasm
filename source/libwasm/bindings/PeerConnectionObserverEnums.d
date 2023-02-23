module libwasm.bindings.PeerConnectionObserverEnums;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

enum PCObserverStateType {
  None,
  IceConnectionState,
  IceGatheringState,
  SignalingState
}


