module spasm.bindings.PerformanceMeasure;

import spasm.types;
import spasm.bindings.PerformanceEntry;

@safe:
nothrow:

struct PerformanceMeasure {
  nothrow:
  spasm.bindings.PerformanceEntry.PerformanceEntry _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PerformanceEntry(h);
  }
}


