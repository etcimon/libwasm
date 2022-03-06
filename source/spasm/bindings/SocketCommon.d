module spasm.bindings.SocketCommon;

import spasm.types;
@safe:
nothrow:

enum SocketReadyState {
  opening,
  open,
  closing,
  closed,
  halfclosed
}


