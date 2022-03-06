module spasm.bindings.SVGMatrix;

import spasm.types;
@safe:
nothrow:

struct SVGMatrix {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void a()(float a) {
    Object_Call_float__void(this.handle, "a", a);
  }
  float a()() {
    return Object_Getter__float(this.handle, "a");
  }
  void b()(float b) {
    Object_Call_float__void(this.handle, "b", b);
  }
  float b()() {
    return Object_Getter__float(this.handle, "b");
  }
  void c()(float c) {
    Object_Call_float__void(this.handle, "c", c);
  }
  float c()() {
    return Object_Getter__float(this.handle, "c");
  }
  void d()(float d) {
    Object_Call_float__void(this.handle, "d", d);
  }
  float d()() {
    return Object_Getter__float(this.handle, "d");
  }
  void e()(float e) {
    Object_Call_float__void(this.handle, "e", e);
  }
  float e()() {
    return Object_Getter__float(this.handle, "e");
  }
  void f()(float f) {
    Object_Call_float__void(this.handle, "f", f);
  }
  float f()() {
    return Object_Getter__float(this.handle, "f");
  }
  auto multiply()(scope ref SVGMatrix secondMatrix) {
    return SVGMatrix(Object_Call_Handle__Handle(this.handle, "multiply", secondMatrix.handle));
  }
  auto inverse()() {
    return SVGMatrix(Object_Getter__Handle(this.handle, "inverse"));
  }
  auto translate()(float x, float y) {
    return SVGMatrix(SVGMatrix_translate(this.handle, x, y));
  }
  auto scale()(float scaleFactor) {
    return SVGMatrix(SVGMatrix_scale(this.handle, scaleFactor));
  }
  auto scaleNonUniform()(float scaleFactorX, float scaleFactorY) {
    return SVGMatrix(SVGMatrix_scaleNonUniform(this.handle, scaleFactorX, scaleFactorY));
  }
  auto rotate()(float angle) {
    return SVGMatrix(SVGMatrix_rotate(this.handle, angle));
  }
  auto rotateFromVector()(float x, float y) {
    return SVGMatrix(SVGMatrix_rotateFromVector(this.handle, x, y));
  }
  auto flipX()() {
    return SVGMatrix(Object_Getter__Handle(this.handle, "flipX"));
  }
  auto flipY()() {
    return SVGMatrix(Object_Getter__Handle(this.handle, "flipY"));
  }
  auto skewX()(float angle) {
    return SVGMatrix(SVGMatrix_skewX(this.handle, angle));
  }
  auto skewY()(float angle) {
    return SVGMatrix(SVGMatrix_skewY(this.handle, angle));
  }
}


extern (C) Handle SVGMatrix_translate(Handle, float, float);
extern (C) Handle SVGMatrix_scale(Handle, float);
extern (C) Handle SVGMatrix_scaleNonUniform(Handle, float, float);
extern (C) Handle SVGMatrix_rotate(Handle, float);
extern (C) Handle SVGMatrix_rotateFromVector(Handle, float, float);
extern (C) Handle SVGMatrix_skewX(Handle, float);
extern (C) Handle SVGMatrix_skewY(Handle, float);