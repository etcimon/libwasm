module spasm.bindings.PerformanceMark;

import spasm.types;
import spasm.bindings.PerformanceEntry;

@safe:
nothrow:

struct PerformanceMark {
  nothrow:
  spasm.bindings.PerformanceEntry.PerformanceEntry _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PerformanceEntry(h);
  }
}


