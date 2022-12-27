module libwasm.bindings.PerformanceServerTiming;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Performance;

@safe:
nothrow:

struct PerformanceServerTiming {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  double duration()() {
    return Object_Getter__double(this.handle, "duration");
  }
  string description()() {
    return Object_Getter__string(this.handle, "description");
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this.handle, "toJSON"));
  }
}


