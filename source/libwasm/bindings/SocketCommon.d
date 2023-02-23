module libwasm.bindings.SocketCommon;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

enum SocketReadyState {
  opening,
  open,
  closing,
  closed,
  halfclosed
}


