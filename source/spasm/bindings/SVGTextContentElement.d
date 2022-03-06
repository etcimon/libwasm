module spasm.bindings.SVGTextContentElement;

import spasm.types;
import spasm.bindings.SVGAnimatedEnumeration;
import spasm.bindings.SVGAnimatedLength;
import spasm.bindings.SVGGraphicsElement;
import spasm.bindings.SVGPoint;
import spasm.bindings.SVGRect;

@safe:
nothrow:

struct SVGTextContentElement {
  nothrow:
  spasm.bindings.SVGGraphicsElement.SVGGraphicsElement _parent;
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
    return SVGTextContentElement_getSubStringLength(this._parent, charnum, nchars);
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
    return SVGTextContentElement_getRotationOfChar(this._parent, charnum);
  }
  int getCharNumAtPosition()(scope ref SVGPoint point) {
    return SVGTextContentElement_getCharNumAtPosition(this._parent, point.handle);
  }
  void selectSubString()(uint charnum, uint nchars) {
    SVGTextContentElement_selectSubString(this._parent, charnum, nchars);
  }
}


extern (C) float SVGTextContentElement_getSubStringLength(Handle, uint, uint);
extern (C) float SVGTextContentElement_getRotationOfChar(Handle, uint);
extern (C) int SVGTextContentElement_getCharNumAtPosition(Handle, Handle);
extern (C) void SVGTextContentElement_selectSubString(Handle, uint, uint);