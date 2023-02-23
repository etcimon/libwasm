module libwasm.bindings.Selection;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.LegacyQueryInterface;
import libwasm.bindings.Node;
import libwasm.bindings.Range;

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
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "anchorNode"));
  }
  uint anchorOffset()() {
    return Object_Getter__uint(this.handle, "anchorOffset");
  }
  auto focusNode()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "focusNode"));
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
    Serialize_Object_VarArgCall!void(this.handle, "collapse", "Optional!Handle;uint", tuple(!node.empty, cast(Handle)node.front._parent, offset));
  }
  void collapse(T0)(scope auto ref Optional!(T0) node) if (isTOrPointer!(T0, Node)) {
    Serialize_Object_VarArgCall!void(this.handle, "collapse", "Optional!Handle", tuple(!node.empty, cast(Handle)node.front._parent));
  }
  void setPosition(T0)(scope auto ref Optional!(T0) node, uint offset /* = 0 */) if (isTOrPointer!(T0, Node)) {
    Serialize_Object_VarArgCall!void(this.handle, "setPosition", "Optional!Handle;uint", tuple(!node.empty, cast(Handle)node.front._parent, offset));
  }
  void setPosition(T0)(scope auto ref Optional!(T0) node) if (isTOrPointer!(T0, Node)) {
    Serialize_Object_VarArgCall!void(this.handle, "setPosition", "Optional!Handle", tuple(!node.empty, cast(Handle)node.front._parent));
  }
  void collapseToStart()() {
    Object_Call__void(this.handle, "collapseToStart");
  }
  void collapseToEnd()() {
    Object_Call__void(this.handle, "collapseToEnd");
  }
  void extend()(scope ref Node node, uint offset /* = 0 */) {
    Serialize_Object_VarArgCall!void(this.handle, "extend", "Handle;uint", tuple(cast(Handle)node._parent, offset));
  }
  void extend()(scope ref Node node) {
    Object_Call_Handle__void(this.handle, "extend", node._parent);
  }
  void setBaseAndExtent()(scope ref Node anchorNode, uint anchorOffset, scope ref Node focusNode, uint focusOffset) {
    Serialize_Object_VarArgCall!void(this.handle, "setBaseAndExtent", "Handle;uint;Handle;uint", tuple(cast(Handle)anchorNode._parent, anchorOffset, cast(Handle)focusNode._parent, focusOffset));
  }
  void selectAllChildren()(scope ref Node node) {
    Object_Call_Handle__void(this.handle, "selectAllChildren", node._parent);
  }
  void deleteFromDocument()() {
    Object_Call__void(this.handle, "deleteFromDocument");
  }
  bool containsNode()(scope ref Node node, bool allowPartialContainment /* = false */) {
    return Serialize_Object_VarArgCall!bool(this.handle, "containsNode", "Handle;bool", tuple(cast(Handle)node._parent, allowPartialContainment));
  }
  bool containsNode()(scope ref Node node) {
    return Serialize_Object_VarArgCall!bool(this.handle, "containsNode", "Handle", tuple(cast(Handle)node._parent));
  }
  auto DOMString()() {
    return stringifier(Object_Getter__Handle(this.handle, "DOMString"));
  }
  void modify()(string alter, string direction, string granularity) {
    Serialize_Object_VarArgCall!void(this.handle, "modify", "string;string;string", tuple(alter, direction, granularity));
  }
  void interlinePosition()(bool interlinePosition) {
    Object_Call_bool__void(this.handle, "interlinePosition", interlinePosition);
  }
  bool interlinePosition()() {
    return Object_Getter__bool(this.handle, "interlinePosition");
  }
  void caretBidiLevel(T0)(scope auto ref Optional!(T0) caretBidiLevel) if (isTOrPointer!(T0, short)) {
    Serialize_Object_VarArgCall!void(this.handle, "caretBidiLevel", "Optional!(short)", tuple(!caretBidiLevel.empty, caretBidiLevel.front));
  }
  Optional!(short) caretBidiLevel()() {
    return Selection_caretBidiLevel_Get(this.handle);
  }
  string toStringWithFormat()(string formatType, uint flags, int wrapColumn) {
    return Serialize_Object_VarArgCall!string(this.handle, "toStringWithFormat", "string;uint;int", tuple(formatType, flags, wrapColumn));
  }
  void addSelectionListener()(scope ref nsISelectionListener newListener) {
    Object_Call_Handle__void(this.handle, "addSelectionListener", newListener.handle);
  }
  void removeSelectionListener()(scope ref nsISelectionListener listenerToRemove) {
    Object_Call_Handle__void(this.handle, "removeSelectionListener", listenerToRemove.handle);
  }
  short selectionType()() {
    return Serialize_Object_VarArgCall!short(this.handle, "selectionType", "", tuple());
  }
  auto GetRangesForInterval()(scope ref Node beginNode, int beginOffset, scope ref Node endNode, int endOffset, bool allowAdjacent) {
    return Sequence!(Range)(Serialize_Object_VarArgCall!Handle(this.handle, "GetRangesForInterval", "Handle;int;Handle;int;bool", tuple(cast(Handle)beginNode._parent, beginOffset, cast(Handle)endNode._parent, endOffset, allowAdjacent)));
  }
  void scrollIntoView()(short aRegion, bool aIsSynchronous, short aVPercent, short aHPercent) {
    Serialize_Object_VarArgCall!void(this.handle, "scrollIntoView", "short;bool;short;short", tuple(aRegion, aIsSynchronous, aVPercent, aHPercent));
  }
  void setColors()(string aForegroundColor, string aBackgroundColor, string aAltForegroundColor, string aAltBackgroundColor) {
    Serialize_Object_VarArgCall!void(this.handle, "setColors", "string;string;string;string", tuple(aForegroundColor, aBackgroundColor, aAltForegroundColor, aAltBackgroundColor));
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


extern (C) Optional!(short) Selection_caretBidiLevel_Get(Handle);