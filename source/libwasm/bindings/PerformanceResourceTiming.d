module libwasm.bindings.PerformanceResourceTiming;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Performance;
import libwasm.bindings.PerformanceEntry;
import libwasm.bindings.PerformanceServerTiming;

@safe:
nothrow:

struct PerformanceResourceTiming {
  nothrow:
  libwasm.bindings.PerformanceEntry.PerformanceEntry _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PerformanceEntry(h);
  }
  string initiatorType()() {
    return Object_Getter__string(this._parent, "initiatorType");
  }
  string nextHopProtocol()() {
    return Object_Getter__string(this._parent, "nextHopProtocol");
  }
  double workerStart()() {
    return Object_Getter__double(this._parent, "workerStart");
  }
  double redirectStart()() {
    return Object_Getter__double(this._parent, "redirectStart");
  }
  double redirectEnd()() {
    return Object_Getter__double(this._parent, "redirectEnd");
  }
  double fetchStart()() {
    return Object_Getter__double(this._parent, "fetchStart");
  }
  double domainLookupStart()() {
    return Object_Getter__double(this._parent, "domainLookupStart");
  }
  double domainLookupEnd()() {
    return Object_Getter__double(this._parent, "domainLookupEnd");
  }
  double connectStart()() {
    return Object_Getter__double(this._parent, "connectStart");
  }
  double connectEnd()() {
    return Object_Getter__double(this._parent, "connectEnd");
  }
  double secureConnectionStart()() {
    return Object_Getter__double(this._parent, "secureConnectionStart");
  }
  double requestStart()() {
    return Object_Getter__double(this._parent, "requestStart");
  }
  double responseStart()() {
    return Object_Getter__double(this._parent, "responseStart");
  }
  double responseEnd()() {
    return Object_Getter__double(this._parent, "responseEnd");
  }
  uint transferSize()() {
    return Object_Getter__uint(this._parent, "transferSize");
  }
  uint encodedBodySize()() {
    return Object_Getter__uint(this._parent, "encodedBodySize");
  }
  uint decodedBodySize()() {
    return Object_Getter__uint(this._parent, "decodedBodySize");
  }
  auto serverTiming()() {
    return Sequence!(PerformanceServerTiming)(Object_Getter__Handle(this._parent, "serverTiming"));
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this._parent, "toJSON"));
  }
}


