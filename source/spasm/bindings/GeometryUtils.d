module spasm.bindings.GeometryUtils;

import spasm.types;
import spasm.bindings.DOMPoint;
import spasm.bindings.DOMQuad;
import spasm.bindings.DOMRect;
import spasm.bindings.Document;
import spasm.bindings.Element;
import spasm.bindings.Text;

@safe:
nothrow:

struct BoxQuadOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return BoxQuadOptions(spasm_add__object());
  }
  void box()(CSSBoxType box) {
    BoxQuadOptions_box_Set(this.handle, box);
  }
  CSSBoxType box()() {
    return BoxQuadOptions_box_Get(this.handle);
  }
  void relativeTo()(scope ref GeometryNode relativeTo) {
    BoxQuadOptions_relativeTo_Set(this.handle, relativeTo);
  }
  auto relativeTo()() {
    return Object_Getter__Handle(this.handle, "relativeTo");
  }
}
enum CSSBoxType {
  margin,
  border,
  padding,
  content
}
struct ConvertCoordinateOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ConvertCoordinateOptions(spasm_add__object());
  }
  void fromBox()(CSSBoxType fromBox) {
    ConvertCoordinateOptions_fromBox_Set(this.handle, fromBox);
  }
  CSSBoxType fromBox()() {
    return ConvertCoordinateOptions_fromBox_Get(this.handle);
  }
  void toBox()(CSSBoxType toBox) {
    ConvertCoordinateOptions_toBox_Set(this.handle, toBox);
  }
  CSSBoxType toBox()() {
    return ConvertCoordinateOptions_toBox_Get(this.handle);
  }
}
alias GeometryNode = SumType!(Text, Element, Document);
struct GeometryUtils {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto getBoxQuads()(scope ref BoxQuadOptions options) {
    return Sequence!(DOMQuad)(Object_Call_Handle__Handle(this.handle, "getBoxQuads", options.handle));
  }
  auto getBoxQuads()() {
    return Sequence!(DOMQuad)(Object_Getter__Handle(this.handle, "getBoxQuads"));
  }
  auto convertQuadFromNode()(scope ref DOMQuad quad, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMQuad(GeometryUtils_convertQuadFromNode(this.handle, quad.handle, from, options.handle));
  }
  auto convertQuadFromNode()(scope ref DOMQuad quad, scope ref GeometryNode from) {
    return DOMQuad(GeometryUtils_convertQuadFromNode_0(this.handle, quad.handle, from));
  }
  auto convertRectFromNode()(scope ref DOMRectReadOnly rect, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMQuad(GeometryUtils_convertRectFromNode(this.handle, rect.handle, from, options.handle));
  }
  auto convertRectFromNode()(scope ref DOMRectReadOnly rect, scope ref GeometryNode from) {
    return DOMQuad(GeometryUtils_convertRectFromNode_0(this.handle, rect.handle, from));
  }
  auto convertPointFromNode()(scope ref DOMPointInit point, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMPoint(GeometryUtils_convertPointFromNode(this.handle, point.handle, from, options.handle));
  }
  auto convertPointFromNode()(scope ref DOMPointInit point, scope ref GeometryNode from) {
    return DOMPoint(GeometryUtils_convertPointFromNode_0(this.handle, point.handle, from));
  }
}


extern (C) void BoxQuadOptions_box_Set(Handle, CSSBoxType);
extern (C) CSSBoxType BoxQuadOptions_box_Get(Handle);
extern (C) void BoxQuadOptions_relativeTo_Set(Handle, scope ref GeometryNode);
extern (C) void ConvertCoordinateOptions_fromBox_Set(Handle, CSSBoxType);
extern (C) CSSBoxType ConvertCoordinateOptions_fromBox_Get(Handle);
extern (C) void ConvertCoordinateOptions_toBox_Set(Handle, CSSBoxType);
extern (C) CSSBoxType ConvertCoordinateOptions_toBox_Get(Handle);
extern (C) Handle GeometryUtils_convertQuadFromNode(Handle, Handle, scope ref GeometryNode, Handle);
extern (C) Handle GeometryUtils_convertQuadFromNode_0(Handle, Handle, scope ref GeometryNode);
extern (C) Handle GeometryUtils_convertRectFromNode(Handle, Handle, scope ref GeometryNode, Handle);
extern (C) Handle GeometryUtils_convertRectFromNode_0(Handle, Handle, scope ref GeometryNode);
extern (C) Handle GeometryUtils_convertPointFromNode(Handle, Handle, scope ref GeometryNode, Handle);
extern (C) Handle GeometryUtils_convertPointFromNode_0(Handle, Handle, scope ref GeometryNode);