module spasm.bindings.Selection;

import spasm.types;
import spasm.bindings.LegacyQueryInterface;
import spasm.bindings.Node;
import spasm.bindings.Range;

@safe:
nothrow:

struct Selection {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto anchorNode()() {
    return Object_Getter__OptionalHandle(this.handle, "anchorNode");
  }
  uint anchorOffset()() {
    return Object_Getter__uint(this.handle, "anchorOffset");
  }
  auto focusNode()() {
    return Object_Getter__OptionalHandle(this.handle, "focusNode");
  }
  uint focusOffset()() {
    return Object_Getter__uint(this.handle, "focusOffset");
  }
  bool isCollapsed()() {
    return Object_Getter__bool(this.handle, "isCollapsed");
  }
  uint rangeCount()() {
    return Object_Getter__uint(this.handle, "rangeCount");
  }
  string type()() {
    return Object_Getter__string(this.handle, "type");
  }
  auto getRangeAt()(uint index) {
    return Range(Object_Call_uint__Handle(this.handle, "getRangeAt", index));
  }
  void addRange()(scope ref Range range) {
    Object_Call_Handle__void(this.handle, "addRange", range.handle);
  }
  void removeRange()(scope ref Range range) {
    Object_Call_Handle__void(this.handle, "removeRange", range.handle);
  }
  void removeAllRanges()() {
    Object_Call__void(this.handle, "removeAllRanges");
  }
  void empty()() {
    Object_Call__void(this.handle, "empty");
  }
  void collapse(T0)(scope auto ref Optional!(T0) node, uint offset /* = 0 */) if (isTOrPointer!(T0, Node)) {
    Selection_collapse(this.handle, !node.empty, node.front._parent, offset);
  }
  void collapse(T0)(scope auto ref Optional!(T0) node) if (isTOrPointer!(T0, Node)) {
    Selection_collapse_0(this.handle, !node.empty, node.front._parent);
  }
  void setPosition(T0)(scope auto ref Optional!(T0) node, uint offset /* = 0 */) if (isTOrPointer!(T0, Node)) {
    Selection_setPosition(this.handle, !node.empty, node.front._parent, offset);
  }
  void setPosition(T0)(scope auto ref Optional!(T0) node) if (isTOrPointer!(T0, Node)) {
    Selection_setPosition_0(this.handle, !node.empty, node.front._parent);
  }
  void collapseToStart()() {
    Object_Call__void(this.handle, "collapseToStart");
  }
  void collapseToEnd()() {
    Object_Call__void(this.handle, "collapseToEnd");
  }
  void extend()(scope ref Node node, uint offset /* = 0 */) {
    Selection_extend(this.handle, node._parent, offset);
  }
  void extend()(scope ref Node node) {
    Object_Call_Handle__void(this.handle, "extend", node._parent);
  }
  void setBaseAndExtent()(scope ref Node anchorNode, uint anchorOffset, scope ref Node focusNode, uint focusOffset) {
    Selection_setBaseAndExtent(this.handle, anchorNode._parent, anchorOffset, focusNode._parent, focusOffset);
  }
  void selectAllChildren()(scope ref Node node) {
    Object_Call_Handle__void(this.handle, "selectAllChildren", node._parent);
  }
  void deleteFromDocument()() {
    Object_Call__void(this.handle, "deleteFromDocument");
  }
  bool containsNode()(scope ref Node node, bool allowPartialContainment /* = false */) {
    return Selection_containsNode(this.handle, node._parent, allowPartialContainment);
  }
  bool containsNode()(scope ref Node node) {
    return Selection_containsNode_0(this.handle, node._parent);
  }
  auto DOMString()() {
    return stringifier(Object_Getter__Handle(this.handle, "DOMString"));
  }
  void modify()(string alter, string direction, string granularity) {
    Selection_modify(this.handle, alter, direction, granularity);
  }
  void interlinePosition()(bool interlinePosition) {
    Object_Call_bool__void(this.handle, "interlinePosition", interlinePosition);
  }
  bool interlinePosition()() {
    return Object_Getter__bool(this.handle, "interlinePosition");
  }
  void caretBidiLevel(T0)(scope auto ref Optional!(T0) caretBidiLevel) if (isTOrPointer!(T0, short)) {
    Selection_caretBidiLevel_Set(this.handle, !caretBidiLevel.empty, caretBidiLevel.front);
  }
  Optional!(short) caretBidiLevel()() {
    return Selection_caretBidiLevel_Get(this.handle);
  }
  string toStringWithFormat()(string formatType, uint flags, int wrapColumn) {
    return Selection_toStringWithFormat(this.handle, formatType, flags, wrapColumn);
  }
  void addSelectionListener()(scope ref nsISelectionListener newListener) {
    Object_Call_Handle__void(this.handle, "addSelectionListener", newListener.handle);
  }
  void removeSelectionListener()(scope ref nsISelectionListener listenerToRemove) {
    Object_Call_Handle__void(this.handle, "removeSelectionListener", listenerToRemove.handle);
  }
  short selectionType()() {
    return Selection_selectionType_Get(this.handle);
  }
  auto GetRangesForInterval()(scope ref Node beginNode, int beginOffset, scope ref Node endNode, int endOffset, bool allowAdjacent) {
    return Sequence!(Range)(Selection_GetRangesForInterval(this.handle, beginNode._parent, beginOffset, endNode._parent, endOffset, allowAdjacent));
  }
  void scrollIntoView()(short aRegion, bool aIsSynchronous, short aVPercent, short aHPercent) {
    Selection_scrollIntoView(this.handle, aRegion, aIsSynchronous, aVPercent, aHPercent);
  }
  void setColors()(string aForegroundColor, string aBackgroundColor, string aAltForegroundColor, string aAltBackgroundColor) {
    Selection_setColors(this.handle, aForegroundColor, aBackgroundColor, aAltForegroundColor, aAltBackgroundColor);
  }
  void resetColors()() {
    Object_Call__void(this.handle, "resetColors");
  }
  auto QueryInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = nsISupports(Object_Call_Handle__Handle(this.handle, "QueryInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
}


extern (C) void Selection_collapse(Handle, bool, Handle, uint);
extern (C) void Selection_collapse_0(Handle, bool, Handle);
extern (C) void Selection_setPosition(Handle, bool, Handle, uint);
extern (C) void Selection_setPosition_0(Handle, bool, Handle);
extern (C) void Selection_extend(Handle, Handle, uint);
extern (C) void Selection_setBaseAndExtent(Handle, Handle, uint, Handle, uint);
extern (C) bool Selection_containsNode(Handle, Handle, bool);
extern (C) bool Selection_containsNode_0(Handle, Handle);
extern (C) void Selection_modify(Handle, string, string, string);
extern (C) void Selection_caretBidiLevel_Set(Handle, bool, short);
extern (C) Optional!(short) Selection_caretBidiLevel_Get(Handle);
extern (C) string Selection_toStringWithFormat(Handle, string, uint, int);
extern (C) short Selection_selectionType_Get(Handle);
extern (C) Handle Selection_GetRangesForInterval(Handle, Handle, int, Handle, int, bool);
extern (C) void Selection_scrollIntoView(Handle, short, bool, short, short);
extern (C) void Selection_setColors(Handle, string, string, string, string);