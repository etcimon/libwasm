module libwasm.bindings.Text;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.CharacterData;
import libwasm.bindings.DOMPoint;
import libwasm.bindings.DOMQuad;
import libwasm.bindings.DOMRect;
import libwasm.bindings.GeometryUtils;
import libwasm.bindings.HTMLSlotElement;

@safe:
nothrow:

struct Text {
  nothrow:
  libwasm.bindings.CharacterData.CharacterData _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .CharacterData(h);
  }
  auto splitText()(uint offset) {
    return Text(Object_Call_uint__Handle(this._parent, "splitText", offset));
  }
  string wholeText()() {
    return Object_Getter__string(this._parent, "wholeText");
  }
  auto assignedSlot()() {
    return recastOpt!(HTMLSlotElement)(Object_Getter__OptionalHandle(this._parent, "assignedSlot"));
  }
  auto openOrClosedAssignedSlot()() {
    return recastOpt!(HTMLSlotElement)(Object_Getter__OptionalHandle(this._parent, "openOrClosedAssignedSlot"));
  }
  auto getBoxQuads()(scope ref BoxQuadOptions options) {
    return Sequence!(DOMQuad)(Object_Call_Handle__Handle(this._parent, "getBoxQuads", options.handle));
  }
  auto getBoxQuads()() {
    return Sequence!(DOMQuad)(Object_Getter__Handle(this._parent, "getBoxQuads"));
  }
  auto convertQuadFromNode()(scope ref DOMQuad quad, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMQuad(Serialize_Object_VarArgCall!Handle(this._parent, "convertQuadFromNode", "Handle;SumType!(Handle,Handle,Handle);Handle", tuple(cast(Handle)quad.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)), cast(Handle)options.handle)));
  }
  auto convertQuadFromNode()(scope ref DOMQuad quad, scope ref GeometryNode from) {
    return DOMQuad(Serialize_Object_VarArgCall!Handle(this._parent, "convertQuadFromNode", "Handle;SumType!(Handle,Handle,Handle)", tuple(cast(Handle)quad.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)))));
  }
  auto convertRectFromNode()(scope ref DOMRectReadOnly rect, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMQuad(Serialize_Object_VarArgCall!Handle(this._parent, "convertRectFromNode", "Handle;SumType!(Handle,Handle,Handle);Handle", tuple(cast(Handle)rect.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)), cast(Handle)options.handle)));
  }
  auto convertRectFromNode()(scope ref DOMRectReadOnly rect, scope ref GeometryNode from) {
    return DOMQuad(Serialize_Object_VarArgCall!Handle(this._parent, "convertRectFromNode", "Handle;SumType!(Handle,Handle,Handle)", tuple(cast(Handle)rect.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)))));
  }
  auto convertPointFromNode()(scope ref DOMPointInit point, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMPoint(Serialize_Object_VarArgCall!Handle(this._parent, "convertPointFromNode", "Handle;SumType!(Handle,Handle,Handle);Handle", tuple(cast(Handle)point.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)), cast(Handle)options.handle)));
  }
  auto convertPointFromNode()(scope ref DOMPointInit point, scope ref GeometryNode from) {
    return DOMPoint(Serialize_Object_VarArgCall!Handle(this._parent, "convertPointFromNode", "Handle;SumType!(Handle,Handle,Handle)", tuple(cast(Handle)point.handle, libwasm.sumtype.match!(((ref from.Types[0] v) => 0),((ref from.Types[1] v) => 1),((ref from.Types[2] v) => 2))(from),tuple(libwasm.sumtype.match!(((ref from.Types[0] v) => cast(Handle)v.handle),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => cast(Handle)v.handle),((ref from.Types[2] v) => Handle.init))(from),libwasm.sumtype.match!(((ref from.Types[0] v) => Handle.init),((ref from.Types[1] v) => Handle.init),((ref from.Types[2] v) => cast(Handle)v.handle))(from)))));
  }
}


