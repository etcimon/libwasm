module libwasm.bindings.SocketCommon;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

enum SocketReadyState {
  opening,
  open,
  closing,
  closed,
  halfclosed
}


