module libwasm.bindings.SVGRect;

import libwasm.types;

import std.typecons: tuple;
@safe:
nothrow:

struct SVGRect {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void x()(float x) {
    Object_Call_float__void(this.handle, "x", x);
  }
  float x()() {
    return Object_Getter__float(this.handle, "x");
  }
  void y()(float y) {
    Object_Call_float__void(this.handle, "y", y);
  }
  float y()() {
    return Object_Getter__float(this.handle, "y");
  }
  void width()(float width) {
    Object_Call_float__void(this.handle, "width", width);
  }
  float width()() {
    return Object_Getter__float(this.handle, "width");
  }
  void height()(float height) {
    Object_Call_float__void(this.handle, "height", height);
  }
  float height()() {
    return Object_Getter__float(this.handle, "height");
  }
}


