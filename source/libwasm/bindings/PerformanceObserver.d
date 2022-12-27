module libwasm.bindings.PerformanceObserver;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Performance;
import libwasm.bindings.PerformanceObserverEntryList;

@safe:
nothrow:

struct PerformanceObserver {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void observe()(scope ref PerformanceObserverInit options) {
    Object_Call_Handle__void(this.handle, "observe", options.handle);
  }
  void disconnect()() {
    Object_Call__void(this.handle, "disconnect");
  }
  auto takeRecords()() {
    return PerformanceEntryList(Object_Getter__Handle(this.handle, "takeRecords"));
  }
}
alias PerformanceObserverCallback = void delegate(PerformanceObserverEntryList, PerformanceObserver);
struct PerformanceObserverInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return PerformanceObserverInit(libwasm_add__object());
  }
  void entryTypes()(scope ref Sequence!(string) entryTypes) {
    Object_Call_Handle__void(this.handle, "entryTypes", entryTypes.handle);
  }
  auto entryTypes()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "entryTypes"));
  }
  void buffered()(bool buffered) {
    Object_Call_bool__void(this.handle, "buffered", buffered);
  }
  bool buffered()() {
    return Object_Getter__bool(this.handle, "buffered");
  }
}


