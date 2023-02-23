module libwasm.bindings.PerformanceTiming;

import libwasm.types;

import libwasm.memory.ct: tuple;
@safe:
nothrow:

struct PerformanceTiming {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  uint navigationStart()() {
    return Object_Getter__uint(this.handle, "navigationStart");
  }
  uint unloadEventStart()() {
    return Object_Getter__uint(this.handle, "unloadEventStart");
  }
  uint unloadEventEnd()() {
    return Object_Getter__uint(this.handle, "unloadEventEnd");
  }
  uint redirectStart()() {
    return Object_Getter__uint(this.handle, "redirectStart");
  }
  uint redirectEnd()() {
    return Object_Getter__uint(this.handle, "redirectEnd");
  }
  uint fetchStart()() {
    return Object_Getter__uint(this.handle, "fetchStart");
  }
  uint domainLookupStart()() {
    return Object_Getter__uint(this.handle, "domainLookupStart");
  }
  uint domainLookupEnd()() {
    return Object_Getter__uint(this.handle, "domainLookupEnd");
  }
  uint connectStart()() {
    return Object_Getter__uint(this.handle, "connectStart");
  }
  uint connectEnd()() {
    return Object_Getter__uint(this.handle, "connectEnd");
  }
  uint secureConnectionStart()() {
    return Object_Getter__uint(this.handle, "secureConnectionStart");
  }
  uint requestStart()() {
    return Object_Getter__uint(this.handle, "requestStart");
  }
  uint responseStart()() {
    return Object_Getter__uint(this.handle, "responseStart");
  }
  uint responseEnd()() {
    return Object_Getter__uint(this.handle, "responseEnd");
  }
  uint domLoading()() {
    return Object_Getter__uint(this.handle, "domLoading");
  }
  uint domInteractive()() {
    return Object_Getter__uint(this.handle, "domInteractive");
  }
  uint domContentLoadedEventStart()() {
    return Object_Getter__uint(this.handle, "domContentLoadedEventStart");
  }
  uint domContentLoadedEventEnd()() {
    return Object_Getter__uint(this.handle, "domContentLoadedEventEnd");
  }
  uint domComplete()() {
    return Object_Getter__uint(this.handle, "domComplete");
  }
  uint loadEventStart()() {
    return Object_Getter__uint(this.handle, "loadEventStart");
  }
  uint loadEventEnd()() {
    return Object_Getter__uint(this.handle, "loadEventEnd");
  }
  uint timeToNonBlankPaint()() {
    return Object_Getter__uint(this.handle, "timeToNonBlankPaint");
  }
  uint timeToContentfulPaint()() {
    return Object_Getter__uint(this.handle, "timeToContentfulPaint");
  }
  uint timeToDOMContentFlushed()() {
    return Object_Getter__uint(this.handle, "timeToDOMContentFlushed");
  }
  uint timeToFirstInteractive()() {
    return Object_Getter__uint(this.handle, "timeToFirstInteractive");
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this.handle, "toJSON"));
  }
}


