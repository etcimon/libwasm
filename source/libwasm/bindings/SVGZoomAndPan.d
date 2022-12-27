module libwasm.bindings.SVGZoomAndPan;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGZoomAndPanValues;

@safe:
nothrow:

struct SVGZoomAndPan {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort SVG_ZOOMANDPAN_UNKNOWN = 0;
  enum ushort SVG_ZOOMANDPAN_DISABLE = 1;
  enum ushort SVG_ZOOMANDPAN_MAGNIFY = 2;
  void zoomAndPan()(ushort zoomAndPan) {
    Serialize_Object_VarArgCall!void(this.handle, "zoomAndPan", "ushort", tuple(zoomAndPan));
  }
  ushort zoomAndPan()() {
    return Object_Getter__ushort(this.handle, "zoomAndPan");
  }
}


