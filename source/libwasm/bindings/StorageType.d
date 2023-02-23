module libwasm.bindings.StorageType;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

enum StorageType {
  persistent,
  temporary,
  default_
}


