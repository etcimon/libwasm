module spasm.bindings.Text;

import spasm.types;
import spasm.bindings.CharacterData;
import spasm.bindings.DOMPoint;
import spasm.bindings.DOMQuad;
import spasm.bindings.DOMRect;
import spasm.bindings.GeometryUtils;
import spasm.bindings.HTMLSlotElement;

@safe:
nothrow:

struct Text {
  nothrow:
  spasm.bindings.CharacterData.CharacterData _parent;
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
    return Object_Getter__OptionalHandle(this._parent, "assignedSlot");
  }
  auto openOrClosedAssignedSlot()() {
    return Object_Getter__OptionalHandle(this._parent, "openOrClosedAssignedSlot");
  }
  auto getBoxQuads()(scope ref BoxQuadOptions options) {
    return Sequence!(DOMQuad)(Object_Call_Handle__Handle(this._parent, "getBoxQuads", options.handle));
  }
  auto getBoxQuads()() {
    return Sequence!(DOMQuad)(Object_Getter__Handle(this._parent, "getBoxQuads"));
  }
  auto convertQuadFromNode()(scope ref DOMQuad quad, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMQuad(GeometryUtils_convertQuadFromNode(this._parent, quad.handle, from, options.handle));
  }
  auto convertQuadFromNode()(scope ref DOMQuad quad, scope ref GeometryNode from) {
    return DOMQuad(GeometryUtils_convertQuadFromNode_0(this._parent, quad.handle, from));
  }
  auto convertRectFromNode()(scope ref DOMRectReadOnly rect, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMQuad(GeometryUtils_convertRectFromNode(this._parent, rect.handle, from, options.handle));
  }
  auto convertRectFromNode()(scope ref DOMRectReadOnly rect, scope ref GeometryNode from) {
    return DOMQuad(GeometryUtils_convertRectFromNode_0(this._parent, rect.handle, from));
  }
  auto convertPointFromNode()(scope ref DOMPointInit point, scope ref GeometryNode from, scope ref ConvertCoordinateOptions options) {
    return DOMPoint(GeometryUtils_convertPointFromNode(this._parent, point.handle, from, options.handle));
  }
  auto convertPointFromNode()(scope ref DOMPointInit point, scope ref GeometryNode from) {
    return DOMPoint(GeometryUtils_convertPointFromNode_0(this._parent, point.handle, from));
  }
}


