module spasm.bindings.SVGSVGElement;

import spasm.types;
import spasm.bindings.Element;
import spasm.bindings.SVGAngle;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGAnimatedPreserveAspectRatio;
import spasm.bindings.SVGAnimatedRect;
import spasm.bindings.SVGFitToViewBox;
import spasm.bindings.SVGGraphicsElement;
import spasm.bindings.SVGLength;
import spasm.bindings.SVGMatrix;
import spasm.bindings.SVGNumber;
import spasm.bindings.SVGPoint;
import spasm.bindings.SVGRect;
import spasm.bindings.SVGTransform;
import spasm.bindings.SVGZoomAndPanValues;

@safe:
nothrow:

struct SVGSVGElement {
  nothrow:
  spasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
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
    return SVGSVGElement_suspendRedraw(this._parent, maxWaitMilliseconds);
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
    return Object_Call_string__OptionalHandle(this._parent, "getElementById", elementId);
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
    SVGZoomAndPanValues_zoomAndPan_Set(this._parent, zoomAndPan);
  }
  ushort zoomAndPan()() {
    return Object_Getter__ushort(this._parent, "zoomAndPan");
  }
}


extern (C) uint SVGSVGElement_suspendRedraw(Handle, uint);