module libwasm.bindings.StorageType;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

enum StorageType {
  persistent,
  temporary,
  default_
}


