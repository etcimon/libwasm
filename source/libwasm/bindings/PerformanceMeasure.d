module libwasm.bindings.PerformanceMeasure;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.PerformanceEntry;

@safe:
nothrow:

struct PerformanceMeasure {
  nothrow:
  libwasm.bindings.PerformanceEntry.PerformanceEntry _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PerformanceEntry(h);
  }
}

