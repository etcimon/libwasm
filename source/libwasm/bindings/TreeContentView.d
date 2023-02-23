module libwasm.bindings.TreeContentView;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.DataTransfer;
import libwasm.bindings.Element;
import libwasm.bindings.LegacyQueryInterface;
import libwasm.bindings.TreeColumn;
import libwasm.bindings.TreeView;

@safe:
nothrow:

struct TreeContentView {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  auto getItemAtIndex()(int row) {
    return recastOpt!(Element)(Object_Call_int__OptionalHandle(this.handle, "getItemAtIndex", row));
  }
  int getIndexOfItem(T0)(scope auto ref Optional!(T0) item) if (isTOrPointer!(T0, Element)) {
    return Serialize_Object_VarArgCall!int(this.handle, "getIndexOfItem", "Optional!Handle", tuple(!item.empty, cast(Handle)item.front._parent));
  }
  int rowCount()() {
    return Object_Getter__int(this.handle, "rowCount");
  }
  void selection(T0)(scope auto ref Optional!(T0) selection) if (isTOrPointer!(T0, nsITreeSelection)) {
    Serialize_Object_VarArgCall!void(this.handle, "selection", "Optional!Handle", tuple(!selection.empty, cast(Handle)selection.front.handle));
  }
  auto selection()() {
    return recastOpt!(nsITreeSelection)(Object_Getter__OptionalHandle(this.handle, "selection"));
  }
  string getRowProperties()(int row) {
    return Serialize_Object_VarArgCall!string(this.handle, "getRowProperties", "int", tuple(row));
  }
  string getCellProperties()(int row, scope ref TreeColumn column) {
    return Serialize_Object_VarArgCall!string(this.handle, "getCellProperties", "int;Handle", tuple(row, cast(Handle)column.handle));
  }
  string getColumnProperties()(scope ref TreeColumn column) {
    return Serialize_Object_VarArgCall!string(this.handle, "getColumnProperties", "Handle", tuple(cast(Handle)column.handle));
  }
  bool isContainer()(int row) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isContainer", "int", tuple(row));
  }
  bool isContainerOpen()(int row) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isContainerOpen", "int", tuple(row));
  }
  bool isContainerEmpty()(int row) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isContainerEmpty", "int", tuple(row));
  }
  bool isSeparator()(int row) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isSeparator", "int", tuple(row));
  }
  bool isSorted()() {
    return Object_Getter__bool(this.handle, "isSorted");
  }
  enum short DROP_BEFORE = -1;
  enum short DROP_ON = 0;
  enum short DROP_AFTER = 1;
  bool canDrop(T2)(int row, int orientation, scope auto ref Optional!(T2) dataTransfer) if (isTOrPointer!(T2, DataTransfer)) {
    return Serialize_Object_VarArgCall!bool(this.handle, "canDrop", "int;int;Optional!Handle", tuple(row, orientation, !dataTransfer.empty, cast(Handle)dataTransfer.front.handle));
  }
  void drop(T2)(int row, int orientation, scope auto ref Optional!(T2) dataTransfer) if (isTOrPointer!(T2, DataTransfer)) {
    Serialize_Object_VarArgCall!void(this.handle, "drop", "int;int;Optional!Handle", tuple(row, orientation, !dataTransfer.empty, cast(Handle)dataTransfer.front.handle));
  }
  int getParentIndex()(int row) {
    return Serialize_Object_VarArgCall!int(this.handle, "getParentIndex", "int", tuple(row));
  }
  bool hasNextSibling()(int row, int afterIndex) {
    return Serialize_Object_VarArgCall!bool(this.handle, "hasNextSibling", "int;int", tuple(row, afterIndex));
  }
  int getLevel()(int row) {
    return Serialize_Object_VarArgCall!int(this.handle, "getLevel", "int", tuple(row));
  }
  string getImageSrc()(int row, scope ref TreeColumn column) {
    return Serialize_Object_VarArgCall!string(this.handle, "getImageSrc", "int;Handle", tuple(row, cast(Handle)column.handle));
  }
  string getCellValue()(int row, scope ref TreeColumn column) {
    return Serialize_Object_VarArgCall!string(this.handle, "getCellValue", "int;Handle", tuple(row, cast(Handle)column.handle));
  }
  string getCellText()(int row, scope ref TreeColumn column) {
    return Serialize_Object_VarArgCall!string(this.handle, "getCellText", "int;Handle", tuple(row, cast(Handle)column.handle));
  }
  void setTree(T0)(scope auto ref Optional!(T0) tree) if (isTOrPointer!(T0, XULTreeElement)) {
    Serialize_Object_VarArgCall!void(this.handle, "setTree", "Optional!Handle", tuple(!tree.empty, cast(Handle)tree.front.handle));
  }
  void toggleOpenState()(int row) {
    Object_Call_int__void(this.handle, "toggleOpenState", row);
  }
  void cycleHeader()(scope ref TreeColumn column) {
    Object_Call_Handle__void(this.handle, "cycleHeader", column.handle);
  }
  void selectionChanged()() {
    Object_Call__void(this.handle, "selectionChanged");
  }
  void cycleCell()(int row, scope ref TreeColumn column) {
    Serialize_Object_VarArgCall!void(this.handle, "cycleCell", "int;Handle", tuple(row, cast(Handle)column.handle));
  }
  bool isEditable()(int row, scope ref TreeColumn column) {
    return Serialize_Object_VarArgCall!bool(this.handle, "isEditable", "int;Handle", tuple(row, cast(Handle)column.handle));
  }
  void setCellValue()(int row, scope ref TreeColumn column, string value) {
    Serialize_Object_VarArgCall!void(this.handle, "setCellValue", "int;Handle;string", tuple(row, cast(Handle)column.handle, value));
  }
  void setCellText()(int row, scope ref TreeColumn column, string value) {
    Serialize_Object_VarArgCall!void(this.handle, "setCellText", "int;Handle;string", tuple(row, cast(Handle)column.handle, value));
  }
  void performAction()(string action) {
    Object_Call_string__void(this.handle, "performAction", action);
  }
  void performActionOnRow()(string action, int row) {
    Serialize_Object_VarArgCall!void(this.handle, "performActionOnRow", "string;int", tuple(action, row));
  }
  void performActionOnCell()(string action, int row, scope ref TreeColumn column) {
    Serialize_Object_VarArgCall!void(this.handle, "performActionOnCell", "string;int;Handle", tuple(action, row, cast(Handle)column.handle));
  }
  auto QueryInterface(T0)(scope auto ref T0 iid) {
    // Any
    Handle _handle_iid = getOrCreateHandle(iid);
    auto result = nsISupports(Object_Call_Handle__Handle(this.handle, "QueryInterface", _handle_iid));
    dropHandle!(T0)(_handle_iid);
    return result;
  }
}


