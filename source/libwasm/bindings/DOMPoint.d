module libwasm.bindings.DOMPoint;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct DOMPoint {
  nothrow:
  libwasm.bindings.DOMPoint.DOMPointReadOnly _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .DOMPointReadOnly(h);
  }
  auto fromPoint()(scope ref DOMPointInit other) {
    return DOMPoint(Object_Call_Handle__Handle(this._parent, "fromPoint", other.handle));
  }
  auto fromPoint()() {
    return DOMPoint(Object_Getter__Handle(this._parent, "fromPoint"));
  }
  void x()(double x) {
    Object_Call_double__void(this._parent, "x", x);
  }
  double x()() {
    return Object_Getter__double(this._parent, "x");
  }
  void y()(double y) {
    Object_Call_double__void(this._parent, "y", y);
  }
  double y()() {
    return Object_Getter__double(this._parent, "y");
  }
  void z()(double z) {
    Object_Call_double__void(this._parent, "z", z);
  }
  double z()() {
    return Object_Getter__double(this._parent, "z");
  }
  void w()(double w) {
    Object_Call_double__void(this._parent, "w", w);
  }
  double w()() {
    return Object_Getter__double(this._parent, "w");
  }
}
struct DOMPointInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DOMPointInit(libwasm_add__object());
  }
  void x()(double x) {
    Object_Call_double__void(this.handle, "x", x);
  }
  double x()() {
    return Object_Getter__double(this.handle, "x");
  }
  void y()(double y) {
    Object_Call_double__void(this.handle, "y", y);
  }
  double y()() {
    return Object_Getter__double(this.handle, "y");
  }
  void z()(double z) {
    Object_Call_double__void(this.handle, "z", z);
  }
  double z()() {
    return Object_Getter__double(this.handle, "z");
  }
  void w()(double w) {
    Object_Call_double__void(this.handle, "w", w);
  }
  double w()() {
    return Object_Getter__double(this.handle, "w");
  }
}
struct DOMPointReadOnly {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto fromPoint()(scope ref DOMPointInit other) {
    return DOMPointReadOnly(Object_Call_Handle__Handle(this.handle, "fromPoint", other.handle));
  }
  auto fromPoint()() {
    return DOMPointReadOnly(Object_Getter__Handle(this.handle, "fromPoint"));
  }
  double x()() {
    return Object_Getter__double(this.handle, "x");
  }
  double y()() {
    return Object_Getter__double(this.handle, "y");
  }
  double z()() {
    return Object_Getter__double(this.handle, "z");
  }
  double w()() {
    return Object_Getter__double(this.handle, "w");
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this.handle, "toJSON"));
  }
}


