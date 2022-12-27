module libwasm.bindings.StorageType;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

enum StorageType {
  persistent,
  temporary,
  default_
}


