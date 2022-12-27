module libwasm.bindings.PerformanceObserverEntryList;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Performance;

@safe:
nothrow:

struct PerformanceEntryFilterOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PerformanceEntryFilterOptions(libwasm_add__object());
  }
  void name()(string name) {
    Object_Call_string__void(this.handle, "name", name);
  }
  string name()() {
    return Object_Getter__string(this.handle, "name");
  }
  void entryType()(string entryType) {
    Object_Call_string__void(this.handle, "entryType", entryType);
  }
  string entryType()() {
    return Object_Getter__string(this.handle, "entryType");
  }
  void initiatorType()(string initiatorType) {
    Object_Call_string__void(this.handle, "initiatorType", initiatorType);
  }
  string initiatorType()() {
    return Object_Getter__string(this.handle, "initiatorType");
  }
}
struct PerformanceObserverEntryList {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto getEntries()(scope ref PerformanceEntryFilterOptions filter) {
    return PerformanceEntryList(Object_Call_Handle__Handle(this.handle, "getEntries", filter.handle));
  }
  auto getEntries()() {
    return PerformanceEntryList(Object_Getter__Handle(this.handle, "getEntries"));
  }
  auto getEntriesByType()(string entryType) {
    return PerformanceEntryList(Object_Call_string__Handle(this.handle, "getEntriesByType", entryType));
  }
  auto getEntriesByName()(string name, string entryType) {
    return PerformanceEntryList(Object_Call_string_string__Handle(this.handle, "getEntriesByName", name, entryType));
  }
  auto getEntriesByName()(string name) {
    return PerformanceEntryList(Object_Call_string__Handle(this.handle, "getEntriesByName", name));
  }
}


