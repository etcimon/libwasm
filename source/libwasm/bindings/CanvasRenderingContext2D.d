module libwasm.bindings.CanvasRenderingContext2D;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.HTMLCanvasElement;
import libwasm.bindings.HTMLImageElement;
import libwasm.bindings.HTMLVideoElement;
import libwasm.bindings.ImageBitmap;
import libwasm.bindings.ImageData;
import libwasm.bindings.SVGImageElement;
import libwasm.bindings.SVGMatrix;
import libwasm.bindings.Window;

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
    Serialize_Object_VarArgCall!void(this.handle, "drawImage", "SumType!(Handle,Handle,Handle,Handle,Handle);double;double", tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => 0),((ref image.Types[1] v) => 1),((ref image.Types[2] v) => 2),((ref image.Types[3] v) => 3),((ref image.Types[4] v) => 4))(image),tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => cast(Handle)v.handle),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => cast(Handle)v.handle),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => cast(Handle)v.handle),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => cast(Handle)v.handle),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => cast(Handle)v.handle))(image)), dx, dy));
  }
  void drawImage()(scope ref CanvasImageSource image, double dx, double dy, double dw, double dh) {
    Serialize_Object_VarArgCall!void(this.handle, "drawImage", "SumType!(Handle,Handle,Handle,Handle,Handle);double;double;double;double", tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => 0),((ref image.Types[1] v) => 1),((ref image.Types[2] v) => 2),((ref image.Types[3] v) => 3),((ref image.Types[4] v) => 4))(image),tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => cast(Handle)v.handle),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => cast(Handle)v.handle),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => cast(Handle)v.handle),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => cast(Handle)v.handle),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => cast(Handle)v.handle))(image)), dx, dy, dw, dh));
  }
  void drawImage()(scope ref CanvasImageSource image, double sx, double sy, double sw, double sh, double dx, double dy, double dw, double dh) {
    Serialize_Object_VarArgCall!void(this.handle, "drawImage", "SumType!(Handle,Handle,Handle,Handle,Handle);double;double;double;double;double;double;double;double", tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => 0),((ref image.Types[1] v) => 1),((ref image.Types[2] v) => 2),((ref image.Types[3] v) => 3),((ref image.Types[4] v) => 4))(image),tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => cast(Handle)v.handle),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => cast(Handle)v.handle),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => cast(Handle)v.handle),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => cast(Handle)v.handle),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => cast(Handle)v.handle))(image)), sx, sy, sw, sh, dx, dy, dw, dh));
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
    Object_Call_int__void(this.handle, "fill", winding);
  }
  void fill()() {
    Object_Call__void(this.handle, "fill");
  }
  void fill()(scope ref Path2D path, CanvasWindingRule winding /* = "nonzero" */) {
    Serialize_Object_VarArgCall!void(this.handle, "fill", "Handle;Enum", tuple(cast(Handle)path.handle, winding));
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
    Object_Call_int__void(this.handle, "clip", winding);
  }
  void clip()() {
    Object_Call__void(this.handle, "clip");
  }
  void clip()(scope ref Path2D path, CanvasWindingRule winding /* = "nonzero" */) {
    Serialize_Object_VarArgCall!void(this.handle, "clip", "Handle;Enum", tuple(cast(Handle)path.handle, winding));
  }
  void clip()(scope ref Path2D path) {
    Object_Call_Handle__void(this.handle, "clip", path.handle);
  }
  bool isPointInPath()(double x, double y, CanvasWindingRule winding /* = "nonzero" */) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isPointInPath", "double;double;Enum", tuple(x, y, winding));
  }
  bool isPointInPath()(double x, double y) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isPointInPath", "double;double", tuple(x, y));
  }
  bool isPointInPath()(scope ref Path2D path, double x, double y, CanvasWindingRule winding /* = "nonzero" */) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isPointInPath", "Handle;double;double;Enum", tuple(cast(Handle)path.handle, x, y, winding));
  }
  bool isPointInPath()(scope ref Path2D path, double x, double y) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isPointInPath", "Handle;double;double", tuple(cast(Handle)path.handle, x, y));
  }
  bool isPointInStroke()(double x, double y) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isPointInStroke", "double;double", tuple(x, y));
  }
  bool isPointInStroke()(scope ref Path2D path, double x, double y) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isPointInStroke", "Handle;double;double", tuple(cast(Handle)path.handle, x, y));
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
    Serialize_Object_VarArgCall!void(this.handle, "strokeStyle", "SumType!(string,Handle,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref strokeStyle.Types[1] v) => 1),((ref strokeStyle.Types[2] v) => 2))(strokeStyle),tuple(libwasm.sumtype.match!(((string v) => v),((ref strokeStyle.Types[1] v) => string.init),((ref strokeStyle.Types[2] v) => string.init))(strokeStyle),libwasm.sumtype.match!(((string v) => Handle.init),((ref strokeStyle.Types[1] v) => cast(Handle)v.handle),((ref strokeStyle.Types[2] v) => Handle.init))(strokeStyle),libwasm.sumtype.match!(((string v) => Handle.init),((ref strokeStyle.Types[1] v) => Handle.init),((ref strokeStyle.Types[2] v) => cast(Handle)v.handle))(strokeStyle))));
  }
  auto strokeStyle()() {
    return Object_Getter__Handle(this.handle, "strokeStyle");
  }
  void fillStyle()(scope ref SumType!(string, CanvasGradient, CanvasPattern) fillStyle) {
    Serialize_Object_VarArgCall!void(this.handle, "fillStyle", "SumType!(string,Handle,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref fillStyle.Types[1] v) => 1),((ref fillStyle.Types[2] v) => 2))(fillStyle),tuple(libwasm.sumtype.match!(((string v) => v),((ref fillStyle.Types[1] v) => string.init),((ref fillStyle.Types[2] v) => string.init))(fillStyle),libwasm.sumtype.match!(((string v) => Handle.init),((ref fillStyle.Types[1] v) => cast(Handle)v.handle),((ref fillStyle.Types[2] v) => Handle.init))(fillStyle),libwasm.sumtype.match!(((string v) => Handle.init),((ref fillStyle.Types[1] v) => Handle.init),((ref fillStyle.Types[2] v) => cast(Handle)v.handle))(fillStyle))));
  }
  auto fillStyle()() {
    return Object_Getter__Handle(this.handle, "fillStyle");
  }
  auto createLinearGradient()(double x0, double y0, double x1, double y1) {
    return CanvasGradient(Serialize_Object_VarArgCall!Handle(this.handle, "createLinearGradient", "double;double;double;double", tuple(x0, y0, x1, y1)));
  }
  auto createRadialGradient()(double x0, double y0, double r0, double x1, double y1, double r1) {
    return CanvasGradient(Serialize_Object_VarArgCall!Handle(this.handle, "createRadialGradient", "double;double;double;double;double;double", tuple(x0, y0, r0, x1, y1, r1)));
  }
  auto createPattern()(scope ref CanvasImageSource image, string repetition) {
    return recastOpt!(CanvasPattern)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "createPattern", "SumType!(Handle,Handle,Handle,Handle,Handle);string", tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => 0),((ref image.Types[1] v) => 1),((ref image.Types[2] v) => 2),((ref image.Types[3] v) => 3),((ref image.Types[4] v) => 4))(image),tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => cast(Handle)v.handle),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => cast(Handle)v.handle),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => cast(Handle)v.handle),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => cast(Handle)v.handle),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => cast(Handle)v.handle))(image)), repetition)));
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
    Serialize_Object_VarArgCall!void(this.handle, "addColorStop", "float;string", tuple(offset, color));
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
    return ImageData(Serialize_Object_VarArgCall!Handle(this.handle, "createImageData", "double;double", tuple(sw, sh)));
  }
  auto createImageData()(scope ref ImageData imagedata) {
    return ImageData(Object_Call_Handle__Handle(this.handle, "createImageData", imagedata.handle));
  }
  auto getImageData()(double sx, double sy, double sw, double sh) {
    return ImageData(Serialize_Object_VarArgCall!Handle(this.handle, "getImageData", "double;double;double;double", tuple(sx, sy, sw, sh)));
  }
  void putImageData()(scope ref ImageData imagedata, double dx, double dy) {
    Serialize_Object_VarArgCall!void(this.handle, "putImageData", "Handle;double;double", tuple(cast(Handle)imagedata.handle, dx, dy));
  }
  void putImageData()(scope ref ImageData imagedata, double dx, double dy, double dirtyX, double dirtyY, double dirtyWidth, double dirtyHeight) {
    Serialize_Object_VarArgCall!void(this.handle, "putImageData", "Handle;double;double;double;double;double;double", tuple(cast(Handle)imagedata.handle, dx, dy, dirtyX, dirtyY, dirtyWidth, dirtyHeight));
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
    Serialize_Object_VarArgCall!void(this.handle, "quadraticCurveTo", "double;double;double;double", tuple(cpx, cpy, x, y));
  }
  void bezierCurveTo()(double cp1x, double cp1y, double cp2x, double cp2y, double x, double y) {
    Serialize_Object_VarArgCall!void(this.handle, "bezierCurveTo", "double;double;double;double;double;double", tuple(cp1x, cp1y, cp2x, cp2y, x, y));
  }
  void arcTo()(double x1, double y1, double x2, double y2, double radius) {
    Serialize_Object_VarArgCall!void(this.handle, "arcTo", "double;double;double;double;double", tuple(x1, y1, x2, y2, radius));
  }
  void rect()(double x, double y, double w, double h) {
    Serialize_Object_VarArgCall!void(this.handle, "rect", "double;double;double;double", tuple(x, y, w, h));
  }
  void arc()(double x, double y, double radius, double startAngle, double endAngle, bool anticlockwise /* = false */) {
    Serialize_Object_VarArgCall!void(this.handle, "arc", "double;double;double;double;double;bool", tuple(x, y, radius, startAngle, endAngle, anticlockwise));
  }
  void arc()(double x, double y, double radius, double startAngle, double endAngle) {
    Serialize_Object_VarArgCall!void(this.handle, "arc", "double;double;double;double;double", tuple(x, y, radius, startAngle, endAngle));
  }
  void ellipse()(double x, double y, double radiusX, double radiusY, double rotation, double startAngle, double endAngle, bool anticlockwise /* = false */) {
    Serialize_Object_VarArgCall!void(this.handle, "ellipse", "double;double;double;double;double;double;double;bool", tuple(x, y, radiusX, radiusY, rotation, startAngle, endAngle, anticlockwise));
  }
  void ellipse()(double x, double y, double radiusX, double radiusY, double rotation, double startAngle, double endAngle) {
    Serialize_Object_VarArgCall!void(this.handle, "ellipse", "double;double;double;double;double;double;double", tuple(x, y, radiusX, radiusY, rotation, startAngle, endAngle));
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
    Serialize_Object_VarArgCall!void(this.handle, "clearRect", "double;double;double;double", tuple(x, y, w, h));
  }
  void fillRect()(double x, double y, double w, double h) {
    Serialize_Object_VarArgCall!void(this.handle, "fillRect", "double;double;double;double", tuple(x, y, w, h));
  }
  void strokeRect()(double x, double y, double w, double h) {
    Serialize_Object_VarArgCall!void(this.handle, "strokeRect", "double;double;double;double", tuple(x, y, w, h));
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
    return recastOpt!(HTMLCanvasElement)(Object_Getter__OptionalHandle(this.handle, "canvas"));
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
    Serialize_Object_VarArgCall!void(this.handle, "drawWindow", "Handle;double;double;double;double;string;uint", tuple(cast(Handle)window._parent, x, y, w, h, bgColor, flags));
  }
  void drawWindow()(scope ref Window window, double x, double y, double w, double h, string bgColor) {
    Serialize_Object_VarArgCall!void(this.handle, "drawWindow", "Handle;double;double;double;double;string", tuple(cast(Handle)window._parent, x, y, w, h, bgColor));
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
    Serialize_Object_VarArgCall!void(this.handle, "transform", "double;double;double;double;double;double", tuple(a, b, c, d, e, f));
  }
  void setTransform()(double a, double b, double c, double d, double e, double f) {
    Serialize_Object_VarArgCall!void(this.handle, "setTransform", "double;double;double;double;double;double", tuple(a, b, c, d, e, f));
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
    Serialize_Object_VarArgCall!void(this.handle, "strokeStyle", "SumType!(string,Handle,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref strokeStyle.Types[1] v) => 1),((ref strokeStyle.Types[2] v) => 2))(strokeStyle),tuple(libwasm.sumtype.match!(((string v) => v),((ref strokeStyle.Types[1] v) => string.init),((ref strokeStyle.Types[2] v) => string.init))(strokeStyle),libwasm.sumtype.match!(((string v) => Handle.init),((ref strokeStyle.Types[1] v) => cast(Handle)v.handle),((ref strokeStyle.Types[2] v) => Handle.init))(strokeStyle),libwasm.sumtype.match!(((string v) => Handle.init),((ref strokeStyle.Types[1] v) => Handle.init),((ref strokeStyle.Types[2] v) => cast(Handle)v.handle))(strokeStyle))));
  }
  auto strokeStyle()() {
    return Object_Getter__Handle(this.handle, "strokeStyle");
  }
  void fillStyle()(scope ref SumType!(string, CanvasGradient, CanvasPattern) fillStyle) {
    Serialize_Object_VarArgCall!void(this.handle, "fillStyle", "SumType!(string,Handle,Handle)", tuple(libwasm.sumtype.match!(((string v) => 0),((ref fillStyle.Types[1] v) => 1),((ref fillStyle.Types[2] v) => 2))(fillStyle),tuple(libwasm.sumtype.match!(((string v) => v),((ref fillStyle.Types[1] v) => string.init),((ref fillStyle.Types[2] v) => string.init))(fillStyle),libwasm.sumtype.match!(((string v) => Handle.init),((ref fillStyle.Types[1] v) => cast(Handle)v.handle),((ref fillStyle.Types[2] v) => Handle.init))(fillStyle),libwasm.sumtype.match!(((string v) => Handle.init),((ref fillStyle.Types[1] v) => Handle.init),((ref fillStyle.Types[2] v) => cast(Handle)v.handle))(fillStyle))));
  }
  auto fillStyle()() {
    return Object_Getter__Handle(this.handle, "fillStyle");
  }
  auto createLinearGradient()(double x0, double y0, double x1, double y1) {
    return CanvasGradient(Serialize_Object_VarArgCall!Handle(this.handle, "createLinearGradient", "double;double;double;double", tuple(x0, y0, x1, y1)));
  }
  auto createRadialGradient()(double x0, double y0, double r0, double x1, double y1, double r1) {
    return CanvasGradient(Serialize_Object_VarArgCall!Handle(this.handle, "createRadialGradient", "double;double;double;double;double;double", tuple(x0, y0, r0, x1, y1, r1)));
  }
  auto createPattern()(scope ref CanvasImageSource image, string repetition) {
    return recastOpt!(CanvasPattern)(Serialize_Object_VarArgCall!(Optional!Handle)(this.handle, "createPattern", "SumType!(Handle,Handle,Handle,Handle,Handle);string", tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => 0),((ref image.Types[1] v) => 1),((ref image.Types[2] v) => 2),((ref image.Types[3] v) => 3),((ref image.Types[4] v) => 4))(image),tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => cast(Handle)v.handle),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => cast(Handle)v.handle),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => cast(Handle)v.handle),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => cast(Handle)v.handle),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => cast(Handle)v.handle))(image)), repetition)));
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
    Serialize_Object_VarArgCall!void(this.handle, "clearRect", "double;double;double;double", tuple(x, y, w, h));
  }
  void fillRect()(double x, double y, double w, double h) {
    Serialize_Object_VarArgCall!void(this.handle, "fillRect", "double;double;double;double", tuple(x, y, w, h));
  }
  void strokeRect()(double x, double y, double w, double h) {
    Serialize_Object_VarArgCall!void(this.handle, "strokeRect", "double;double;double;double", tuple(x, y, w, h));
  }
  void beginPath()() {
    Object_Call__void(this.handle, "beginPath");
  }
  void fill()(CanvasWindingRule winding /* = "nonzero" */) {
    Object_Call_int__void(this.handle, "fill", winding);
  }
  void fill()() {
    Object_Call__void(this.handle, "fill");
  }
  void fill()(scope ref Path2D path, CanvasWindingRule winding /* = "nonzero" */) {
    Serialize_Object_VarArgCall!void(this.handle, "fill", "Handle;Enum", tuple(cast(Handle)path.handle, winding));
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
    Object_Call_int__void(this.handle, "clip", winding);
  }
  void clip()() {
    Object_Call__void(this.handle, "clip");
  }
  void clip()(scope ref Path2D path, CanvasWindingRule winding /* = "nonzero" */) {
    Serialize_Object_VarArgCall!void(this.handle, "clip", "Handle;Enum", tuple(cast(Handle)path.handle, winding));
  }
  void clip()(scope ref Path2D path) {
    Object_Call_Handle__void(this.handle, "clip", path.handle);
  }
  bool isPointInPath()(double x, double y, CanvasWindingRule winding /* = "nonzero" */) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isPointInPath", "double;double;Enum", tuple(x, y, winding));
  }
  bool isPointInPath()(double x, double y) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isPointInPath", "double;double", tuple(x, y));
  }
  bool isPointInPath()(scope ref Path2D path, double x, double y, CanvasWindingRule winding /* = "nonzero" */) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isPointInPath", "Handle;double;double;Enum", tuple(cast(Handle)path.handle, x, y, winding));
  }
  bool isPointInPath()(scope ref Path2D path, double x, double y) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isPointInPath", "Handle;double;double", tuple(cast(Handle)path.handle, x, y));
  }
  bool isPointInStroke()(double x, double y) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isPointInStroke", "double;double", tuple(x, y));
  }
  bool isPointInStroke()(scope ref Path2D path, double x, double y) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isPointInStroke", "Handle;double;double", tuple(cast(Handle)path.handle, x, y));
  }
  void drawFocusIfNeeded()(scope ref Element element) {
    Object_Call_Handle__void(this.handle, "drawFocusIfNeeded", element._parent);
  }
  void fillText()(string text, double x, double y, double maxWidth) {
    Serialize_Object_VarArgCall!void(this.handle, "fillText", "string;double;double;double", tuple(text, x, y, maxWidth));
  }
  void fillText()(string text, double x, double y) {
    Serialize_Object_VarArgCall!void(this.handle, "fillText", "string;double;double", tuple(text, x, y));
  }
  void strokeText()(string text, double x, double y, double maxWidth) {
    Serialize_Object_VarArgCall!void(this.handle, "strokeText", "string;double;double;double", tuple(text, x, y, maxWidth));
  }
  void strokeText()(string text, double x, double y) {
    Serialize_Object_VarArgCall!void(this.handle, "strokeText", "string;double;double", tuple(text, x, y));
  }
  auto measureText()(string text) {
    return TextMetrics(Object_Call_string__Handle(this.handle, "measureText", text));
  }
  void drawImage()(scope ref CanvasImageSource image, double dx, double dy) {
    Serialize_Object_VarArgCall!void(this.handle, "drawImage", "SumType!(Handle,Handle,Handle,Handle,Handle);double;double", tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => 0),((ref image.Types[1] v) => 1),((ref image.Types[2] v) => 2),((ref image.Types[3] v) => 3),((ref image.Types[4] v) => 4))(image),tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => cast(Handle)v.handle),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => cast(Handle)v.handle),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => cast(Handle)v.handle),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => cast(Handle)v.handle),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => cast(Handle)v.handle))(image)), dx, dy));
  }
  void drawImage()(scope ref CanvasImageSource image, double dx, double dy, double dw, double dh) {
    Serialize_Object_VarArgCall!void(this.handle, "drawImage", "SumType!(Handle,Handle,Handle,Handle,Handle);double;double;double;double", tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => 0),((ref image.Types[1] v) => 1),((ref image.Types[2] v) => 2),((ref image.Types[3] v) => 3),((ref image.Types[4] v) => 4))(image),tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => cast(Handle)v.handle),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => cast(Handle)v.handle),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => cast(Handle)v.handle),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => cast(Handle)v.handle),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => cast(Handle)v.handle))(image)), dx, dy, dw, dh));
  }
  void drawImage()(scope ref CanvasImageSource image, double sx, double sy, double sw, double sh, double dx, double dy, double dw, double dh) {
    Serialize_Object_VarArgCall!void(this.handle, "drawImage", "SumType!(Handle,Handle,Handle,Handle,Handle);double;double;double;double;double;double;double;double", tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => 0),((ref image.Types[1] v) => 1),((ref image.Types[2] v) => 2),((ref image.Types[3] v) => 3),((ref image.Types[4] v) => 4))(image),tuple(libwasm.sumtype.match!(((ref image.Types[0] v) => cast(Handle)v.handle),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => cast(Handle)v.handle),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => cast(Handle)v.handle),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => cast(Handle)v.handle),((ref image.Types[4] v) => Handle.init))(image),libwasm.sumtype.match!(((ref image.Types[0] v) => Handle.init),((ref image.Types[1] v) => Handle.init),((ref image.Types[2] v) => Handle.init),((ref image.Types[3] v) => Handle.init),((ref image.Types[4] v) => cast(Handle)v.handle))(image)), sx, sy, sw, sh, dx, dy, dw, dh));
  }
  auto createImageData()(double sw, double sh) {
    return ImageData(Serialize_Object_VarArgCall!Handle(this.handle, "createImageData", "double;double", tuple(sw, sh)));
  }
  auto createImageData()(scope ref ImageData imagedata) {
    return ImageData(Object_Call_Handle__Handle(this.handle, "createImageData", imagedata.handle));
  }
  auto getImageData()(double sx, double sy, double sw, double sh) {
    return ImageData(Serialize_Object_VarArgCall!Handle(this.handle, "getImageData", "double;double;double;double", tuple(sx, sy, sw, sh)));
  }
  void putImageData()(scope ref ImageData imagedata, double dx, double dy) {
    Serialize_Object_VarArgCall!void(this.handle, "putImageData", "Handle;double;double", tuple(cast(Handle)imagedata.handle, dx, dy));
  }
  void putImageData()(scope ref ImageData imagedata, double dx, double dy, double dirtyX, double dirtyY, double dirtyWidth, double dirtyHeight) {
    Serialize_Object_VarArgCall!void(this.handle, "putImageData", "Handle;double;double;double;double;double;double", tuple(cast(Handle)imagedata.handle, dx, dy, dirtyX, dirtyY, dirtyWidth, dirtyHeight));
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
    Serialize_Object_VarArgCall!void(this.handle, "quadraticCurveTo", "double;double;double;double", tuple(cpx, cpy, x, y));
  }
  void bezierCurveTo()(double cp1x, double cp1y, double cp2x, double cp2y, double x, double y) {
    Serialize_Object_VarArgCall!void(this.handle, "bezierCurveTo", "double;double;double;double;double;double", tuple(cp1x, cp1y, cp2x, cp2y, x, y));
  }
  void arcTo()(double x1, double y1, double x2, double y2, double radius) {
    Serialize_Object_VarArgCall!void(this.handle, "arcTo", "double;double;double;double;double", tuple(x1, y1, x2, y2, radius));
  }
  void rect()(double x, double y, double w, double h) {
    Serialize_Object_VarArgCall!void(this.handle, "rect", "double;double;double;double", tuple(x, y, w, h));
  }
  void arc()(double x, double y, double radius, double startAngle, double endAngle, bool anticlockwise /* = false */) {
    Serialize_Object_VarArgCall!void(this.handle, "arc", "double;double;double;double;double;bool", tuple(x, y, radius, startAngle, endAngle, anticlockwise));
  }
  void arc()(double x, double y, double radius, double startAngle, double endAngle) {
    Serialize_Object_VarArgCall!void(this.handle, "arc", "double;double;double;double;double", tuple(x, y, radius, startAngle, endAngle));
  }
  void ellipse()(double x, double y, double radiusX, double radiusY, double rotation, double startAngle, double endAngle, bool anticlockwise /* = false */) {
    Serialize_Object_VarArgCall!void(this.handle, "ellipse", "double;double;double;double;double;double;double;bool", tuple(x, y, radiusX, radiusY, rotation, startAngle, endAngle, anticlockwise));
  }
  void ellipse()(double x, double y, double radiusX, double radiusY, double rotation, double startAngle, double endAngle) {
    Serialize_Object_VarArgCall!void(this.handle, "ellipse", "double;double;double;double;double;double;double", tuple(x, y, radiusX, radiusY, rotation, startAngle, endAngle));
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
    Serialize_Object_VarArgCall!void(this.handle, "fillText", "string;double;double;double", tuple(text, x, y, maxWidth));
  }
  void fillText()(string text, double x, double y) {
    Serialize_Object_VarArgCall!void(this.handle, "fillText", "string;double;double", tuple(text, x, y));
  }
  void strokeText()(string text, double x, double y, double maxWidth) {
    Serialize_Object_VarArgCall!void(this.handle, "strokeText", "string;double;double;double", tuple(text, x, y, maxWidth));
  }
  void strokeText()(string text, double x, double y) {
    Serialize_Object_VarArgCall!void(this.handle, "strokeText", "string;double;double", tuple(text, x, y));
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
    Serialize_Object_VarArgCall!void(this.handle, "transform", "double;double;double;double;double;double", tuple(a, b, c, d, e, f));
  }
  void setTransform()(double a, double b, double c, double d, double e, double f) {
    Serialize_Object_VarArgCall!void(this.handle, "setTransform", "double;double;double;double;double;double", tuple(a, b, c, d, e, f));
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
    return ContextAttributes2D(libwasm_add__object());
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
    return HitRegionOptions(libwasm_add__object());
  }
  void path(T0)(scope auto ref Optional!(T0) path) if (isTOrPointer!(T0, Path2D)) {
    Serialize_Object_VarArgCall!void(this.handle, "path", "Optional!Handle", tuple(!path.empty, cast(Handle)path.front.handle));
  }
  auto path()() {
    return recastOpt!(Path2D)(Object_Getter__OptionalHandle(this.handle, "path"));
  }
  void id()(string id) {
    Object_Call_string__void(this.handle, "id", id);
  }
  string id()() {
    return Object_Getter__string(this.handle, "id");
  }
  void control(T0)(scope auto ref Optional!(T0) control) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this.handle, "control", "Optional!Handle", tuple(!control.empty, cast(Handle)control.front._parent));
  }
  auto control()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this.handle, "control"));
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
    Serialize_Object_VarArgCall!void(this.handle, "addPath", "Handle;Handle", tuple(cast(Handle)path.handle, cast(Handle)transformation.handle));
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
    Serialize_Object_VarArgCall!void(this.handle, "quadraticCurveTo", "double;double;double;double", tuple(cpx, cpy, x, y));
  }
  void bezierCurveTo()(double cp1x, double cp1y, double cp2x, double cp2y, double x, double y) {
    Serialize_Object_VarArgCall!void(this.handle, "bezierCurveTo", "double;double;double;double;double;double", tuple(cp1x, cp1y, cp2x, cp2y, x, y));
  }
  void arcTo()(double x1, double y1, double x2, double y2, double radius) {
    Serialize_Object_VarArgCall!void(this.handle, "arcTo", "double;double;double;double;double", tuple(x1, y1, x2, y2, radius));
  }
  void rect()(double x, double y, double w, double h) {
    Serialize_Object_VarArgCall!void(this.handle, "rect", "double;double;double;double", tuple(x, y, w, h));
  }
  void arc()(double x, double y, double radius, double startAngle, double endAngle, bool anticlockwise /* = false */) {
    Serialize_Object_VarArgCall!void(this.handle, "arc", "double;double;double;double;double;bool", tuple(x, y, radius, startAngle, endAngle, anticlockwise));
  }
  void arc()(double x, double y, double radius, double startAngle, double endAngle) {
    Serialize_Object_VarArgCall!void(this.handle, "arc", "double;double;double;double;double", tuple(x, y, radius, startAngle, endAngle));
  }
  void ellipse()(double x, double y, double radiusX, double radiusY, double rotation, double startAngle, double endAngle, bool anticlockwise /* = false */) {
    Serialize_Object_VarArgCall!void(this.handle, "ellipse", "double;double;double;double;double;double;double;bool", tuple(x, y, radiusX, radiusY, rotation, startAngle, endAngle, anticlockwise));
  }
  void ellipse()(double x, double y, double radiusX, double radiusY, double rotation, double startAngle, double endAngle) {
    Serialize_Object_VarArgCall!void(this.handle, "ellipse", "double;double;double;double;double;double;double", tuple(x, y, radiusX, radiusY, rotation, startAngle, endAngle));
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


