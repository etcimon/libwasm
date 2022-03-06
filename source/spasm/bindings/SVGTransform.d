module spasm.bindings.SVGTransform;

import spasm.types;
import spasm.bindings.SVGMatrix;

@safe:
nothrow:

struct SVGTransform {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort SVG_TRANSFORM_UNKNOWN = 0;
  enum ushort SVG_TRANSFORM_MATRIX = 1;
  enum ushort SVG_TRANSFORM_TRANSLATE = 2;
  enum ushort SVG_TRANSFORM_SCALE = 3;
  enum ushort SVG_TRANSFORM_ROTATE = 4;
  enum ushort SVG_TRANSFORM_SKEWX = 5;
  enum ushort SVG_TRANSFORM_SKEWY = 6;
  ushort type()() {
    return Object_Getter__ushort(this.handle, "type");
  }
  auto matrix()() {
    return SVGMatrix(Object_Getter__Handle(this.handle, "matrix"));
  }
  float angle()() {
    return Object_Getter__float(this.handle, "angle");
  }
  void setMatrix()(scope ref SVGMatrix matrix) {
    Object_Call_Handle__void(this.handle, "setMatrix", matrix.handle);
  }
  void setTranslate()(float tx, float ty) {
    SVGTransform_setTranslate(this.handle, tx, ty);
  }
  void setScale()(float sx, float sy) {
    SVGTransform_setScale(this.handle, sx, sy);
  }
  void setRotate()(float angle, float cx, float cy) {
    SVGTransform_setRotate(this.handle, angle, cx, cy);
  }
  void setSkewX()(float angle) {
    Object_Call_float__void(this.handle, "setSkewX", angle);
  }
  void setSkewY()(float angle) {
    Object_Call_float__void(this.handle, "setSkewY", angle);
  }
}


extern (C) void SVGTransform_setTranslate(Handle, float, float);
extern (C) void SVGTransform_setScale(Handle, float, float);
extern (C) void SVGTransform_setRotate(Handle, float, float, float);