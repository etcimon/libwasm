module spasm.bindings.SVGZoomAndPanValues;

import spasm.types;
@safe:
nothrow:

struct SVGZoomAndPanValues {
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
    SVGZoomAndPanValues_zoomAndPan_Set(this.handle, zoomAndPan);
  }
  ushort zoomAndPan()() {
    return Object_Getter__ushort(this.handle, "zoomAndPan");
  }
}


extern (C) void SVGZoomAndPanValues_zoomAndPan_Set(Handle, ushort);