module libwasm.bindings.SVGSVGElement;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Element;
import libwasm.bindings.SVGAngle;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGAnimatedPreserveAspectRatio;
import libwasm.bindings.SVGAnimatedRect;
import libwasm.bindings.SVGFitToViewBox;
import libwasm.bindings.SVGGraphicsElement;
import libwasm.bindings.SVGLength;
import libwasm.bindings.SVGMatrix;
import libwasm.bindings.SVGNumber;
import libwasm.bindings.SVGPoint;
import libwasm.bindings.SVGRect;
import libwasm.bindings.SVGTransform;
import libwasm.bindings.SVGZoomAndPanValues;

@safe:
nothrow:

struct SVGSVGElement {
  nothrow:
  libwasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGraphicsElement(h);
  }
  auto x()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "x"));
  }
  auto y()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "y"));
  }
  auto width()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "width"));
  }
  auto height()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "height"));
  }
  bool useCurrentView()() {
    return Object_Getter__bool(this._parent, "useCurrentView");
  }
  void currentScale()(float currentScale) {
    Object_Call_float__void(this._parent, "currentScale", currentScale);
  }
  float currentScale()() {
    return Object_Getter__float(this._parent, "currentScale");
  }
  auto currentTranslate()() {
    return SVGPoint(Object_Getter__Handle(this._parent, "currentTranslate"));
  }
  uint suspendRedraw()(uint maxWaitMilliseconds) {
    return Serialize_Object_VarArgCall!uint(this._parent, "suspendRedraw", "uint", tuple(maxWaitMilliseconds));
  }
  void unsuspendRedraw()(uint suspendHandleID) {
    Object_Call_uint__void(this._parent, "unsuspendRedraw", suspendHandleID);
  }
  void unsuspendRedrawAll()() {
    Object_Call__void(this._parent, "unsuspendRedrawAll");
  }
  void forceRedraw()() {
    Object_Call__void(this._parent, "forceRedraw");
  }
  void pauseAnimations()() {
    Object_Call__void(this._parent, "pauseAnimations");
  }
  void unpauseAnimations()() {
    Object_Call__void(this._parent, "unpauseAnimations");
  }
  bool animationsPaused()() {
    return Object_Getter__bool(this._parent, "animationsPaused");
  }
  float getCurrentTime()() {
    return Object_Getter__float(this._parent, "getCurrentTime");
  }
  void setCurrentTime()(float seconds) {
    Object_Call_float__void(this._parent, "setCurrentTime", seconds);
  }
  void deselectAll()() {
    Object_Call__void(this._parent, "deselectAll");
  }
  auto createSVGNumber()() {
    return SVGNumber(Object_Getter__Handle(this._parent, "createSVGNumber"));
  }
  auto createSVGLength()() {
    return SVGLength(Object_Getter__Handle(this._parent, "createSVGLength"));
  }
  auto createSVGAngle()() {
    return SVGAngle(Object_Getter__Handle(this._parent, "createSVGAngle"));
  }
  auto createSVGPoint()() {
    return SVGPoint(Object_Getter__Handle(this._parent, "createSVGPoint"));
  }
  auto createSVGMatrix()() {
    return SVGMatrix(Object_Getter__Handle(this._parent, "createSVGMatrix"));
  }
  auto createSVGRect()() {
    return SVGRect(Object_Getter__Handle(this._parent, "createSVGRect"));
  }
  auto createSVGTransform()() {
    return SVGTransform(Object_Getter__Handle(this._parent, "createSVGTransform"));
  }
  auto createSVGTransformFromMatrix()(scope ref SVGMatrix matrix) {
    return SVGTransform(Object_Call_Handle__Handle(this._parent, "createSVGTransformFromMatrix", matrix.handle));
  }
  auto getElementById()(string elementId) {
    return recastOpt!(Element)(Object_Call_string__OptionalHandle(this._parent, "getElementById", elementId));
  }
  auto viewBox()() {
    return SVGAnimatedRect(Object_Getter__Handle(this._parent, "viewBox"));
  }
  auto preserveAspectRatio()() {
    return SVGAnimatedPreserveAspectRatio(Object_Getter__Handle(this._parent, "preserveAspectRatio"));
  }
  enum ushort SVG_ZOOMANDPAN_UNKNOWN = 0;
  enum ushort SVG_ZOOMANDPAN_DISABLE = 1;
  enum ushort SVG_ZOOMANDPAN_MAGNIFY = 2;
  void zoomAndPan()(ushort zoomAndPan) {
    Serialize_Object_VarArgCall!void(this._parent, "zoomAndPan", "ushort", tuple(zoomAndPan));
  }
  ushort zoomAndPan()() {
    return Object_Getter__ushort(this._parent, "zoomAndPan");
  }
}


