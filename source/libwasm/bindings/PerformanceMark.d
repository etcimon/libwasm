module libwasm.bindings.PerformanceMark;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.PerformanceEntry;

@safe:
nothrow:

struct PerformanceMark {
  nothrow:
  libwasm.bindings.PerformanceEntry.PerformanceEntry _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PerformanceEntry(h);
  }
}


