module spasm.bindings.CanvasRenderingContext2D;

import spasm.types;
import spasm.bindings.Element;
import spasm.bindings.HTMLCanvasElement;
import spasm.bindings.HTMLImageElement;
import spasm.bindings.HTMLVideoElement;
import spasm.bindings.ImageBitmap;
import spasm.bindings.ImageData;
import spasm.bindings.SVGImageElement;
import spasm.bindings.SVGMatrix;
import spasm.bindings.Window;

@safe:
nothrow:

struct CanvasCompositing {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void globalAlpha()(double globalAlpha) {
    Object_Call_double__void(this.handle, "globalAlpha", globalAlpha);
  }
  double globalAlpha()() {
    return Object_Getter__double(this.handle, "globalAlpha");
  }
  void globalCompositeOperation()(string globalCompositeOperation) {
    Object_Call_string__void(this.handle, "globalCompositeOperation", globalCompositeOperation);
  }
  string globalCompositeOperation()() {
    return Object_Getter__string(this.handle, "globalCompositeOperation");
  }
}
struct CanvasDrawImage {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void drawImage()(scope ref CanvasImageSource image, double dx, double dy) {
    CanvasDrawImage_drawImage__CanvasImageSource_double_double(this.handle, image, dx, dy);
  }
  void drawImage()(scope ref CanvasImageSource image, double dx, double dy, double dw, double dh) {
    CanvasDrawImage_drawImage__CanvasImageSource_double_double_double_double(this.handle, image, dx, dy, dw, dh);
  }
  void drawImage()(scope ref CanvasImageSource image, double sx, double sy, double sw, double sh, double dx, double dy, double dw, double dh) {
    CanvasDrawImage_drawImage__CanvasImageSource_double_double_double_double_double_double_double_double(this.handle, image, sx, sy, sw, sh, dx, dy, dw, dh);
  }
}
struct CanvasDrawPath {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void beginPath()() {
    Object_Call__void(this.handle, "beginPath");
  }
  void fill()(CanvasWindingRule winding /* = "nonzero" */) {
    CanvasDrawPath_fill__CanvasWindingRule(this.handle, winding);
  }
  void fill()() {
    Object_Call__void(this.handle, "fill");
  }
  void fill()(scope ref Path2D path, CanvasWindingRule winding /* = "nonzero" */) {
    CanvasDrawPath_fill__Handle_CanvasWindingRule(this.handle, path.handle, winding);
  }
  void fill()(scope ref Path2D path) {
    Object_Call_Handle__void(this.handle, "fill", path.handle);
  }
  void stroke()() {
    Object_Call__void(this.handle, "stroke");
  }
  void stroke()(scope ref Path2D path) {
    Object_Call_Handle__void(this.handle, "stroke", path.handle);
  }
  void clip()(CanvasWindingRule winding /* = "nonzero" */) {
    CanvasDrawPath_clip__CanvasWindingRule(this.handle, winding);
  }
  void clip()() {
    Object_Call__void(this.handle, "clip");
  }
  void clip()(scope ref Path2D path, CanvasWindingRule winding /* = "nonzero" */) {
    CanvasDrawPath_clip__Handle_CanvasWindingRule(this.handle, path.handle, winding);
  }
  void clip()(scope ref Path2D path) {
    Object_Call_Handle__void(this.handle, "clip", path.handle);
  }
  bool isPointInPath()(double x, double y, CanvasWindingRule winding /* = "nonzero" */) {
    return CanvasDrawPath_isPointInPath__double_double_CanvasWindingRule(this.handle, x, y, winding);
  }
  bool isPointInPath()(double x, double y) {
    return CanvasDrawPath_isPointInPath_0_double_double(this.handle, x, y);
  }
  bool isPointInPath()(scope ref Path2D path, double x, double y, CanvasWindingRule winding /* = "nonzero" */) {
    return CanvasDrawPath_isPointInPath__Handle_double_double_CanvasWindingRule(this.handle, path.handle, x, y, winding);
  }
  bool isPointInPath()(scope ref Path2D path, double x, double y) {
    return CanvasDrawPath_isPointInPath_0_Handle_double_double(this.handle, path.handle, x, y);
  }
  bool isPointInStroke()(double x, double y) {
    return CanvasDrawPath_isPointInStroke__double_double(this.handle, x, y);
  }
  bool isPointInStroke()(scope ref Path2D path, double x, double y) {
    return CanvasDrawPath_isPointInStroke__Handle_double_double(this.handle, path.handle, x, y);
  }
}
struct CanvasFillStrokeStyles {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void strokeStyle()(scope ref SumType!(string, CanvasGradient, CanvasPattern) strokeStyle) {
    CanvasFillStrokeStyles_strokeStyle_Set(this.handle, strokeStyle);
  }
  auto strokeStyle()() {
    return Object_Getter__Handle(this.handle, "strokeStyle");
  }
  void fillStyle()(scope ref SumType!(string, CanvasGradient, CanvasPattern) fillStyle) {
    CanvasFillStrokeStyles_fillStyle_Set(this.handle, fillStyle);
  }
  auto fillStyle()() {
    return Object_Getter__Handle(this.handle, "fillStyle");
  }
  auto createLinearGradient()(double x0, double y0, double x1, double y1) {
    return CanvasGradient(CanvasFillStrokeStyles_createLinearGradient(this.handle, x0, y0, x1, y1));
  }
  auto createRadialGradient()(double x0, double y0, double r0, double x1, double y1, double r1) {
    return CanvasGradient(CanvasFillStrokeStyles_createRadialGradient(this.handle, x0, y0, r0, x1, y1, r1));
  }
  auto createPattern()(scope ref CanvasImageSource image, string repetition) {
    return CanvasFillStrokeStyles_createPattern(this.handle, image, repetition);
  }
}
struct CanvasFilters {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void filter()(string filter) {
    Object_Call_string__void(this.handle, "filter", filter);
  }
  string filter()() {
    return Object_Getter__string(this.handle, "filter");
  }
}
struct CanvasGradient {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void addColorStop()(float offset, string color) {
    CanvasGradient_addColorStop(this.handle, offset, color);
  }
}
struct CanvasHitRegions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void addHitRegion()(scope ref HitRegionOptions options) {
    Object_Call_Handle__void(this.handle, "addHitRegion", options.handle);
  }
  void addHitRegion()() {
    Object_Call__void(this.handle, "addHitRegion");
  }
  void removeHitRegion()(string id) {
    Object_Call_string__void(this.handle, "removeHitRegion", id);
  }
  void clearHitRegions()() {
    Object_Call__void(this.handle, "clearHitRegions");
  }
}
struct CanvasImageData {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto createImageData()(double sw, double sh) {
    return ImageData(CanvasImageData_createImageData__double_double(this.handle, sw, sh));
  }
  auto createImageData()(scope ref ImageData imagedata) {
    return ImageData(Object_Call_Handle__Handle(this.handle, "createImageData", imagedata.handle));
  }
  auto getImageData()(double sx, double sy, double sw, double sh) {
    return ImageData(CanvasImageData_getImageData(this.handle, sx, sy, sw, sh));
  }
  void putImageData()(scope ref ImageData imagedata, double dx, double dy) {
    CanvasImageData_putImageData__Handle_double_double(this.handle, imagedata.handle, dx, dy);
  }
  void putImageData()(scope ref ImageData imagedata, double dx, double dy, double dirtyX, double dirtyY, double dirtyWidth, double dirtyHeight) {
    CanvasImageData_putImageData__Handle_double_double_double_double_double_double(this.handle, imagedata.handle, dx, dy, dirtyX, dirtyY, dirtyWidth, dirtyHeight);
  }
}
struct CanvasImageSmoothing {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void imageSmoothingEnabled()(bool imageSmoothingEnabled) {
    Object_Call_bool__void(this.handle, "imageSmoothingEnabled", imageSmoothingEnabled);
  }
  bool imageSmoothingEnabled()() {
    return Object_Getter__bool(this.handle, "imageSmoothingEnabled");
  }
}
alias CanvasImageSource = SumType!(HTMLOrSVGImageElement, HTMLCanvasElement, HTMLVideoElement, ImageBitmap);
struct CanvasPathDrawingStyles {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void lineWidth()(double lineWidth) {
    Object_Call_double__void(this.handle, "lineWidth", lineWidth);
  }
  double lineWidth()() {
    return Object_Getter__double(this.handle, "lineWidth");
  }
  void lineCap()(string lineCap) {
    Object_Call_string__void(this.handle, "lineCap", lineCap);
  }
  string lineCap()() {
    return Object_Getter__string(this.handle, "lineCap");
  }
  void lineJoin()(string lineJoin) {
    Object_Call_string__void(this.handle, "lineJoin", lineJoin);
  }
  string lineJoin()() {
    return Object_Getter__string(this.handle, "lineJoin");
  }
  void miterLimit()(double miterLimit) {
    Object_Call_double__void(this.handle, "miterLimit", miterLimit);
  }
  double miterLimit()() {
    return Object_Getter__double(this.handle, "miterLimit");
  }
  void setLineDash()(scope ref Sequence!(double) segments) {
    Object_Call_Handle__void(this.handle, "setLineDash", segments.handle);
  }
  auto getLineDash()() {
    return Sequence!(double)(Object_Getter__Handle(this.handle, "getLineDash"));
  }
  void lineDashOffset()(double lineDashOffset) {
    Object_Call_double__void(this.handle, "lineDashOffset", lineDashOffset);
  }
  double lineDashOffset()() {
    return Object_Getter__double(this.handle, "lineDashOffset");
  }
}
struct CanvasPathMethods {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void closePath()() {
    Object_Call__void(this.handle, "closePath");
  }
  void moveTo()(double x, double y) {
    Object_Call_double_double__void(this.handle, "moveTo", x, y);
  }
  void lineTo()(double x, double y) {
    Object_Call_double_double__void(this.handle, "lineTo", x, y);
  }
  void quadraticCurveTo()(double cpx, double cpy, double x, double y) {
    CanvasPathMethods_quadraticCurveTo(this.handle, cpx, cpy, x, y);
  }
  void bezierCurveTo()(double cp1x, double cp1y, double cp2x, double cp2y, double x, double y) {
    CanvasPathMethods_bezierCurveTo(this.handle, cp1x, cp1y, cp2x, cp2y, x, y);
  }
  void arcTo()(double x1, double y1, double x2, double y2, double radius) {
    CanvasPathMethods_arcTo(this.handle, x1, y1, x2, y2, radius);
  }
  void rect()(double x, double y, double w, double h) {
    CanvasPathMethods_rect(this.handle, x, y, w, h);
  }
  void arc()(double x, double y, double radius, double startAngle, double endAngle, bool anticlockwise /* = false */) {
    CanvasPathMethods_arc(this.handle, x, y, radius, startAngle, endAngle, anticlockwise);
  }
  void arc()(double x, double y, double radius, double startAngle, double endAngle) {
    CanvasPathMethods_arc_0(this.handle, x, y, radius, startAngle, endAngle);
  }
  void ellipse()(double x, double y, double radiusX, double radiusY, double rotation, double startAngle, double endAngle, bool anticlockwise /* = false */) {
    CanvasPathMethods_ellipse(this.handle, x, y, radiusX, radiusY, rotation, startAngle, endAngle, anticlockwise);
  }
  void ellipse()(double x, double y, double radiusX, double radiusY, double rotation, double startAngle, double endAngle) {
    CanvasPathMethods_ellipse_0(this.handle, x, y, radiusX, radiusY, rotation, startAngle, endAngle);
  }
}
struct CanvasPattern {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void setTransform()(scope ref SVGMatrix matrix) {
    Object_Call_Handle__void(this.handle, "setTransform", matrix.handle);
  }
}
struct CanvasRect {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void clearRect()(double x, double y, double w, double h) {
    CanvasRect_clearRect(this.handle, x, y, w, h);
  }
  void fillRect()(double x, double y, double w, double h) {
    CanvasRect_fillRect(this.handle, x, y, w, h);
  }
  void strokeRect()(double x, double y, double w, double h) {
    CanvasRect_strokeRect(this.handle, x, y, w, h);
  }
}
struct CanvasRenderingContext2D {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto canvas()() {
    return Object_Getter__OptionalHandle(this.handle, "canvas");
  }
  void mozCurrentTransform()(scope ref JsObject mozCurrentTransform) {
    Object_Call_Handle__void(this.handle, "mozCurrentTransform", mozCurrentTransform.handle);
  }
  auto mozCurrentTransform()() {
    return JsObject(Object_Getter__Handle(this.handle, "mozCurrentTransform"));
  }
  void mozCurrentTransformInverse()(scope ref JsObject mozCurrentTransformInverse) {
    Object_Call_Handle__void(this.handle, "mozCurrentTransformInverse", mozCurrentTransformInverse.handle);
  }
  auto mozCurrentTransformInverse()() {
    return JsObject(Object_Getter__Handle(this.handle, "mozCurrentTransformInverse"));
  }
  void mozTextStyle()(string mozTextStyle) {
    Object_Call_string__void(this.handle, "mozTextStyle", mozTextStyle);
  }
  string mozTextStyle()() {
    return Object_Getter__string(this.handle, "mozTextStyle");
  }
  void mozImageSmoothingEnabled()(bool mozImageSmoothingEnabled) {
    Object_Call_bool__void(this.handle, "mozImageSmoothingEnabled", mozImageSmoothingEnabled);
  }
  bool mozImageSmoothingEnabled()() {
    return Object_Getter__bool(this.handle, "mozImageSmoothingEnabled");
  }
  enum uint DRAWWINDOW_DRAW_CARET = 0x01;
  enum uint DRAWWINDOW_DO_NOT_FLUSH = 0x02;
  enum uint DRAWWINDOW_DRAW_VIEW = 0x04;
  enum uint DRAWWINDOW_USE_WIDGET_LAYERS = 0x08;
  enum uint DRAWWINDOW_ASYNC_DECODE_IMAGES = 0x10;
  void drawWindow()(scope ref Window window, double x, double y, double w, double h, string bgColor, uint flags /* = 0 */) {
    CanvasRenderingContext2D_drawWindow(this.handle, window._parent, x, y, w, h, bgColor, flags);
  }
  void drawWindow()(scope ref Window window, double x, double y, double w, double h, string bgColor) {
    CanvasRenderingContext2D_drawWindow_0(this.handle, window._parent, x, y, w, h, bgColor);
  }
  void demote()() {
    Object_Call__void(this.handle, "demote");
  }
  void save()() {
    Object_Call__void(this.handle, "save");
  }
  void restore()() {
    Object_Call__void(this.handle, "restore");
  }
  void scale()(double x, double y) {
    Object_Call_double_double__void(this.handle, "scale", x, y);
  }
  void rotate()(double angle) {
    Object_Call_double__void(this.handle, "rotate", angle);
  }
  void translate()(double x, double y) {
    Object_Call_double_double__void(this.handle, "translate", x, y);
  }
  void transform()(double a, double b, double c, double d, double e, double f) {
    CanvasTransform_transform(this.handle, a, b, c, d, e, f);
  }
  void setTransform()(double a, double b, double c, double d, double e, double f) {
    CanvasTransform_setTransform(this.handle, a, b, c, d, e, f);
  }
  void resetTransform()() {
    Object_Call__void(this.handle, "resetTransform");
  }
  void globalAlpha()(double globalAlpha) {
    Object_Call_double__void(this.handle, "globalAlpha", globalAlpha);
  }
  double globalAlpha()() {
    return Object_Getter__double(this.handle, "globalAlpha");
  }
  void globalCompositeOperation()(string globalCompositeOperation) {
    Object_Call_string__void(this.handle, "globalCompositeOperation", globalCompositeOperation);
  }
  string globalCompositeOperation()() {
    return Object_Getter__string(this.handle, "globalCompositeOperation");
  }
  void imageSmoothingEnabled()(bool imageSmoothingEnabled) {
    Object_Call_bool__void(this.handle, "imageSmoothingEnabled", imageSmoothingEnabled);
  }
  bool imageSmoothingEnabled()() {
    return Object_Getter__bool(this.handle, "imageSmoothingEnabled");
  }
  void strokeStyle()(scope ref SumType!(string, CanvasGradient, CanvasPattern) strokeStyle) {
    CanvasFillStrokeStyles_strokeStyle_Set(this.handle, strokeStyle);
  }
  auto strokeStyle()() {
    return Object_Getter__Handle(this.handle, "strokeStyle");
  }
  void fillStyle()(scope ref SumType!(string, CanvasGradient, CanvasPattern) fillStyle) {
    CanvasFillStrokeStyles_fillStyle_Set(this.handle, fillStyle);
  }
  auto fillStyle()() {
    return Object_Getter__Handle(this.handle, "fillStyle");
  }
  auto createLinearGradient()(double x0, double y0, double x1, double y1) {
    return CanvasGradient(CanvasFillStrokeStyles_createLinearGradient(this.handle, x0, y0, x1, y1));
  }
  auto createRadialGradient()(double x0, double y0, double r0, double x1, double y1, double r1) {
    return CanvasGradient(CanvasFillStrokeStyles_createRadialGradient(this.handle, x0, y0, r0, x1, y1, r1));
  }
  auto createPattern()(scope ref CanvasImageSource image, string repetition) {
    return CanvasFillStrokeStyles_createPattern(this.handle, image, repetition);
  }
  void shadowOffsetX()(double shadowOffsetX) {
    Object_Call_double__void(this.handle, "shadowOffsetX", shadowOffsetX);
  }
  double shadowOffsetX()() {
    return Object_Getter__double(this.handle, "shadowOffsetX");
  }
  void shadowOffsetY()(double shadowOffsetY) {
    Object_Call_double__void(this.handle, "shadowOffsetY", shadowOffsetY);
  }
  double shadowOffsetY()() {
    return Object_Getter__double(this.handle, "shadowOffsetY");
  }
  void shadowBlur()(double shadowBlur) {
    Object_Call_double__void(this.handle, "shadowBlur", shadowBlur);
  }
  double shadowBlur()() {
    return Object_Getter__double(this.handle, "shadowBlur");
  }
  void shadowColor()(string shadowColor) {
    Object_Call_string__void(this.handle, "shadowColor", shadowColor);
  }
  string shadowColor()() {
    return Object_Getter__string(this.handle, "shadowColor");
  }
  void filter()(string filter) {
    Object_Call_string__void(this.handle, "filter", filter);
  }
  string filter()() {
    return Object_Getter__string(this.handle, "filter");
  }
  void clearRect()(double x, double y, double w, double h) {
    CanvasRect_clearRect(this.handle, x, y, w, h);
  }
  void fillRect()(double x, double y, double w, double h) {
    CanvasRect_fillRect(this.handle, x, y, w, h);
  }
  void strokeRect()(double x, double y, double w, double h) {
    CanvasRect_strokeRect(this.handle, x, y, w, h);
  }
  void beginPath()() {
    Object_Call__void(this.handle, "beginPath");
  }
  void fill()(CanvasWindingRule winding /* = "nonzero" */) {
    CanvasDrawPath_fill__CanvasWindingRule(this.handle, winding);
  }
  void fill()() {
    Object_Call__void(this.handle, "fill");
  }
  void fill()(scope ref Path2D path, CanvasWindingRule winding /* = "nonzero" */) {
    CanvasDrawPath_fill__Handle_CanvasWindingRule(this.handle, path.handle, winding);
  }
  void fill()(scope ref Path2D path) {
    Object_Call_Handle__void(this.handle, "fill", path.handle);
  }
  void stroke()() {
    Object_Call__void(this.handle, "stroke");
  }
  void stroke()(scope ref Path2D path) {
    Object_Call_Handle__void(this.handle, "stroke", path.handle);
  }
  void clip()(CanvasWindingRule winding /* = "nonzero" */) {
    CanvasDrawPath_clip__CanvasWindingRule(this.handle, winding);
  }
  void clip()() {
    Object_Call__void(this.handle, "clip");
  }
  void clip()(scope ref Path2D path, CanvasWindingRule winding /* = "nonzero" */) {
    CanvasDrawPath_clip__Handle_CanvasWindingRule(this.handle, path.handle, winding);
  }
  void clip()(scope ref Path2D path) {
    Object_Call_Handle__void(this.handle, "clip", path.handle);
  }
  bool isPointInPath()(double x, double y, CanvasWindingRule winding /* = "nonzero" */) {
    return CanvasDrawPath_isPointInPath__double_double_CanvasWindingRule(this.handle, x, y, winding);
  }
  bool isPointInPath()(double x, double y) {
    return CanvasDrawPath_isPointInPath_0_double_double(this.handle, x, y);
  }
  bool isPointInPath()(scope ref Path2D path, double x, double y, CanvasWindingRule winding /* = "nonzero" */) {
    return CanvasDrawPath_isPointInPath__Handle_double_double_CanvasWindingRule(this.handle, path.handle, x, y, winding);
  }
  bool isPointInPath()(scope ref Path2D path, double x, double y) {
    return CanvasDrawPath_isPointInPath_0_Handle_double_double(this.handle, path.handle, x, y);
  }
  bool isPointInStroke()(double x, double y) {
    return CanvasDrawPath_isPointInStroke__double_double(this.handle, x, y);
  }
  bool isPointInStroke()(scope ref Path2D path, double x, double y) {
    return CanvasDrawPath_isPointInStroke__Handle_double_double(this.handle, path.handle, x, y);
  }
  void drawFocusIfNeeded()(scope ref Element element) {
    Object_Call_Handle__void(this.handle, "drawFocusIfNeeded", element._parent);
  }
  void fillText()(string text, double x, double y, double maxWidth) {
    CanvasText_fillText(this.handle, text, x, y, maxWidth);
  }
  void fillText()(string text, double x, double y) {
    CanvasText_fillText_0(this.handle, text, x, y);
  }
  void strokeText()(string text, double x, double y, double maxWidth) {
    CanvasText_strokeText(this.handle, text, x, y, maxWidth);
  }
  void strokeText()(string text, double x, double y) {
    CanvasText_strokeText_0(this.handle, text, x, y);
  }
  auto measureText()(string text) {
    return TextMetrics(Object_Call_string__Handle(this.handle, "measureText", text));
  }
  void drawImage()(scope ref CanvasImageSource image, double dx, double dy) {
    CanvasDrawImage_drawImage__CanvasImageSource_double_double(this.handle, image, dx, dy);
  }
  void drawImage()(scope ref CanvasImageSource image, double dx, double dy, double dw, double dh) {
    CanvasDrawImage_drawImage__CanvasImageSource_double_double_double_double(this.handle, image, dx, dy, dw, dh);
  }
  void drawImage()(scope ref CanvasImageSource image, double sx, double sy, double sw, double sh, double dx, double dy, double dw, double dh) {
    CanvasDrawImage_drawImage__CanvasImageSource_double_double_double_double_double_double_double_double(this.handle, image, sx, sy, sw, sh, dx, dy, dw, dh);
  }
  auto createImageData()(double sw, double sh) {
    return ImageData(CanvasImageData_createImageData__double_double(this.handle, sw, sh));
  }
  auto createImageData()(scope ref ImageData imagedata) {
    return ImageData(Object_Call_Handle__Handle(this.handle, "createImageData", imagedata.handle));
  }
  auto getImageData()(double sx, double sy, double sw, double sh) {
    return ImageData(CanvasImageData_getImageData(this.handle, sx, sy, sw, sh));
  }
  void putImageData()(scope ref ImageData imagedata, double dx, double dy) {
    CanvasImageData_putImageData__Handle_double_double(this.handle, imagedata.handle, dx, dy);
  }
  void putImageData()(scope ref ImageData imagedata, double dx, double dy, double dirtyX, double dirtyY, double dirtyWidth, double dirtyHeight) {
    CanvasImageData_putImageData__Handle_double_double_double_double_double_double(this.handle, imagedata.handle, dx, dy, dirtyX, dirtyY, dirtyWidth, dirtyHeight);
  }
  void lineWidth()(double lineWidth) {
    Object_Call_double__void(this.handle, "lineWidth", lineWidth);
  }
  double lineWidth()() {
    return Object_Getter__double(this.handle, "lineWidth");
  }
  void lineCap()(string lineCap) {
    Object_Call_string__void(this.handle, "lineCap", lineCap);
  }
  string lineCap()() {
    return Object_Getter__string(this.handle, "lineCap");
  }
  void lineJoin()(string lineJoin) {
    Object_Call_string__void(this.handle, "lineJoin", lineJoin);
  }
  string lineJoin()() {
    return Object_Getter__string(this.handle, "lineJoin");
  }
  void miterLimit()(double miterLimit) {
    Object_Call_double__void(this.handle, "miterLimit", miterLimit);
  }
  double miterLimit()() {
    return Object_Getter__double(this.handle, "miterLimit");
  }
  void setLineDash()(scope ref Sequence!(double) segments) {
    Object_Call_Handle__void(this.handle, "setLineDash", segments.handle);
  }
  auto getLineDash()() {
    return Sequence!(double)(Object_Getter__Handle(this.handle, "getLineDash"));
  }
  void lineDashOffset()(double lineDashOffset) {
    Object_Call_double__void(this.handle, "lineDashOffset", lineDashOffset);
  }
  double lineDashOffset()() {
    return Object_Getter__double(this.handle, "lineDashOffset");
  }
  void font()(string font) {
    Object_Call_string__void(this.handle, "font", font);
  }
  string font()() {
    return Object_Getter__string(this.handle, "font");
  }
  void textAlign()(string textAlign) {
    Object_Call_string__void(this.handle, "textAlign", textAlign);
  }
  string textAlign()() {
    return Object_Getter__string(this.handle, "textAlign");
  }
  void textBaseline()(string textBaseline) {
    Object_Call_string__void(this.handle, "textBaseline", textBaseline);
  }
  string textBaseline()() {
    return Object_Getter__string(this.handle, "textBaseline");
  }
  void closePath()() {
    Object_Call__void(this.handle, "closePath");
  }
  void moveTo()(double x, double y) {
    Object_Call_double_double__void(this.handle, "moveTo", x, y);
  }
  void lineTo()(double x, double y) {
    Object_Call_double_double__void(this.handle, "lineTo", x, y);
  }
  void quadraticCurveTo()(double cpx, double cpy, double x, double y) {
    CanvasPathMethods_quadraticCurveTo(this.handle, cpx, cpy, x, y);
  }
  void bezierCurveTo()(double cp1x, double cp1y, double cp2x, double cp2y, double x, double y) {
    CanvasPathMethods_bezierCurveTo(this.handle, cp1x, cp1y, cp2x, cp2y, x, y);
  }
  void arcTo()(double x1, double y1, double x2, double y2, double radius) {
    CanvasPathMethods_arcTo(this.handle, x1, y1, x2, y2, radius);
  }
  void rect()(double x, double y, double w, double h) {
    CanvasPathMethods_rect(this.handle, x, y, w, h);
  }
  void arc()(double x, double y, double radius, double startAngle, double endAngle, bool anticlockwise /* = false */) {
    CanvasPathMethods_arc(this.handle, x, y, radius, startAngle, endAngle, anticlockwise);
  }
  void arc()(double x, double y, double radius, double startAngle, double endAngle) {
    CanvasPathMethods_arc_0(this.handle, x, y, radius, startAngle, endAngle);
  }
  void ellipse()(double x, double y, double radiusX, double radiusY, double rotation, double startAngle, double endAngle, bool anticlockwise /* = false */) {
    CanvasPathMethods_ellipse(this.handle, x, y, radiusX, radiusY, rotation, startAngle, endAngle, anticlockwise);
  }
  void ellipse()(double x, double y, double radiusX, double radiusY, double rotation, double startAngle, double endAngle) {
    CanvasPathMethods_ellipse_0(this.handle, x, y, radiusX, radiusY, rotation, startAngle, endAngle);
  }
  void addHitRegion()(scope ref HitRegionOptions options) {
    Object_Call_Handle__void(this.handle, "addHitRegion", options.handle);
  }
  void addHitRegion()() {
    Object_Call__void(this.handle, "addHitRegion");
  }
  void removeHitRegion()(string id) {
    Object_Call_string__void(this.handle, "removeHitRegion", id);
  }
  void clearHitRegions()() {
    Object_Call__void(this.handle, "clearHitRegions");
  }
}
struct CanvasShadowStyles {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void shadowOffsetX()(double shadowOffsetX) {
    Object_Call_double__void(this.handle, "shadowOffsetX", shadowOffsetX);
  }
  double shadowOffsetX()() {
    return Object_Getter__double(this.handle, "shadowOffsetX");
  }
  void shadowOffsetY()(double shadowOffsetY) {
    Object_Call_double__void(this.handle, "shadowOffsetY", shadowOffsetY);
  }
  double shadowOffsetY()() {
    return Object_Getter__double(this.handle, "shadowOffsetY");
  }
  void shadowBlur()(double shadowBlur) {
    Object_Call_double__void(this.handle, "shadowBlur", shadowBlur);
  }
  double shadowBlur()() {
    return Object_Getter__double(this.handle, "shadowBlur");
  }
  void shadowColor()(string shadowColor) {
    Object_Call_string__void(this.handle, "shadowColor", shadowColor);
  }
  string shadowColor()() {
    return Object_Getter__string(this.handle, "shadowColor");
  }
}
struct CanvasState {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void save()() {
    Object_Call__void(this.handle, "save");
  }
  void restore()() {
    Object_Call__void(this.handle, "restore");
  }
}
struct CanvasText {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void fillText()(string text, double x, double y, double maxWidth) {
    CanvasText_fillText(this.handle, text, x, y, maxWidth);
  }
  void fillText()(string text, double x, double y) {
    CanvasText_fillText_0(this.handle, text, x, y);
  }
  void strokeText()(string text, double x, double y, double maxWidth) {
    CanvasText_strokeText(this.handle, text, x, y, maxWidth);
  }
  void strokeText()(string text, double x, double y) {
    CanvasText_strokeText_0(this.handle, text, x, y);
  }
  auto measureText()(string text) {
    return TextMetrics(Object_Call_string__Handle(this.handle, "measureText", text));
  }
}
struct CanvasTextDrawingStyles {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void font()(string font) {
    Object_Call_string__void(this.handle, "font", font);
  }
  string font()() {
    return Object_Getter__string(this.handle, "font");
  }
  void textAlign()(string textAlign) {
    Object_Call_string__void(this.handle, "textAlign", textAlign);
  }
  string textAlign()() {
    return Object_Getter__string(this.handle, "textAlign");
  }
  void textBaseline()(string textBaseline) {
    Object_Call_string__void(this.handle, "textBaseline", textBaseline);
  }
  string textBaseline()() {
    return Object_Getter__string(this.handle, "textBaseline");
  }
}
struct CanvasTransform {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void scale()(double x, double y) {
    Object_Call_double_double__void(this.handle, "scale", x, y);
  }
  void rotate()(double angle) {
    Object_Call_double__void(this.handle, "rotate", angle);
  }
  void translate()(double x, double y) {
    Object_Call_double_double__void(this.handle, "translate", x, y);
  }
  void transform()(double a, double b, double c, double d, double e, double f) {
    CanvasTransform_transform(this.handle, a, b, c, d, e, f);
  }
  void setTransform()(double a, double b, double c, double d, double e, double f) {
    CanvasTransform_setTransform(this.handle, a, b, c, d, e, f);
  }
  void resetTransform()() {
    Object_Call__void(this.handle, "resetTransform");
  }
}
struct CanvasUserInterface {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void drawFocusIfNeeded()(scope ref Element element) {
    Object_Call_Handle__void(this.handle, "drawFocusIfNeeded", element._parent);
  }
}
enum CanvasWindingRule {
  nonzero,
  evenodd
}
struct ContextAttributes2D {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ContextAttributes2D(spasm_add__object());
  }
  void willReadFrequently()(bool willReadFrequently) {
    Object_Call_bool__void(this.handle, "willReadFrequently", willReadFrequently);
  }
  bool willReadFrequently()() {
    return Object_Getter__bool(this.handle, "willReadFrequently");
  }
  void alpha()(bool alpha) {
    Object_Call_bool__void(this.handle, "alpha", alpha);
  }
  bool alpha()() {
    return Object_Getter__bool(this.handle, "alpha");
  }
}
alias HTMLOrSVGImageElement = SumType!(HTMLImageElement, SVGImageElement);
struct HitRegionOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return HitRegionOptions(spasm_add__object());
  }
  void path(T0)(scope auto ref Optional!(T0) path) if (isTOrPointer!(T0, Path2D)) {
    HitRegionOptions_path_Set(this.handle, !path.empty, path.front.handle);
  }
  auto path()() {
    return Object_Getter__OptionalHandle(this.handle, "path");
  }
  void id()(string id) {
    Object_Call_string__void(this.handle, "id", id);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  void control(T0)(scope auto ref Optional!(T0) control) if (isTOrPointer!(T0, Element)) {
    HitRegionOptions_control_Set(this.handle, !control.empty, control.front._parent);
  }
  auto control()() {
    return Object_Getter__OptionalHandle(this.handle, "control");
  }
}
struct Path2D {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void addPath()(scope ref Path2D path, scope ref SVGMatrix transformation) {
    Path2D_addPath(this.handle, path.handle, transformation.handle);
  }
  void addPath()(scope ref Path2D path) {
    Object_Call_Handle__void(this.handle, "addPath", path.handle);
  }
  void closePath()() {
    Object_Call__void(this.handle, "closePath");
  }
  void moveTo()(double x, double y) {
    Object_Call_double_double__void(this.handle, "moveTo", x, y);
  }
  void lineTo()(double x, double y) {
    Object_Call_double_double__void(this.handle, "lineTo", x, y);
  }
  void quadraticCurveTo()(double cpx, double cpy, double x, double y) {
    CanvasPathMethods_quadraticCurveTo(this.handle, cpx, cpy, x, y);
  }
  void bezierCurveTo()(double cp1x, double cp1y, double cp2x, double cp2y, double x, double y) {
    CanvasPathMethods_bezierCurveTo(this.handle, cp1x, cp1y, cp2x, cp2y, x, y);
  }
  void arcTo()(double x1, double y1, double x2, double y2, double radius) {
    CanvasPathMethods_arcTo(this.handle, x1, y1, x2, y2, radius);
  }
  void rect()(double x, double y, double w, double h) {
    CanvasPathMethods_rect(this.handle, x, y, w, h);
  }
  void arc()(double x, double y, double radius, double startAngle, double endAngle, bool anticlockwise /* = false */) {
    CanvasPathMethods_arc(this.handle, x, y, radius, startAngle, endAngle, anticlockwise);
  }
  void arc()(double x, double y, double radius, double startAngle, double endAngle) {
    CanvasPathMethods_arc_0(this.handle, x, y, radius, startAngle, endAngle);
  }
  void ellipse()(double x, double y, double radiusX, double radiusY, double rotation, double startAngle, double endAngle, bool anticlockwise /* = false */) {
    CanvasPathMethods_ellipse(this.handle, x, y, radiusX, radiusY, rotation, startAngle, endAngle, anticlockwise);
  }
  void ellipse()(double x, double y, double radiusX, double radiusY, double rotation, double startAngle, double endAngle) {
    CanvasPathMethods_ellipse_0(this.handle, x, y, radiusX, radiusY, rotation, startAngle, endAngle);
  }
}
struct TextMetrics {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  double width()() {
    return Object_Getter__double(this.handle, "width");
  }
}


