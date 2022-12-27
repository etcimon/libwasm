module libwasm.bindings.SVGTextContentElement;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.SVGAnimatedEnumeration;
import libwasm.bindings.SVGAnimatedLength;
import libwasm.bindings.SVGGraphicsElement;
import libwasm.bindings.SVGPoint;
import libwasm.bindings.SVGRect;

@safe:
nothrow:

struct SVGTextContentElement {
  nothrow:
  libwasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .SVGGraphicsElement(h);
  }
  enum ushort LENGTHADJUST_UNKNOWN = 0;
  enum ushort LENGTHADJUST_SPACING = 1;
  enum ushort LENGTHADJUST_SPACINGANDGLYPHS = 2;
  auto textLength()() {
    return SVGAnimatedLength(Object_Getter__Handle(this._parent, "textLength"));
  }
  auto lengthAdjust()() {
    return SVGAnimatedEnumeration(Object_Getter__Handle(this._parent, "lengthAdjust"));
  }
  int getNumberOfChars()() {
    return Object_Getter__int(this._parent, "getNumberOfChars");
  }
  float getComputedTextLength()() {
    return Object_Getter__float(this._parent, "getComputedTextLength");
  }
  float getSubStringLength()(uint charnum, uint nchars) {
    return Serialize_Object_VarArgCall!float(this._parent, "getSubStringLength", "uint;uint", tuple(charnum, nchars));
  }
  auto getStartPositionOfChar()(uint charnum) {
    return SVGPoint(Object_Call_uint__Handle(this._parent, "getStartPositionOfChar", charnum));
  }
  auto getEndPositionOfChar()(uint charnum) {
    return SVGPoint(Object_Call_uint__Handle(this._parent, "getEndPositionOfChar", charnum));
  }
  auto getExtentOfChar()(uint charnum) {
    return SVGRect(Object_Call_uint__Handle(this._parent, "getExtentOfChar", charnum));
  }
  float getRotationOfChar()(uint charnum) {
    return Serialize_Object_VarArgCall!float(this._parent, "getRotationOfChar", "uint", tuple(charnum));
  }
  int getCharNumAtPosition()(scope ref SVGPoint point) {
    return Serialize_Object_VarArgCall!int(this._parent, "getCharNumAtPosition", "Handle", tuple(cast(Handle)point.handle));
  }
  void selectSubString()(uint charnum, uint nchars) {
    Serialize_Object_VarArgCall!void(this._parent, "selectSubString", "uint;uint", tuple(charnum, nchars));
  }
}


