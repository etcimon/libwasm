module libwasm.bindings.DOMRect;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct DOMRect {
  nothrow:
  libwasm.bindings.DOMRect.DOMRectReadOnly _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .DOMRectReadOnly(h);
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
  void width()(double width) {
    Object_Call_double__void(this._parent, "width", width);
  }
  double width()() {
    return Object_Getter__double(this._parent, "width");
  }
  void height()(double height) {
    Object_Call_double__void(this._parent, "height", height);
  }
  double height()() {
    return Object_Getter__double(this._parent, "height");
  }
}
struct DOMRectInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return DOMRectInit(libwasm_add__object());
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
  void width()(double width) {
    Object_Call_double__void(this.handle, "width", width);
  }
  double width()() {
    return Object_Getter__double(this.handle, "width");
  }
  void height()(double height) {
    Object_Call_double__void(this.handle, "height", height);
  }
  double height()() {
    return Object_Getter__double(this.handle, "height");
  }
}
struct DOMRectReadOnly {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  double x()() {
    return Object_Getter__double(this.handle, "x");
  }
  double y()() {
    return Object_Getter__double(this.handle, "y");
  }
  double width()() {
    return Object_Getter__double(this.handle, "width");
  }
  double height()() {
    return Object_Getter__double(this.handle, "height");
  }
  double top()() {
    return Object_Getter__double(this.handle, "top");
  }
  double right()() {
    return Object_Getter__double(this.handle, "right");
  }
  double bottom()() {
    return Object_Getter__double(this.handle, "bottom");
  }
  double left()() {
    return Object_Getter__double(this.handle, "left");
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this.handle, "toJSON"));
  }
}


