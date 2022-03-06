module spasm.bindings.TreeView;

import spasm.types;
import spasm.bindings.DataTransfer;
import spasm.bindings.TreeColumn;

@safe:
nothrow:

struct TreeView {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  int rowCount()() {
    return Object_Getter__int(this.handle, "rowCount");
  }
  void selection(T0)(scope auto ref Optional!(T0) selection) if (isTOrPointer!(T0, nsITreeSelection)) {
    TreeView_selection_Set(this.handle, !selection.empty, selection.front.handle);
  }
  auto selection()() {
    return Object_Getter__OptionalHandle(this.handle, "selection");
  }
  string getRowProperties()(int row) {
    return TreeView_getRowProperties(this.handle, row);
  }
  string getCellProperties()(int row, scope ref TreeColumn column) {
    return TreeView_getCellProperties(this.handle, row, column.handle);
  }
  string getColumnProperties()(scope ref TreeColumn column) {
    return TreeView_getColumnProperties(this.handle, column.handle);
  }
  bool isContainer()(int row) {
    return TreeView_isContainer(this.handle, row);
  }
  bool isContainerOpen()(int row) {
    return TreeView_isContainerOpen(this.handle, row);
  }
  bool isContainerEmpty()(int row) {
    return TreeView_isContainerEmpty(this.handle, row);
  }
  bool isSeparator()(int row) {
    return TreeView_isSeparator(this.handle, row);
  }
  bool isSorted()() {
    return Object_Getter__bool(this.handle, "isSorted");
  }
  enum short DROP_BEFORE = -1;
  enum short DROP_ON = 0;
  enum short DROP_AFTER = 1;
  bool canDrop(T2)(int row, int orientation, scope auto ref Optional!(T2) dataTransfer) if (isTOrPointer!(T2, DataTransfer)) {
    return TreeView_canDrop(this.handle, row, orientation, !dataTransfer.empty, dataTransfer.front.handle);
  }
  void drop(T2)(int row, int orientation, scope auto ref Optional!(T2) dataTransfer) if (isTOrPointer!(T2, DataTransfer)) {
    TreeView_drop(this.handle, row, orientation, !dataTransfer.empty, dataTransfer.front.handle);
  }
  int getParentIndex()(int row) {
    return TreeView_getParentIndex(this.handle, row);
  }
  bool hasNextSibling()(int row, int afterIndex) {
    return TreeView_hasNextSibling(this.handle, row, afterIndex);
  }
  int getLevel()(int row) {
    return TreeView_getLevel(this.handle, row);
  }
  string getImageSrc()(int row, scope ref TreeColumn column) {
    return TreeView_getImageSrc(this.handle, row, column.handle);
  }
  string getCellValue()(int row, scope ref TreeColumn column) {
    return TreeView_getCellValue(this.handle, row, column.handle);
  }
  string getCellText()(int row, scope ref TreeColumn column) {
    return TreeView_getCellText(this.handle, row, column.handle);
  }
  void setTree(T0)(scope auto ref Optional!(T0) tree) if (isTOrPointer!(T0, XULTreeElement)) {
    TreeView_setTree(this.handle, !tree.empty, tree.front.handle);
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
    TreeView_cycleCell(this.handle, row, column.handle);
  }
  bool isEditable()(int row, scope ref TreeColumn column) {
    return TreeView_isEditable(this.handle, row, column.handle);
  }
  void setCellValue()(int row, scope ref TreeColumn column, string value) {
    TreeView_setCellValue(this.handle, row, column.handle, value);
  }
  void setCellText()(int row, scope ref TreeColumn column, string value) {
    TreeView_setCellText(this.handle, row, column.handle, value);
  }
  void performAction()(string action) {
    Object_Call_string__void(this.handle, "performAction", action);
  }
  void performActionOnRow()(string action, int row) {
    TreeView_performActionOnRow(this.handle, action, row);
  }
  void performActionOnCell()(string action, int row, scope ref TreeColumn column) {
    TreeView_performActionOnCell(this.handle, action, row, column.handle);
  }
}


extern (C) void TreeView_selection_Set(Handle, bool, Handle);
extern (C) string TreeView_getRowProperties(Handle, int);
extern (C) string TreeView_getCellProperties(Handle, int, Handle);
extern (C) string TreeView_getColumnProperties(Handle, Handle);
extern (C) bool TreeView_isContainer(Handle, int);
extern (C) bool TreeView_isContainerOpen(Handle, int);
extern (C) bool TreeView_isContainerEmpty(Handle, int);
extern (C) bool TreeView_isSeparator(Handle, int);
extern (C) bool TreeView_canDrop(Handle, int, int, bool, Handle);
extern (C) void TreeView_drop(Handle, int, int, bool, Handle);
extern (C) int TreeView_getParentIndex(Handle, int);
extern (C) bool TreeView_hasNextSibling(Handle, int, int);
extern (C) int TreeView_getLevel(Handle, int);
extern (C) string TreeView_getImageSrc(Handle, int, Handle);
extern (C) string TreeView_getCellValue(Handle, int, Handle);
extern (C) string TreeView_getCellText(Handle, int, Handle);
extern (C) void TreeView_setTree(Handle, bool, Handle);
extern (C) void TreeView_cycleCell(Handle, int, Handle);
extern (C) bool TreeView_isEditable(Handle, int, Handle);
extern (C) void TreeView_setCellValue(Handle, int, Handle, string);
extern (C) void TreeView_setCellText(Handle, int, Handle, string);
extern (C) void TreeView_performActionOnRow(Handle, string, int);
extern (C) void TreeView_performActionOnCell(Handle, string, int, Handle);