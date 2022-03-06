module spasm.bindings.DOMMatrix;

import spasm.types;
import spasm.bindings.DOMPoint;

@safe:
nothrow:

struct DOMMatrix {
  nothrow:
  spasm.bindings.DOMMatrix.DOMMatrixReadOnly _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .DOMMatrixReadOnly(h);
  }
  void a()(double a) {
    Object_Call_double__void(this._parent, "a", a);
  }
  double a()() {
    return Object_Getter__double(this._parent, "a");
  }
  void b()(double b) {
    Object_Call_double__void(this._parent, "b", b);
  }
  double b()() {
    return Object_Getter__double(this._parent, "b");
  }
  void c()(double c) {
    Object_Call_double__void(this._parent, "c", c);
  }
  double c()() {
    return Object_Getter__double(this._parent, "c");
  }
  void d()(double d) {
    Object_Call_double__void(this._parent, "d", d);
  }
  double d()() {
    return Object_Getter__double(this._parent, "d");
  }
  void e()(double e) {
    Object_Call_double__void(this._parent, "e", e);
  }
  double e()() {
    return Object_Getter__double(this._parent, "e");
  }
  void f()(double f) {
    Object_Call_double__void(this._parent, "f", f);
  }
  double f()() {
    return Object_Getter__double(this._parent, "f");
  }
  void m11()(double m11) {
    Object_Call_double__void(this._parent, "m11", m11);
  }
  double m11()() {
    return Object_Getter__double(this._parent, "m11");
  }
  void m12()(double m12) {
    Object_Call_double__void(this._parent, "m12", m12);
  }
  double m12()() {
    return Object_Getter__double(this._parent, "m12");
  }
  void m13()(double m13) {
    Object_Call_double__void(this._parent, "m13", m13);
  }
  double m13()() {
    return Object_Getter__double(this._parent, "m13");
  }
  void m14()(double m14) {
    Object_Call_double__void(this._parent, "m14", m14);
  }
  double m14()() {
    return Object_Getter__double(this._parent, "m14");
  }
  void m21()(double m21) {
    Object_Call_double__void(this._parent, "m21", m21);
  }
  double m21()() {
    return Object_Getter__double(this._parent, "m21");
  }
  void m22()(double m22) {
    Object_Call_double__void(this._parent, "m22", m22);
  }
  double m22()() {
    return Object_Getter__double(this._parent, "m22");
  }
  void m23()(double m23) {
    Object_Call_double__void(this._parent, "m23", m23);
  }
  double m23()() {
    return Object_Getter__double(this._parent, "m23");
  }
  void m24()(double m24) {
    Object_Call_double__void(this._parent, "m24", m24);
  }
  double m24()() {
    return Object_Getter__double(this._parent, "m24");
  }
  void m31()(double m31) {
    Object_Call_double__void(this._parent, "m31", m31);
  }
  double m31()() {
    return Object_Getter__double(this._parent, "m31");
  }
  void m32()(double m32) {
    Object_Call_double__void(this._parent, "m32", m32);
  }
  double m32()() {
    return Object_Getter__double(this._parent, "m32");
  }
  void m33()(double m33) {
    Object_Call_double__void(this._parent, "m33", m33);
  }
  double m33()() {
    return Object_Getter__double(this._parent, "m33");
  }
  void m34()(double m34) {
    Object_Call_double__void(this._parent, "m34", m34);
  }
  double m34()() {
    return Object_Getter__double(this._parent, "m34");
  }
  void m41()(double m41) {
    Object_Call_double__void(this._parent, "m41", m41);
  }
  double m41()() {
    return Object_Getter__double(this._parent, "m41");
  }
  void m42()(double m42) {
    Object_Call_double__void(this._parent, "m42", m42);
  }
  double m42()() {
    return Object_Getter__double(this._parent, "m42");
  }
  void m43()(double m43) {
    Object_Call_double__void(this._parent, "m43", m43);
  }
  double m43()() {
    return Object_Getter__double(this._parent, "m43");
  }
  void m44()(double m44) {
    Object_Call_double__void(this._parent, "m44", m44);
  }
  double m44()() {
    return Object_Getter__double(this._parent, "m44");
  }
  auto multiplySelf()(scope ref DOMMatrix other) {
    return DOMMatrix(Object_Call_Handle__Handle(this._parent, "multiplySelf", other._parent));
  }
  auto preMultiplySelf()(scope ref DOMMatrix other) {
    return DOMMatrix(Object_Call_Handle__Handle(this._parent, "preMultiplySelf", other._parent));
  }
  auto translateSelf()(double tx, double ty, double tz /* = 0 */) {
    return DOMMatrix(DOMMatrix_translateSelf(this._parent, tx, ty, tz));
  }
  auto translateSelf()(double tx, double ty) {
    return DOMMatrix(DOMMatrix_translateSelf_0(this._parent, tx, ty));
  }
  auto scaleSelf()(double scale, double originX /* = 0 */, double originY /* = 0 */) {
    return DOMMatrix(DOMMatrix_scaleSelf(this._parent, scale, originX, originY));
  }
  auto scaleSelf()(double scale, double originX /* = 0 */) {
    return DOMMatrix(DOMMatrix_scaleSelf_0(this._parent, scale, originX));
  }
  auto scaleSelf()(double scale) {
    return DOMMatrix(DOMMatrix_scaleSelf_1(this._parent, scale));
  }
  auto scale3dSelf()(double scale, double originX /* = 0 */, double originY /* = 0 */, double originZ /* = 0 */) {
    return DOMMatrix(DOMMatrix_scale3dSelf(this._parent, scale, originX, originY, originZ));
  }
  auto scale3dSelf()(double scale, double originX /* = 0 */, double originY /* = 0 */) {
    return DOMMatrix(DOMMatrix_scale3dSelf_0(this._parent, scale, originX, originY));
  }
  auto scale3dSelf()(double scale, double originX /* = 0 */) {
    return DOMMatrix(DOMMatrix_scale3dSelf_1(this._parent, scale, originX));
  }
  auto scale3dSelf()(double scale) {
    return DOMMatrix(DOMMatrix_scale3dSelf_2(this._parent, scale));
  }
  auto scaleNonUniformSelf()(double scaleX, double scaleY /* = 1 */, double scaleZ /* = 1 */, double originX /* = 0 */, double originY /* = 0 */, double originZ /* = 0 */) {
    return DOMMatrix(DOMMatrix_scaleNonUniformSelf(this._parent, scaleX, scaleY, scaleZ, originX, originY, originZ));
  }
  auto scaleNonUniformSelf()(double scaleX, double scaleY /* = 1 */, double scaleZ /* = 1 */, double originX /* = 0 */, double originY /* = 0 */) {
    return DOMMatrix(DOMMatrix_scaleNonUniformSelf_0(this._parent, scaleX, scaleY, scaleZ, originX, originY));
  }
  auto scaleNonUniformSelf()(double scaleX, double scaleY /* = 1 */, double scaleZ /* = 1 */, double originX /* = 0 */) {
    return DOMMatrix(DOMMatrix_scaleNonUniformSelf_1(this._parent, scaleX, scaleY, scaleZ, originX));
  }
  auto scaleNonUniformSelf()(double scaleX, double scaleY /* = 1 */, double scaleZ /* = 1 */) {
    return DOMMatrix(DOMMatrix_scaleNonUniformSelf_2(this._parent, scaleX, scaleY, scaleZ));
  }
  auto scaleNonUniformSelf()(double scaleX, double scaleY /* = 1 */) {
    return DOMMatrix(DOMMatrix_scaleNonUniformSelf_3(this._parent, scaleX, scaleY));
  }
  auto scaleNonUniformSelf()(double scaleX) {
    return DOMMatrix(DOMMatrix_scaleNonUniformSelf_4(this._parent, scaleX));
  }
  auto rotateSelf()(double angle, double originX /* = 0 */, double originY /* = 0 */) {
    return DOMMatrix(DOMMatrix_rotateSelf(this._parent, angle, originX, originY));
  }
  auto rotateSelf()(double angle, double originX /* = 0 */) {
    return DOMMatrix(DOMMatrix_rotateSelf_0(this._parent, angle, originX));
  }
  auto rotateSelf()(double angle) {
    return DOMMatrix(DOMMatrix_rotateSelf_1(this._parent, angle));
  }
  auto rotateFromVectorSelf()(double x, double y) {
    return DOMMatrix(DOMMatrix_rotateFromVectorSelf(this._parent, x, y));
  }
  auto rotateAxisAngleSelf()(double x, double y, double z, double angle) {
    return DOMMatrix(DOMMatrix_rotateAxisAngleSelf(this._parent, x, y, z, angle));
  }
  auto skewXSelf()(double sx) {
    return DOMMatrix(DOMMatrix_skewXSelf(this._parent, sx));
  }
  auto skewYSelf()(double sy) {
    return DOMMatrix(DOMMatrix_skewYSelf(this._parent, sy));
  }
  auto invertSelf()() {
    return DOMMatrix(Object_Getter__Handle(this._parent, "invertSelf"));
  }
  auto setMatrixValue()(string transformList) {
    return DOMMatrix(Object_Call_string__Handle(this._parent, "setMatrixValue", transformList));
  }
}
struct DOMMatrixReadOnly {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  double a()() {
    return Object_Getter__double(this.handle, "a");
  }
  double b()() {
    return Object_Getter__double(this.handle, "b");
  }
  double c()() {
    return Object_Getter__double(this.handle, "c");
  }
  double d()() {
    return Object_Getter__double(this.handle, "d");
  }
  double e()() {
    return Object_Getter__double(this.handle, "e");
  }
  double f()() {
    return Object_Getter__double(this.handle, "f");
  }
  double m11()() {
    return Object_Getter__double(this.handle, "m11");
  }
  double m12()() {
    return Object_Getter__double(this.handle, "m12");
  }
  double m13()() {
    return Object_Getter__double(this.handle, "m13");
  }
  double m14()() {
    return Object_Getter__double(this.handle, "m14");
  }
  double m21()() {
    return Object_Getter__double(this.handle, "m21");
  }
  double m22()() {
    return Object_Getter__double(this.handle, "m22");
  }
  double m23()() {
    return Object_Getter__double(this.handle, "m23");
  }
  double m24()() {
    return Object_Getter__double(this.handle, "m24");
  }
  double m31()() {
    return Object_Getter__double(this.handle, "m31");
  }
  double m32()() {
    return Object_Getter__double(this.handle, "m32");
  }
  double m33()() {
    return Object_Getter__double(this.handle, "m33");
  }
  double m34()() {
    return Object_Getter__double(this.handle, "m34");
  }
  double m41()() {
    return Object_Getter__double(this.handle, "m41");
  }
  double m42()() {
    return Object_Getter__double(this.handle, "m42");
  }
  double m43()() {
    return Object_Getter__double(this.handle, "m43");
  }
  double m44()() {
    return Object_Getter__double(this.handle, "m44");
  }
  auto translate()(double tx, double ty, double tz /* = 0 */) {
    return DOMMatrix(DOMMatrixReadOnly_translate(this.handle, tx, ty, tz));
  }
  auto translate()(double tx, double ty) {
    return DOMMatrix(DOMMatrixReadOnly_translate_0(this.handle, tx, ty));
  }
  auto scale()(double scale, double originX /* = 0 */, double originY /* = 0 */) {
    return DOMMatrix(DOMMatrixReadOnly_scale(this.handle, scale, originX, originY));
  }
  auto scale()(double scale, double originX /* = 0 */) {
    return DOMMatrix(DOMMatrixReadOnly_scale_0(this.handle, scale, originX));
  }
  auto scale()(double scale) {
    return DOMMatrix(DOMMatrixReadOnly_scale_1(this.handle, scale));
  }
  auto scale3d()(double scale, double originX /* = 0 */, double originY /* = 0 */, double originZ /* = 0 */) {
    return DOMMatrix(DOMMatrixReadOnly_scale3d(this.handle, scale, originX, originY, originZ));
  }
  auto scale3d()(double scale, double originX /* = 0 */, double originY /* = 0 */) {
    return DOMMatrix(DOMMatrixReadOnly_scale3d_0(this.handle, scale, originX, originY));
  }
  auto scale3d()(double scale, double originX /* = 0 */) {
    return DOMMatrix(DOMMatrixReadOnly_scale3d_1(this.handle, scale, originX));
  }
  auto scale3d()(double scale) {
    return DOMMatrix(DOMMatrixReadOnly_scale3d_2(this.handle, scale));
  }
  auto scaleNonUniform()(double scaleX, double scaleY /* = 1 */, double scaleZ /* = 1 */, double originX /* = 0 */, double originY /* = 0 */, double originZ /* = 0 */) {
    return DOMMatrix(DOMMatrixReadOnly_scaleNonUniform(this.handle, scaleX, scaleY, scaleZ, originX, originY, originZ));
  }
  auto scaleNonUniform()(double scaleX, double scaleY /* = 1 */, double scaleZ /* = 1 */, double originX /* = 0 */, double originY /* = 0 */) {
    return DOMMatrix(DOMMatrixReadOnly_scaleNonUniform_0(this.handle, scaleX, scaleY, scaleZ, originX, originY));
  }
  auto scaleNonUniform()(double scaleX, double scaleY /* = 1 */, double scaleZ /* = 1 */, double originX /* = 0 */) {
    return DOMMatrix(DOMMatrixReadOnly_scaleNonUniform_1(this.handle, scaleX, scaleY, scaleZ, originX));
  }
  auto scaleNonUniform()(double scaleX, double scaleY /* = 1 */, double scaleZ /* = 1 */) {
    return DOMMatrix(DOMMatrixReadOnly_scaleNonUniform_2(this.handle, scaleX, scaleY, scaleZ));
  }
  auto scaleNonUniform()(double scaleX, double scaleY /* = 1 */) {
    return DOMMatrix(DOMMatrixReadOnly_scaleNonUniform_3(this.handle, scaleX, scaleY));
  }
  auto scaleNonUniform()(double scaleX) {
    return DOMMatrix(DOMMatrixReadOnly_scaleNonUniform_4(this.handle, scaleX));
  }
  auto rotate()(double angle, double originX /* = 0 */, double originY /* = 0 */) {
    return DOMMatrix(DOMMatrixReadOnly_rotate(this.handle, angle, originX, originY));
  }
  auto rotate()(double angle, double originX /* = 0 */) {
    return DOMMatrix(DOMMatrixReadOnly_rotate_0(this.handle, angle, originX));
  }
  auto rotate()(double angle) {
    return DOMMatrix(DOMMatrixReadOnly_rotate_1(this.handle, angle));
  }
  auto rotateFromVector()(double x, double y) {
    return DOMMatrix(DOMMatrixReadOnly_rotateFromVector(this.handle, x, y));
  }
  auto rotateAxisAngle()(double x, double y, double z, double angle) {
    return DOMMatrix(DOMMatrixReadOnly_rotateAxisAngle(this.handle, x, y, z, angle));
  }
  auto skewX()(double sx) {
    return DOMMatrix(DOMMatrixReadOnly_skewX(this.handle, sx));
  }
  auto skewY()(double sy) {
    return DOMMatrix(DOMMatrixReadOnly_skewY(this.handle, sy));
  }
  auto multiply()(scope ref DOMMatrix other) {
    return DOMMatrix(Object_Call_Handle__Handle(this.handle, "multiply", other._parent));
  }
  auto flipX()() {
    return DOMMatrix(Object_Getter__Handle(this.handle, "flipX"));
  }
  auto flipY()() {
    return DOMMatrix(Object_Getter__Handle(this.handle, "flipY"));
  }
  auto inverse()() {
    return DOMMatrix(Object_Getter__Handle(this.handle, "inverse"));
  }
  bool is2D()() {
    return Object_Getter__bool(this.handle, "is2D");
  }
  bool isIdentity()() {
    return Object_Getter__bool(this.handle, "isIdentity");
  }
  auto transformPoint()(scope ref DOMPointInit point) {
    return DOMPoint(Object_Call_Handle__Handle(this.handle, "transformPoint", point.handle));
  }
  auto transformPoint()() {
    return DOMPoint(Object_Getter__Handle(this.handle, "transformPoint"));
  }
  auto toFloat32Array()() {
    return Float32Array(Object_Getter__Handle(this.handle, "toFloat32Array"));
  }
  auto toFloat64Array()() {
    return Float64Array(Object_Getter__Handle(this.handle, "toFloat64Array"));
  }
  auto toJSON()() {
    return JsObject(Object_Getter__Handle(this.handle, "toJSON"));
  }
}


