module libwasm.bindings.SVGViewElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedPreserveAspectRatio;
import libwasm.bindings.SVGAnimatedRect;
import libwasm.bindings.SVGElement;
import libwasm.bindings.SVGFitToViewBox;
import libwasm.bindings.SVGZoomAndPanValues;

@safe:
nothrow:

struct SVGViewElement {
  nothrow:
  libwasm.bindings.SVGElement.SVGElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGElement(h);
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


