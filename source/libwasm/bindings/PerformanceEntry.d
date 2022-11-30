module libwasm.bindings.PerformanceEntry;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Performance;

@safe:
nothrow:

struct PerformanceEntry {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  string entryType()() {
    return Object_Getter__string(this.handle, "entryType");
  }
  double startTime()() {
    return Object_Getter__double(this.handle, "startTime");
  }
  double duration()() {
    return Object_Getter__double(this.handle, "duration");
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this.handle, "toJSON"));
  }
}


