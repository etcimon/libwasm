module spasm.bindings.SVGMarkerElement;

import spasm.types;
import spasm.bindings.SVGAngle;
import spasm.bindings.SVGAnimatedAngle;
import spasm.bindings.SVGAnimatedEnumeration;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGAnimatedPreserveAspectRatio;
import spasm.bindings.SVGAnimatedRect;
import spasm.bindings.SVGElement;
import spasm.bindings.SVGFitToViewBox;

@safe:
nothrow:

struct SVGMarkerElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
  }
  enum ushort SVG_MARKERUNITS_UNKNOWN = 0;
  enum ushort SVG_MARKERUNITS_USERSPACEONUSE = 1;
  enum ushort SVG_MARKERUNITS_STROKEWIDTH = 2;
  enum ushort SVG_MARKER_ORIENT_UNKNOWN = 0;
  enum ushort SVG_MARKER_ORIENT_AUTO = 1;
  enum ushort SVG_MARKER_ORIENT_ANGLE = 2;
  auto refX()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "refX"));
  }
  auto refY()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "refY"));
  }
  auto markerUnits()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "markerUnits"));
  }
  auto markerWidth()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "markerWidth"));
  }
  auto markerHeight()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "markerHeight"));
  }
  auto orientType()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "orientType"));
  }
  auto orientAngle()() {
    return SVGAnimatedAngle(Object_Getter__Handle(this._parent, "orientAngle"));
  }
  void setOrientToAuto()() {
    Object_Call__void(this._parent, "setOrientToAuto");
  }
  void setOrientToAngle()(scope ref SVGAngle angle) {
    Object_Call_Handle__void(this._parent, "setOrientToAngle", angle.handle);
  }
  auto viewBox()() {
    return SVGAnimatedRect(Object_Getter__Handle(this._parent, "viewBox"));
  }
  auto preserveAspectRatio()() {
    return SVGAnimatedPreserveAspectRatio(Object_Getter__Handle(this._parent, "preserveAspectRatio"));
  }
}