extern (C) void CanvasDrawImage_drawImage__CanvasImageSource_double_double(Handle, scope ref CanvasImageSource, double, double);
extern (C) void CanvasDrawImage_drawImage__CanvasImageSource_double_double_double_double(Handle, scope ref CanvasImageSource, double, double, double, double);
extern (C) void CanvasDrawImage_drawImage__CanvasImageSource_double_double_double_double_double_double_double_double(Handle, scope ref CanvasImageSource, double, double, double, double, double, double, double, double);
extern (C) void CanvasDrawPath_fill__CanvasWindingRule(Handle, CanvasWindingRule);
extern (C) void CanvasDrawPath_fill__Handle_CanvasWindingRule(Handle, Handle, CanvasWindingRule);
extern (C) void CanvasDrawPath_clip__CanvasWindingRule(Handle, CanvasWindingRule);
extern (C) void CanvasDrawPath_clip__Handle_CanvasWindingRule(Handle, Handle, CanvasWindingRule);
extern (C) bool CanvasDrawPath_isPointInPath__double_double_CanvasWindingRule(Handle, double, double, CanvasWindingRule);
extern (C) bool CanvasDrawPath_isPointInPath_0_double_double(Handle, double, double);
extern (C) bool CanvasDrawPath_isPointInPath__Handle_double_double_CanvasWindingRule(Handle, Handle, double, double, CanvasWindingRule);
extern (C) bool CanvasDrawPath_isPointInPath_0_Handle_double_double(Handle, Handle, double, double);
extern (C) bool CanvasDrawPath_isPointInStroke__double_double(Handle, double, double);
extern (C) bool CanvasDrawPath_isPointInStroke__Handle_double_double(Handle, Handle, double, double);
extern (C) void CanvasFillStrokeStyles_strokeStyle_Set(Handle, scope ref SumType!(string, CanvasGradient, CanvasPattern));
extern (C) void CanvasFillStrokeStyles_fillStyle_Set(Handle, scope ref SumType!(string, CanvasGradient, CanvasPattern));
extern (C) Handle CanvasFillStrokeStyles_createLinearGradient(Handle, double, double, double, double);
extern (C) Handle CanvasFillStrokeStyles_createRadialGradient(Handle, double, double, double, double, double, double);
extern (C) Optional!(CanvasPattern) CanvasFillStrokeStyles_createPattern(Handle, scope ref CanvasImageSource, string);
extern (C) void CanvasGradient_addColorStop(Handle, float, string);
extern (C) Handle CanvasImageData_createImageData__double_double(Handle, double, double);
extern (C) Handle CanvasImageData_getImageData(Handle, double, double, double, double);
extern (C) void CanvasImageData_putImageData__Handle_double_double(Handle, Handle, double, double);
extern (C) void CanvasImageData_putImageData__Handle_double_double_double_double_double_double(Handle, Handle, double, double, double, double, double, double);
extern (C) void CanvasPathMethods_quadraticCurveTo(Handle, double, double, double, double);
extern (C) void CanvasPathMethods_bezierCurveTo(Handle, double, double, double, double, double, double);
extern (C) void CanvasPathMethods_arcTo(Handle, double, double, double, double, double);
extern (C) void CanvasPathMethods_rect(Handle, double, double, double, double);
extern (C) void CanvasPathMethods_arc(Handle, double, double, double, double, double, bool);
extern (C) void CanvasPathMethods_arc_0(Handle, double, double, double, double, double);
extern (C) void CanvasPathMethods_ellipse(Handle, double, double, double, double, double, double, double, bool);
extern (C) void CanvasPathMethods_ellipse_0(Handle, double, double, double, double, double, double, double);
extern (C) void CanvasRect_clearRect(Handle, double, double, double, double);
extern (C) void CanvasRect_fillRect(Handle, double, double, double, double);
extern (C) void CanvasRect_strokeRect(Handle, double, double, double, double);
extern (C) void CanvasRenderingContext2D_drawWindow(Handle, Handle, double, double, double, double, string, uint);
extern (C) void CanvasRenderingContext2D_drawWindow_0(Handle, Handle, double, double, double, double, string);
extern (C) void CanvasText_fillText(Handle, string, double, double, double);
extern (C) void CanvasText_fillText_0(Handle, string, double, double);
extern (C) void CanvasText_strokeText(Handle, string, double, double, double);
extern (C) void CanvasText_strokeText_0(Handle, string, double, double);
extern (C) void CanvasTransform_transform(Handle, double, double, double, double, double, double);
extern (C) void CanvasTransform_setTransform(Handle, double, double, double, double, double, double);
extern (C) void HitRegionOptions_path_Set(Handle, bool, Handle);
extern (C) void HitRegionOptions_control_Set(Handle, bool, Handle);
extern (C) void Path2D_addPath(Handle, Handle, Handle);