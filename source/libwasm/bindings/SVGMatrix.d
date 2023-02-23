module libwasm.bindings.SVGMatrix;

import libwasm.types;

import libwasm.memory.ct: tuple;
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
    return SVGMatrix(Serialize_Object_VarArgCall!Handle(this.handle, "translate", "float;float", tuple(x, y)));
  }
  auto scale()(float scaleFactor) {
    return SVGMatrix(Serialize_Object_VarArgCall!Handle(this.handle, "scale", "float", tuple(scaleFactor)));
  }
  auto scaleNonUniform()(float scaleFactorX, float scaleFactorY) {
    return SVGMatrix(Serialize_Object_VarArgCall!Handle(this.handle, "scaleNonUniform", "float;float", tuple(scaleFactorX, scaleFactorY)));
  }
  auto rotate()(float angle) {
    return SVGMatrix(Serialize_Object_VarArgCall!Handle(this.handle, "rotate", "float", tuple(angle)));
  }
  auto rotateFromVector()(float x, float y) {
    return SVGMatrix(Serialize_Object_VarArgCall!Handle(this.handle, "rotateFromVector", "float;float", tuple(x, y)));
  }
  auto flipX()() {
    return SVGMatrix(Object_Getter__Handle(this.handle, "flipX"));
  }
  auto flipY()() {
    return SVGMatrix(Object_Getter__Handle(this.handle, "flipY"));
  }
  auto skewX()(float angle) {
    return SVGMatrix(Serialize_Object_VarArgCall!Handle(this.handle, "skewX", "float", tuple(angle)));
  }
  auto skewY()(float angle) {
    return SVGMatrix(Serialize_Object_VarArgCall!Handle(this.handle, "skewY", "float", tuple(angle)));
  }
}


