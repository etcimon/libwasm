module spasm.bindings.PeerConnectionObserverEnums;

import spasm.types;
@safe:
nothrow:

enum PCObserverStateType {
  None,
  IceConnectionState,
  IceGatheringState,
  SignalingState
}


