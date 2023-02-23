module libwasm.bindings.PerformanceNavigationTiming;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Performance;
import libwasm.bindings.PerformanceResourceTiming;

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
  libwasm.bindings.PerformanceResourceTiming.PerformanceResourceTiming _parent;
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
    return Object_Getter__int(this._parent, "type");
  }
  ushort redirectCount()() {
    return Object_Getter__ushort(this._parent, "redirectCount");
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this._parent, "toJSON"));
  }
}


