module spasm.bindings.WebKitCSSMatrix;

import spasm.types;
import spasm.bindings.DOMMatrix;

@safe:
nothrow:

struct WebKitCSSMatrix {
  nothrow:
  spasm.bindings.DOMMatrix.DOMMatrix _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .DOMMatrix(h);
  }
  auto setMatrixValue()(string transformList) {
    return WebKitCSSMatrix(Object_Call_string__Handle(this._parent, "setMatrixValue", transformList));
  }
  auto multiply()(scope ref WebKitCSSMatrix other) {
    return WebKitCSSMatrix(Object_Call_Handle__Handle(this._parent, "multiply", other._parent));
  }
  auto inverse()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "inverse"));
  }
  auto translate()(double tx /* = 0 */, double ty /* = 0 */, double tz /* = 0 */) {
    return WebKitCSSMatrix(WebKitCSSMatrix_translate(this._parent, tx, ty, tz));
  }
  auto translate()(double tx /* = 0 */, double ty /* = 0 */) {
    return WebKitCSSMatrix(WebKitCSSMatrix_translate_0(this._parent, tx, ty));
  }
  auto translate()(double tx /* = 0 */) {
    return WebKitCSSMatrix(WebKitCSSMatrix_translate_1(this._parent, tx));
  }
  auto translate()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "translate"));
  }
  auto scale()(double scaleX /* = 1 */, double scaleY, double scaleZ /* = 1 */) {
    return WebKitCSSMatrix(WebKitCSSMatrix_scale(this._parent, scaleX, scaleY, scaleZ));
  }
  auto scale()(double scaleX /* = 1 */, double scaleY) {
    return WebKitCSSMatrix(WebKitCSSMatrix_scale_0(this._parent, scaleX, scaleY));
  }
  auto scale()(double scaleX /* = 1 */) {
    return WebKitCSSMatrix(WebKitCSSMatrix_scale_1(this._parent, scaleX));
  }
  auto scale()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "scale"));
  }
  auto rotate()(double rotX /* = 0 */, double rotY, double rotZ) {
    return WebKitCSSMatrix(WebKitCSSMatrix_rotate(this._parent, rotX, rotY, rotZ));
  }
  auto rotate()(double rotX /* = 0 */, double rotY) {
    return WebKitCSSMatrix(WebKitCSSMatrix_rotate_0(this._parent, rotX, rotY));
  }
  auto rotate()(double rotX /* = 0 */) {
    return WebKitCSSMatrix(WebKitCSSMatrix_rotate_1(this._parent, rotX));
  }
  auto rotate()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "rotate"));
  }
  auto rotateAxisAngle()(double x /* = 0 */, double y /* = 0 */, double z /* = 0 */, double angle /* = 0 */) {
    return WebKitCSSMatrix(WebKitCSSMatrix_rotateAxisAngle(this._parent, x, y, z, angle));
  }
  auto rotateAxisAngle()(double x /* = 0 */, double y /* = 0 */, double z /* = 0 */) {
    return WebKitCSSMatrix(WebKitCSSMatrix_rotateAxisAngle_0(this._parent, x, y, z));
  }
  auto rotateAxisAngle()(double x /* = 0 */, double y /* = 0 */) {
    return WebKitCSSMatrix(WebKitCSSMatrix_rotateAxisAngle_1(this._parent, x, y));
  }
  auto rotateAxisAngle()(double x /* = 0 */) {
    return WebKitCSSMatrix(WebKitCSSMatrix_rotateAxisAngle_2(this._parent, x));
  }
  auto rotateAxisAngle()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "rotateAxisAngle"));
  }
  auto skewX()(double sx /* = 0 */) {
    return WebKitCSSMatrix(WebKitCSSMatrix_skewX(this._parent, sx));
  }
  auto skewX()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "skewX"));
  }
  auto skewY()(double sy /* = 0 */) {
    return WebKitCSSMatrix(WebKitCSSMatrix_skewY(this._parent, sy));
  }
  auto skewY()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "skewY"));
  }
}


extern (C) Handle WebKitCSSMatrix_translate(Handle, double, double, double);
extern (C) Handle WebKitCSSMatrix_translate_0(Handle, double, double);
extern (C) Handle WebKitCSSMatrix_translate_1(Handle, double);
extern (C) Handle WebKitCSSMatrix_scale(Handle, double, double, double);
extern (C) Handle WebKitCSSMatrix_scale_0(Handle, double, double);
extern (C) Handle WebKitCSSMatrix_scale_1(Handle, double);
extern (C) Handle WebKitCSSMatrix_rotate(Handle, double, double, double);
extern (C) Handle WebKitCSSMatrix_rotate_0(Handle, double, double);
extern (C) Handle WebKitCSSMatrix_rotate_1(Handle, double);
extern (C) Handle WebKitCSSMatrix_rotateAxisAngle(Handle, double, double, double, double);
extern (C) Handle WebKitCSSMatrix_rotateAxisAngle_0(Handle, double, double, double);
extern (C) Handle WebKitCSSMatrix_rotateAxisAngle_1(Handle, double, double);
extern (C) Handle WebKitCSSMatrix_rotateAxisAngle_2(Handle, double);
extern (C) Handle WebKitCSSMatrix_skewX(Handle, double);
extern (C) Handle WebKitCSSMatrix_skewY(Handle, double);