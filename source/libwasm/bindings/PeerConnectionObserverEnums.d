module libwasm.bindings.PeerConnectionObserverEnums;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

enum PCObserverStateType {
  None,
  IceConnectionState,
  IceGatheringState,
  SignalingState
}


