module libwasm.bindings.SVGPreserveAspectRatio;

import libwasm.types;

import memutils.ct: tuple;
@safe:
nothrow:

struct SVGPreserveAspectRatio {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  enum ushort SVG_PRESERVEASPECTRATIO_UNKNOWN = 0;
  enum ushort SVG_PRESERVEASPECTRATIO_NONE = 1;
  enum ushort SVG_PRESERVEASPECTRATIO_XMINYMIN = 2;
  enum ushort SVG_PRESERVEASPECTRATIO_XMIDYMIN = 3;
  enum ushort SVG_PRESERVEASPECTRATIO_XMAXYMIN = 4;
  enum ushort SVG_PRESERVEASPECTRATIO_XMINYMID = 5;
  enum ushort SVG_PRESERVEASPECTRATIO_XMIDYMID = 6;
  enum ushort SVG_PRESERVEASPECTRATIO_XMAXYMID = 7;
  enum ushort SVG_PRESERVEASPECTRATIO_XMINYMAX = 8;
  enum ushort SVG_PRESERVEASPECTRATIO_XMIDYMAX = 9;
  enum ushort SVG_PRESERVEASPECTRATIO_XMAXYMAX = 10;
  enum ushort SVG_MEETORSLICE_UNKNOWN = 0;
  enum ushort SVG_MEETORSLICE_MEET = 1;
  enum ushort SVG_MEETORSLICE_SLICE = 2;
  void align_()(ushort align_) {
    Serialize_Object_VarArgCall!void(this.handle, "align", "ushort", tuple(align_));
  }
  ushort align_()() {
    return Object_Getter__ushort(this.handle, "align");
  }
  void meetOrSlice()(ushort meetOrSlice) {
    Serialize_Object_VarArgCall!void(this.handle, "meetOrSlice", "ushort", tuple(meetOrSlice));
  }
  ushort meetOrSlice()() {
    return Object_Getter__ushort(this.handle, "meetOrSlice");
  }
}


