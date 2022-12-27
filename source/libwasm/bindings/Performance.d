module libwasm.bindings.Performance;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.PerformanceEntry;
import libwasm.bindings.PerformanceNavigation;
import libwasm.bindings.PerformanceTiming;

@safe:
nothrow:

alias DOMHighResTimeStamp = double;
struct Performance {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  double now()() {
    return Object_Getter__double(this._parent, "now");
  }
  double timeOrigin()() {
    return Object_Getter__double(this._parent, "timeOrigin");
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this._parent, "toJSON"));
  }
  auto timing()() {
    return PerformanceTiming(Object_Getter__Handle(this._parent, "timing"));
  }
  auto navigation()() {
    return PerformanceNavigation(Object_Getter__Handle(this._parent, "navigation"));
  }
  auto getEntries()() {
    return PerformanceEntryList(Object_Getter__Handle(this._parent, "getEntries"));
  }
  auto getEntriesByType()(string entryType) {
    return PerformanceEntryList(Object_Call_string__Handle(this._parent, "getEntriesByType", entryType));
  }
  auto getEntriesByName()(string name, string entryType) {
    return PerformanceEntryList(Object_Call_string_string__Handle(this._parent, "getEntriesByName", name, entryType));
  }
  auto getEntriesByName()(string name) {
    return PerformanceEntryList(Object_Call_string__Handle(this._parent, "getEntriesByName", name));
  }
  void clearResourceTimings()() {
    Object_Call__void(this._parent, "clearResourceTimings");
  }
  void setResourceTimingBufferSize()(uint maxSize) {
    Object_Call_uint__void(this._parent, "setResourceTimingBufferSize", maxSize);
  }
  void onresourcetimingbufferfull(T0)(scope auto ref Optional!(T0) onresourcetimingbufferfull) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onresourcetimingbufferfull", !onresourcetimingbufferfull.empty, onresourcetimingbufferfull.front);
  }
  EventHandler onresourcetimingbufferfull()() {
    return Object_Getter__EventHandler(this._parent, "onresourcetimingbufferfull");
  }
  auto mozMemory()() {
    return JsObject(Object_Getter__Handle(this._parent, "mozMemory"));
  }
  void mark()(string markName) {
    Object_Call_string__void(this._parent, "mark", markName);
  }
  void clearMarks()(string markName) {
    Object_Call_string__void(this._parent, "clearMarks", markName);
  }
  void clearMarks()() {
    Object_Call__void(this._parent, "clearMarks");
  }
  void measure()(string measureName, string startMark, string endMark) {
    Serialize_Object_VarArgCall!void(this._parent, "measure", "string;string;string", tuple(measureName, startMark, endMark));
  }
  void measure()(string measureName, string startMark) {
    Object_Call_string_string__void(this._parent, "measure", measureName, startMark);
  }
  void measure()(string measureName) {
    Object_Call_string__void(this._parent, "measure", measureName);
  }
  void clearMeasures()(string measureName) {
    Object_Call_string__void(this._parent, "clearMeasures", measureName);
  }
  void clearMeasures()() {
    Object_Call__void(this._parent, "clearMeasures");
  }
}
alias PerformanceEntryList = Sequence!(PerformanceEntry);


