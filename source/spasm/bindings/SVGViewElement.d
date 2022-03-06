module spasm.bindings.SVGViewElement;

import spasm.types;
import spasm.bindings.SVGAnimatedPreserveAspectRatio;
import spasm.bindings.SVGAnimatedRect;
import spasm.bindings.SVGElement;
import spasm.bindings.SVGFitToViewBox;
import spasm.bindings.SVGZoomAndPanValues;

@safe:
nothrow:

struct SVGViewElement {
  nothrow:
  spasm.bindings.SVGElement.SVGElement _parent;
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
    SVGZoomAndPanValues_zoomAndPan_Set(this._parent, zoomAndPan);
  }
  ushort zoomAndPan()() {
    return Object_Getter__ushort(this._parent, "zoomAndPan");
  }
}


