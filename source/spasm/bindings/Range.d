module spasm.bindings.Range;

import spasm.types;
import spasm.bindings.DOMRect;
import spasm.bindings.DOMRectList;
import spasm.bindings.DocumentFragment;
import spasm.bindings.Node;

@safe:
nothrow:

struct ClientRectsAndTexts {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return ClientRectsAndTexts(spasm_add__object());
  }
  void rectList()(scope ref DOMRectList rectList) {
    Object_Call_Handle__void(this.handle, "rectList", rectList.handle);
  }
  auto rectList()() {
    return DOMRectList(Object_Getter__Handle(this.handle, "rectList"));
  }
  void textList()(scope ref Sequence!(string) textList) {
    Object_Call_Handle__void(this.handle, "textList", textList.handle);
  }
  auto textList()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "textList"));
  }
}
struct Range {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto startContainer()() {
    return Node(Object_Getter__Handle(this.handle, "startContainer"));
  }
  uint startOffset()() {
    return Object_Getter__uint(this.handle, "startOffset");
  }
  auto endContainer()() {
    return Node(Object_Getter__Handle(this.handle, "endContainer"));
  }
  uint endOffset()() {
    return Object_Getter__uint(this.handle, "endOffset");
  }
  bool collapsed()() {
    return Object_Getter__bool(this.handle, "collapsed");
  }
  auto commonAncestorContainer()() {
    return Node(Object_Getter__Handle(this.handle, "commonAncestorContainer"));
  }
  void setStart()(scope ref Node refNode, uint offset) {
    Range_setStart(this.handle, refNode._parent, offset);
  }
  void setEnd()(scope ref Node refNode, uint offset) {
    Range_setEnd(this.handle, refNode._parent, offset);
  }
  void setStartBefore()(scope ref Node refNode) {
    Object_Call_Handle__void(this.handle, "setStartBefore", refNode._parent);
  }
  void setStartAfter()(scope ref Node refNode) {
    Object_Call_Handle__void(this.handle, "setStartAfter", refNode._parent);
  }
  void setEndBefore()(scope ref Node refNode) {
    Object_Call_Handle__void(this.handle, "setEndBefore", refNode._parent);
  }
  void setEndAfter()(scope ref Node refNode) {
    Object_Call_Handle__void(this.handle, "setEndAfter", refNode._parent);
  }
  void collapse()(bool toStart /* = false */) {
    Object_Call_bool__void(this.handle, "collapse", toStart);
  }
  void collapse()() {
    Object_Call__void(this.handle, "collapse");
  }
  void selectNode()(scope ref Node refNode) {
    Object_Call_Handle__void(this.handle, "selectNode", refNode._parent);
  }
  void selectNodeContents()(scope ref Node refNode) {
    Object_Call_Handle__void(this.handle, "selectNodeContents", refNode._parent);
  }
  enum ushort START_TO_START = 0;
  enum ushort START_TO_END = 1;
  enum ushort END_TO_END = 2;
  enum ushort END_TO_START = 3;
  short compareBoundaryPoints()(ushort how, scope ref Range sourceRange) {
    return Range_compareBoundaryPoints(this.handle, how, sourceRange.handle);
  }
  void deleteContents()() {
    Object_Call__void(this.handle, "deleteContents");
  }
  auto extractContents()() {
    return DocumentFragment(Object_Getter__Handle(this.handle, "extractContents"));
  }
  auto cloneContents()() {
    return DocumentFragment(Object_Getter__Handle(this.handle, "cloneContents"));
  }
  void insertNode()(scope ref Node node) {
    Object_Call_Handle__void(this.handle, "insertNode", node._parent);
  }
  void surroundContents()(scope ref Node newParent) {
    Object_Call_Handle__void(this.handle, "surroundContents", newParent._parent);
  }
  auto cloneRange()() {
    return Range(Object_Getter__Handle(this.handle, "cloneRange"));
  }
  void detach()() {
    Object_Call__void(this.handle, "detach");
  }
  bool isPointInRange()(scope ref Node node, uint offset) {
    return Range_isPointInRange(this.handle, node._parent, offset);
  }
  short comparePoint()(scope ref Node node, uint offset) {
    return Range_comparePoint(this.handle, node._parent, offset);
  }
  bool intersectsNode()(scope ref Node node) {
    return Range_intersectsNode(this.handle, node._parent);
  }
  auto createContextualFragment()(string fragment) {
    return DocumentFragment(Object_Call_string__Handle(this.handle, "createContextualFragment", fragment));
  }
  auto getClientRects()() {
    return Object_Getter__OptionalHandle(this.handle, "getClientRects");
  }
  auto getBoundingClientRect()() {
    return DOMRect(Object_Getter__Handle(this.handle, "getBoundingClientRect"));
  }
  auto getClientRectsAndTexts()() {
    return ClientRectsAndTexts(Object_Getter__Handle(this.handle, "getClientRectsAndTexts"));
  }
}


extern (C) void Range_setStart(Handle, Handle, uint);
extern (C) void Range_setEnd(Handle, Handle, uint);
extern (C) short Range_compareBoundaryPoints(Handle, ushort, Handle);
extern (C) bool Range_isPointInRange(Handle, Handle, uint);
extern (C) short Range_comparePoint(Handle, Handle, uint);
extern (C) bool Range_intersectsNode(Handle, Handle);