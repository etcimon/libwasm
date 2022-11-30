module libwasm.bindings.WebKitCSSMatrix;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DOMMatrix;

@safe:
nothrow:

struct WebKitCSSMatrix {
  nothrow:
  libwasm.bindings.DOMMatrix.DOMMatrix _parent;
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
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "translate", "double;double;double", tuple(tx, ty, tz)));
  }
  auto translate()(double tx /* = 0 */, double ty /* = 0 */) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "translate", "double;double", tuple(tx, ty)));
  }
  auto translate()(double tx /* = 0 */) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "translate", "double", tuple(tx)));
  }
  auto translate()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "translate"));
  }
  auto scale()(double scaleX /* = 1 */, double scaleY, double scaleZ /* = 1 */) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "scale", "double;double;double", tuple(scaleX, scaleY, scaleZ)));
  }
  auto scale()(double scaleX /* = 1 */, double scaleY) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "scale", "double;double", tuple(scaleX, scaleY)));
  }
  auto scale()(double scaleX /* = 1 */) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "scale", "double", tuple(scaleX)));
  }
  auto scale()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "scale"));
  }
  auto rotate()(double rotX /* = 0 */, double rotY, double rotZ) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "rotate", "double;double;double", tuple(rotX, rotY, rotZ)));
  }
  auto rotate()(double rotX /* = 0 */, double rotY) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "rotate", "double;double", tuple(rotX, rotY)));
  }
  auto rotate()(double rotX /* = 0 */) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "rotate", "double", tuple(rotX)));
  }
  auto rotate()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "rotate"));
  }
  auto rotateAxisAngle()(double x /* = 0 */, double y /* = 0 */, double z /* = 0 */, double angle /* = 0 */) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "rotateAxisAngle", "double;double;double;double", tuple(x, y, z, angle)));
  }
  auto rotateAxisAngle()(double x /* = 0 */, double y /* = 0 */, double z /* = 0 */) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "rotateAxisAngle", "double;double;double", tuple(x, y, z)));
  }
  auto rotateAxisAngle()(double x /* = 0 */, double y /* = 0 */) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "rotateAxisAngle", "double;double", tuple(x, y)));
  }
  auto rotateAxisAngle()(double x /* = 0 */) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "rotateAxisAngle", "double", tuple(x)));
  }
  auto rotateAxisAngle()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "rotateAxisAngle"));
  }
  auto skewX()(double sx /* = 0 */) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "skewX", "double", tuple(sx)));
  }
  auto skewX()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "skewX"));
  }
  auto skewY()(double sy /* = 0 */) {
    return WebKitCSSMatrix(Serialize_Object_VarArgCall!Handle(this._parent, "skewY", "double", tuple(sy)));
  }
  auto skewY()() {
    return WebKitCSSMatrix(Object_Getter__Handle(this._parent, "skewY"));
  }
}


