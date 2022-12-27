module libwasm.bindings.FileMode;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

enum FileMode {
  readonly,
  readwrite
}


