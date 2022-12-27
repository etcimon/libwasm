module libwasm.bindings.DOMQuad;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.DOMPoint;
import libwasm.bindings.DOMRect;

@safe:
nothrow:

struct DOMQuad {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto p1()() {
    return DOMPoint(Object_Getter__Handle(this.handle, "p1"));
  }
  auto p2()() {
    return DOMPoint(Object_Getter__Handle(this.handle, "p2"));
  }
  auto p3()() {
    return DOMPoint(Object_Getter__Handle(this.handle, "p3"));
  }
  auto p4()() {
    return DOMPoint(Object_Getter__Handle(this.handle, "p4"));
  }
  auto getBounds()() {
    return DOMRectReadOnly(Object_Getter__Handle(this.handle, "getBounds"));
  }
  auto bounds()() {
    return DOMRectReadOnly(Object_Getter__Handle(this.handle, "bounds"));
  }
  auto toJSON()() {
    return DOMQuadJSON(Object_Getter__Handle(this.handle, "toJSON"));
  }
}
struct DOMQuadInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DOMQuadInit(libwasm_add__object());
  }
  void p1()(scope ref DOMPointInit p1) {
    Object_Call_Handle__void(this.handle, "p1", p1.handle);
  }
  auto p1()() {
    return DOMPointInit(Object_Getter__Handle(this.handle, "p1"));
  }
  void p2()(scope ref DOMPointInit p2) {
    Object_Call_Handle__void(this.handle, "p2", p2.handle);
  }
  auto p2()() {
    return DOMPointInit(Object_Getter__Handle(this.handle, "p2"));
  }
  void p3()(scope ref DOMPointInit p3) {
    Object_Call_Handle__void(this.handle, "p3", p3.handle);
  }
  auto p3()() {
    return DOMPointInit(Object_Getter__Handle(this.handle, "p3"));
  }
  void p4()(scope ref DOMPointInit p4) {
    Object_Call_Handle__void(this.handle, "p4", p4.handle);
  }
  auto p4()() {
    return DOMPointInit(Object_Getter__Handle(this.handle, "p4"));
  }
}
struct DOMQuadJSON {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DOMQuadJSON(libwasm_add__object());
  }
  void p1()(scope ref DOMPoint p1) {
    Object_Call_Handle__void(this.handle, "p1", p1._parent);
  }
  auto p1()() {
    return DOMPoint(Object_Getter__Handle(this.handle, "p1"));
  }
  void p2()(scope ref DOMPoint p2) {
    Object_Call_Handle__void(this.handle, "p2", p2._parent);
  }
  auto p2()() {
    return DOMPoint(Object_Getter__Handle(this.handle, "p2"));
  }
  void p3()(scope ref DOMPoint p3) {
    Object_Call_Handle__void(this.handle, "p3", p3._parent);
  }
  auto p3()() {
    return DOMPoint(Object_Getter__Handle(this.handle, "p3"));
  }
  void p4()(scope ref DOMPoint p4) {
    Object_Call_Handle__void(this.handle, "p4", p4._parent);
  }
  auto p4()() {
    return DOMPoint(Object_Getter__Handle(this.handle, "p4"));
  }
}


