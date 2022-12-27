module libwasm.bindings.GeometryUtils;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.DOMPoint;
import libwasm.bindings.DOMQuad;
import libwasm.bindings.DOMRect;
import libwasm.bindings.Document;
import libwasm.bindings.Element;
import libwasm.bindings.Text;

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
    return BoxQuadOptions(libwasm_add__object());
  }
  void box()(CSSBoxType box) {
    Object_Call_int__void(this.handle, "box", box);
  }
  CSSBoxType box()() {
    return Object_Getter__int(this.handle, "box");
  }
  void relativeTo()(scope ref GeometryNode relativeTo) {
    Serialize_Object_VarArgCall!void(this.handle, "relativeTo", "SumType!(Handle,Handle,Handle)", tuple(libwasm.sumtype.match!(((ref relativeTo.Types[0] v) => 0),((ref relativeTo.Types[1] v) => 1),((ref relativeTo.Types[2] v) => 2))(relativeTo),tuple(libwasm.sumtype.match!(((ref relativeTo.Types[0] v) => cast(Handle)v.handle),((ref relativeTo.Types[1] v) => Handle.init),((ref relativeTo.Types[2] v) => Handle.init))(relativeTo),libwasm.sumtype.match!(((ref relativeTo.Types[0] v) => Handle.init),((ref relativeTo.Types[1] v) => cast(Handle)v.handle),((ref relativeTo.Types[2] v) => Handle.init))(relativeTo),libwasm.sumtype.match!(((ref relativeTo.Types[0] v) => Handle.init),((ref relativeTo.Types[1] v) => Handle.init),((ref relativeTo.Types[2] v) => cast(Handle)v.handle))(relativeTo))));
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
    return ConvertCoordinateOptions(libwasm_add__object());
  }
  void fromBox()(CSSBoxType fromBox) {
    Object_Call_int__void(this.handle, "fromBox", fromBox);
  }
  CSSBoxType fromBox()() {
    return Object_Getter__int(this.handle, "fromBox");
  }
  void toBox()(CSSBoxType toBox) {
    Object_Call_int__void(this.handle, "toBox", toBox);
  }
  CSSBoxType toBox()() {
    return Object_Getter__int(this.handle, "toBox");
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
    return DOMQuad(Serialize_Object_VarArgCall!Handle(this.handle, "convertQuadFromNode", "Handle;SumType!(Handle,Handle,Handle);Handle", tuple(cast(Handle)quad.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)), cast(Handle)options.handle)));
  }
  auto convertQuadFromNode()(scope ref DOMQuad quad, scope ref GeometryNode from) {
    return DOMQuad(Serialize_Object_VarArgCall!Handle(this.handle, "convertQuadFromNode", "Handle;SumType!(Handle,Handle,Handle)", tuple(cast(Handle)quad.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)))));
  }
  auto convertRectFromNode()(scope ref DOMRectReadOnly rect, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMQuad(Serialize_Object_VarArgCall!Handle(this.handle, "convertRectFromNode", "Handle;SumType!(Handle,Handle,Handle);Handle", tuple(cast(Handle)rect.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)), cast(Handle)options.handle)));
  }
  auto convertRectFromNode()(scope ref DOMRectReadOnly rect, scope ref GeometryNode from) {
    return DOMQuad(Serialize_Object_VarArgCall!Handle(this.handle, "convertRectFromNode", "Handle;SumType!(Handle,Handle,Handle)", tuple(cast(Handle)rect.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)))));
  }
  auto convertPointFromNode()(scope ref DOMPointInit point, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMPoint(Serialize_Object_VarArgCall!Handle(this.handle, "convertPointFromNode", "Handle;SumType!(Handle,Handle,Handle);Handle", tuple(cast(Handle)point.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)), cast(Handle)options.handle)));
  }
  auto convertPointFromNode()(scope ref DOMPointInit point, scope ref GeometryNode from) {
    return DOMPoint(Serialize_Object_VarArgCall!Handle(this.handle, "convertPointFromNode", "Handle;SumType!(Handle,Handle,Handle)", tuple(cast(Handle)point.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)))));
  }
}


