module libwasm.bindings.IntersectionObserver;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.DOMRect;
import libwasm.bindings.Element;
import libwasm.bindings.Performance;

@safe:
nothrow:

alias IntersectionCallback = void delegate(Sequence!(IntersectionObserverEntry), IntersectionObserver);
struct IntersectionObserver {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto root()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this.handle, "root"));
  }
  string rootMargin()() {
    return Object_Getter__string(this.handle, "rootMargin");
  }
  auto thresholds()() {
    return Sequence!(double)(Object_Getter__Handle(this.handle, "thresholds"));
  }
  void observe()(scope ref Element target) {
    Object_Call_Handle__void(this.handle, "observe", target._parent);
  }
  void unobserve()(scope ref Element target) {
    Object_Call_Handle__void(this.handle, "unobserve", target._parent);
  }
  void disconnect()() {
    Object_Call__void(this.handle, "disconnect");
  }
  auto takeRecords()() {
    return Sequence!(IntersectionObserverEntry)(Object_Getter__Handle(this.handle, "takeRecords"));
  }
  IntersectionCallback intersectionCallback()() {
    return IntersectionObserver_intersectionCallback_Get(this.handle);
  }
}
struct IntersectionObserverEntry {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  double time()() {
    return Object_Getter__double(this.handle, "time");
  }
  auto rootBounds()() {
    return recastOpt!(DOMRectReadOnly)(Object_Getter__OptionalHandle(this.handle, "rootBounds"));
  }
  auto boundingClientRect()() {
    return DOMRectReadOnly(Object_Getter__Handle(this.handle, "boundingClientRect"));
  }
  auto intersectionRect()() {
    return DOMRectReadOnly(Object_Getter__Handle(this.handle, "intersectionRect"));
  }
  bool isIntersecting()() {
    return Object_Getter__bool(this.handle, "isIntersecting");
  }
  double intersectionRatio()() {
    return Object_Getter__double(this.handle, "intersectionRatio");
  }
  auto target()() {
    return Element(Object_Getter__Handle(this.handle, "target"));
  }
}
struct IntersectionObserverEntryInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return IntersectionObserverEntryInit(libwasm_add__object());
  }
  void time()(double time) {
    Object_Call_double__void(this.handle, "time", time);
  }
  double time()() {
    return Object_Getter__double(this.handle, "time");
  }
  void rootBounds()(scope ref DOMRectInit rootBounds) {
    Object_Call_Handle__void(this.handle, "rootBounds", rootBounds.handle);
  }
  auto rootBounds()() {
    return DOMRectInit(Object_Getter__Handle(this.handle, "rootBounds"));
  }
  void boundingClientRect()(scope ref DOMRectInit boundingClientRect) {
    Object_Call_Handle__void(this.handle, "boundingClientRect", boundingClientRect.handle);
  }
  auto boundingClientRect()() {
    return DOMRectInit(Object_Getter__Handle(this.handle, "boundingClientRect"));
  }
  void intersectionRect()(scope ref DOMRectInit intersectionRect) {
    Object_Call_Handle__void(this.handle, "intersectionRect", intersectionRect.handle);
  }
  auto intersectionRect()() {
    return DOMRectInit(Object_Getter__Handle(this.handle, "intersectionRect"));
  }
  void target()(scope ref Element target) {
    Object_Call_Handle__void(this.handle, "target", target.handle);
  }
  auto target()() {
    return Element(Object_Getter__Handle(this.handle, "target"));
  }
}
struct IntersectionObserverInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return IntersectionObserverInit(libwasm_add__object());
  }
  void root(T0)(scope auto ref Optional!(T0) root) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this.handle, "root", "Optional!Handle", tuple(!root.empty, cast(Handle)root.front._parent));
  }
  auto root()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this.handle, "root"));
  }
  void rootMargin()(string rootMargin) {
    Object_Call_string__void(this.handle, "rootMargin", rootMargin);
  }
  string rootMargin()() {
    return Object_Getter__string(this.handle, "rootMargin");
  }
  void threshold()(scope ref SumType!(double, Sequence!(double)) threshold) {
    Serialize_Object_VarArgCall!void(this.handle, "threshold", "SumType!(double,Handle)", tuple(libwasm.sumtype.match!(((double v) => 0),((ref threshold.Types[1] v) => 1))(threshold),tuple(libwasm.sumtype.match!(((double v) => v),((ref threshold.Types[1] v) => double.init))(threshold),libwasm.sumtype.match!(((double v) => Handle.init),((ref threshold.Types[1] v) => cast(Handle)v.handle))(threshold))));
  }
  auto threshold()() {
    return Object_Getter__Handle(this.handle, "threshold");
  }
}


extern (C) IntersectionCallback IntersectionObserver_intersectionCallback_Get(Handle);