extern (C) Handle DOMMatrix_translateSelf(Handle, double, double, double);
extern (C) Handle DOMMatrix_translateSelf_0(Handle, double, double);
extern (C) Handle DOMMatrix_scaleSelf(Handle, double, double, double);
extern (C) Handle DOMMatrix_scaleSelf_0(Handle, double, double);
extern (C) Handle DOMMatrix_scaleSelf_1(Handle, double);
extern (C) Handle DOMMatrix_scale3dSelf(Handle, double, double, double, double);
extern (C) Handle DOMMatrix_scale3dSelf_0(Handle, double, double, double);
extern (C) Handle DOMMatrix_scale3dSelf_1(Handle, double, double);
extern (C) Handle DOMMatrix_scale3dSelf_2(Handle, double);
extern (C) Handle DOMMatrix_scaleNonUniformSelf(Handle, double, double, double, double, double, double);
extern (C) Handle DOMMatrix_scaleNonUniformSelf_0(Handle, double, double, double, double, double);
extern (C) Handle DOMMatrix_scaleNonUniformSelf_1(Handle, double, double, double, double);
extern (C) Handle DOMMatrix_scaleNonUniformSelf_2(Handle, double, double, double);
extern (C) Handle DOMMatrix_scaleNonUniformSelf_3(Handle, double, double);
extern (C) Handle DOMMatrix_scaleNonUniformSelf_4(Handle, double);
extern (C) Handle DOMMatrix_rotateSelf(Handle, double, double, double);
extern (C) Handle DOMMatrix_rotateSelf_0(Handle, double, double);
extern (C) Handle DOMMatrix_rotateSelf_1(Handle, double);
extern (C) Handle DOMMatrix_rotateFromVectorSelf(Handle, double, double);
extern (C) Handle DOMMatrix_rotateAxisAngleSelf(Handle, double, double, double, double);
extern (C) Handle DOMMatrix_skewXSelf(Handle, double);
extern (C) Handle DOMMatrix_skewYSelf(Handle, double);
extern (C) Handle DOMMatrixReadOnly_translate(Handle, double, double, double);
extern (C) Handle DOMMatrixReadOnly_translate_0(Handle, double, double);
extern (C) Handle DOMMatrixReadOnly_scale(Handle, double, double, double);
extern (C) Handle DOMMatrixReadOnly_scale_0(Handle, double, double);
extern (C) Handle DOMMatrixReadOnly_scale_1(Handle, double);
extern (C) Handle DOMMatrixReadOnly_scale3d(Handle, double, double, double, double);
extern (C) Handle DOMMatrixReadOnly_scale3d_0(Handle, double, double, double);
extern (C) Handle DOMMatrixReadOnly_scale3d_1(Handle, double, double);
extern (C) Handle DOMMatrixReadOnly_scale3d_2(Handle, double);
extern (C) Handle DOMMatrixReadOnly_scaleNonUniform(Handle, double, double, double, double, double, double);
extern (C) Handle DOMMatrixReadOnly_scaleNonUniform_0(Handle, double, double, double, double, double);
extern (C) Handle DOMMatrixReadOnly_scaleNonUniform_1(Handle, double, double, double, double);
extern (C) Handle DOMMatrixReadOnly_scaleNonUniform_2(Handle, double, double, double);
extern (C) Handle DOMMatrixReadOnly_scaleNonUniform_3(Handle, double, double);
extern (C) Handle DOMMatrixReadOnly_scaleNonUniform_4(Handle, double);
extern (C) Handle DOMMatrixReadOnly_rotate(Handle, double, double, double);
extern (C) Handle DOMMatrixReadOnly_rotate_0(Handle, double, double);
extern (C) Handle DOMMatrixReadOnly_rotate_1(Handle, double);
extern (C) Handle DOMMatrixReadOnly_rotateFromVector(Handle, double, double);
extern (C) Handle DOMMatrixReadOnly_rotateAxisAngle(Handle, double, double, double, double);
extern (C) Handle DOMMatrixReadOnly_skewX(Handle, double);
extern (C) Handle DOMMatrixReadOnly_skewY(Handle, double);