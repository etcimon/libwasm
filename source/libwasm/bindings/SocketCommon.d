module libwasm.bindings.SocketCommon;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

enum SocketReadyState {
  opening,
  open,
  closing,
  closed,
  halfclosed
}


