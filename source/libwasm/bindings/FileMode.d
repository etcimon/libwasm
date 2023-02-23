module libwasm.bindings.FileMode;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

enum FileMode {
  readonly,
  readwrite
}


