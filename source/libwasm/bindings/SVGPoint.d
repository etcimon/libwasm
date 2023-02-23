module libwasm.bindings.SVGPoint;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.SVGMatrix;

@safe:
nothrow:

struct SVGPoint {
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
  auto matrixTransform()(scope ref SVGMatrix matrix) {
    return SVGPoint(Object_Call_Handle__Handle(this.handle, "matrixTransform", matrix.handle));
  }
}


