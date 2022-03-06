module spasm.bindings.PerformanceNavigationTiming;

import spasm.types;
import spasm.bindings.Performance;
import spasm.bindings.PerformanceResourceTiming;

@safe:
nothrow:

enum NavigationType {
  navigate,
  reload,
  back_forward,
  prerender
}
struct PerformanceNavigationTiming {
  nothrow:
  spasm.bindings.PerformanceResourceTiming.PerformanceResourceTiming _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .PerformanceResourceTiming(h);
  }
  double unloadEventStart()() {
    return Object_Getter__double(this._parent, "unloadEventStart");
  }
  double unloadEventEnd()() {
    return Object_Getter__double(this._parent, "unloadEventEnd");
  }
  double domInteractive()() {
    return Object_Getter__double(this._parent, "domInteractive");
  }
  double domContentLoadedEventStart()() {
    return Object_Getter__double(this._parent, "domContentLoadedEventStart");
  }
  double domContentLoadedEventEnd()() {
    return Object_Getter__double(this._parent, "domContentLoadedEventEnd");
  }
  double domComplete()() {
    return Object_Getter__double(this._parent, "domComplete");
  }
  double loadEventStart()() {
    return Object_Getter__double(this._parent, "loadEventStart");
  }
  double loadEventEnd()() {
    return Object_Getter__double(this._parent, "loadEventEnd");
  }
  NavigationType type()() {
    return PerformanceNavigationTiming_type_Get(this._parent);
  }
  ushort redirectCount()() {
    return Object_Getter__ushort(this._parent, "redirectCount");
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this._parent, "toJSON"));
  }
}


extern (C) NavigationType PerformanceNavigationTiming_type_Get(Handle);