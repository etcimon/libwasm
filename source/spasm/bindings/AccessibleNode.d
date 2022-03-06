module spasm.bindings.AccessibleNode;

import spasm.types;
import spasm.bindings.Node;

@safe:
nothrow:

struct AccessibleNode {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  string computedRole()() {
    return Object_Getter__string(this.handle, "computedRole");
  }
  auto states()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "states"));
  }
  auto attributes()() {
    return Sequence!(string)(Object_Getter__Handle(this.handle, "attributes"));
  }
  auto DOMNode()() {
    return Object_Getter__OptionalHandle(this.handle, "DOMNode");
  }
  bool is_()(string states) {
    return Object_Call_string__bool(this.handle, "is", states);
  }
  bool has()(string attributes) {
    return Object_Call_string__bool(this.handle, "has", attributes);
  }
  auto get()(string attribute) {
    return Any(Object_Call_string__Handle(this.handle, "get", attribute));
  }
  void role(T0)(scope auto ref Optional!(T0) role) if (isTOrPointer!(T0, string)) {
    AccessibleNode_role_Set(this.handle, !role.empty, role.front);
  }
  Optional!(string) role()() {
    return Object_Getter__OptionalString(this.handle, "role");
  }
  void roleDescription(T0)(scope auto ref Optional!(T0) roleDescription) if (isTOrPointer!(T0, string)) {
    AccessibleNode_roleDescription_Set(this.handle, !roleDescription.empty, roleDescription.front);
  }
  Optional!(string) roleDescription()() {
    return Object_Getter__OptionalString(this.handle, "roleDescription");
  }
  void label(T0)(scope auto ref Optional!(T0) label) if (isTOrPointer!(T0, string)) {
    AccessibleNode_label_Set(this.handle, !label.empty, label.front);
  }
  Optional!(string) label()() {
    return Object_Getter__OptionalString(this.handle, "label");
  }
  void current(T0)(scope auto ref Optional!(T0) current) if (isTOrPointer!(T0, string)) {
    AccessibleNode_current_Set(this.handle, !current.empty, current.front);
  }
  Optional!(string) current()() {
    return Object_Getter__OptionalString(this.handle, "current");
  }
  void autocomplete(T0)(scope auto ref Optional!(T0) autocomplete) if (isTOrPointer!(T0, string)) {
    AccessibleNode_autocomplete_Set(this.handle, !autocomplete.empty, autocomplete.front);
  }
  Optional!(string) autocomplete()() {
    return Object_Getter__OptionalString(this.handle, "autocomplete");
  }
  void keyShortcuts(T0)(scope auto ref Optional!(T0) keyShortcuts) if (isTOrPointer!(T0, string)) {
    AccessibleNode_keyShortcuts_Set(this.handle, !keyShortcuts.empty, keyShortcuts.front);
  }
  Optional!(string) keyShortcuts()() {
    return Object_Getter__OptionalString(this.handle, "keyShortcuts");
  }
  void modal(T0)(scope auto ref Optional!(T0) modal) if (isTOrPointer!(T0, bool)) {
    AccessibleNode_modal_Set(this.handle, !modal.empty, modal.front);
  }
  Optional!(bool) modal()() {
    return Object_Getter__OptionalBool(this.handle, "modal");
  }
  void multiline(T0)(scope auto ref Optional!(T0) multiline) if (isTOrPointer!(T0, bool)) {
    AccessibleNode_multiline_Set(this.handle, !multiline.empty, multiline.front);
  }
  Optional!(bool) multiline()() {
    return Object_Getter__OptionalBool(this.handle, "multiline");
  }
  void multiselectable(T0)(scope auto ref Optional!(T0) multiselectable) if (isTOrPointer!(T0, bool)) {
    AccessibleNode_multiselectable_Set(this.handle, !multiselectable.empty, multiselectable.front);
  }
  Optional!(bool) multiselectable()() {
    return Object_Getter__OptionalBool(this.handle, "multiselectable");
  }
  void orientation(T0)(scope auto ref Optional!(T0) orientation) if (isTOrPointer!(T0, string)) {
    AccessibleNode_orientation_Set(this.handle, !orientation.empty, orientation.front);
  }
  Optional!(string) orientation()() {
    return Object_Getter__OptionalString(this.handle, "orientation");
  }
  void readOnly(T0)(scope auto ref Optional!(T0) readOnly) if (isTOrPointer!(T0, bool)) {
    AccessibleNode_readOnly_Set(this.handle, !readOnly.empty, readOnly.front);
  }
  Optional!(bool) readOnly()() {
    return Object_Getter__OptionalBool(this.handle, "readOnly");
  }
  void required(T0)(scope auto ref Optional!(T0) required) if (isTOrPointer!(T0, bool)) {
    AccessibleNode_required_Set(this.handle, !required.empty, required.front);
  }
  Optional!(bool) required()() {
    return Object_Getter__OptionalBool(this.handle, "required");
  }
  void sort(T0)(scope auto ref Optional!(T0) sort) if (isTOrPointer!(T0, string)) {
    AccessibleNode_sort_Set(this.handle, !sort.empty, sort.front);
  }
  Optional!(string) sort()() {
    return Object_Getter__OptionalString(this.handle, "sort");
  }
  void placeholder(T0)(scope auto ref Optional!(T0) placeholder) if (isTOrPointer!(T0, string)) {
    AccessibleNode_placeholder_Set(this.handle, !placeholder.empty, placeholder.front);
  }
  Optional!(string) placeholder()() {
    return Object_Getter__OptionalString(this.handle, "placeholder");
  }
  void valueMax(T0)(scope auto ref Optional!(T0) valueMax) if (isTOrPointer!(T0, double)) {
    AccessibleNode_valueMax_Set(this.handle, !valueMax.empty, valueMax.front);
  }
  Optional!(double) valueMax()() {
    return Object_Getter__OptionalDouble(this.handle, "valueMax");
  }
  void valueMin(T0)(scope auto ref Optional!(T0) valueMin) if (isTOrPointer!(T0, double)) {
    AccessibleNode_valueMin_Set(this.handle, !valueMin.empty, valueMin.front);
  }
  Optional!(double) valueMin()() {
    return Object_Getter__OptionalDouble(this.handle, "valueMin");
  }
  void valueNow(T0)(scope auto ref Optional!(T0) valueNow) if (isTOrPointer!(T0, double)) {
    AccessibleNode_valueNow_Set(this.handle, !valueNow.empty, valueNow.front);
  }
  Optional!(double) valueNow()() {
    return Object_Getter__OptionalDouble(this.handle, "valueNow");
  }
  void valueText(T0)(scope auto ref Optional!(T0) valueText) if (isTOrPointer!(T0, string)) {
    AccessibleNode_valueText_Set(this.handle, !valueText.empty, valueText.front);
  }
  Optional!(string) valueText()() {
    return Object_Getter__OptionalString(this.handle, "valueText");
  }
  void checked(T0)(scope auto ref Optional!(T0) checked) if (isTOrPointer!(T0, string)) {
    AccessibleNode_checked_Set(this.handle, !checked.empty, checked.front);
  }
  Optional!(string) checked()() {
    return Object_Getter__OptionalString(this.handle, "checked");
  }
  void disabled(T0)(scope auto ref Optional!(T0) disabled) if (isTOrPointer!(T0, bool)) {
    AccessibleNode_disabled_Set(this.handle, !disabled.empty, disabled.front);
  }
  Optional!(bool) disabled()() {
    return Object_Getter__OptionalBool(this.handle, "disabled");
  }
  void expanded(T0)(scope auto ref Optional!(T0) expanded) if (isTOrPointer!(T0, bool)) {
    AccessibleNode_expanded_Set(this.handle, !expanded.empty, expanded.front);
  }
  Optional!(bool) expanded()() {
    return Object_Getter__OptionalBool(this.handle, "expanded");
  }
  void hasPopUp(T0)(scope auto ref Optional!(T0) hasPopUp) if (isTOrPointer!(T0, string)) {
    AccessibleNode_hasPopUp_Set(this.handle, !hasPopUp.empty, hasPopUp.front);
  }
  Optional!(string) hasPopUp()() {
    return Object_Getter__OptionalString(this.handle, "hasPopUp");
  }
  void hidden(T0)(scope auto ref Optional!(T0) hidden) if (isTOrPointer!(T0, bool)) {
    AccessibleNode_hidden_Set(this.handle, !hidden.empty, hidden.front);
  }
  Optional!(bool) hidden()() {
    return Object_Getter__OptionalBool(this.handle, "hidden");
  }
  void invalid(T0)(scope auto ref Optional!(T0) invalid) if (isTOrPointer!(T0, string)) {
    AccessibleNode_invalid_Set(this.handle, !invalid.empty, invalid.front);
  }
  Optional!(string) invalid()() {
    return Object_Getter__OptionalString(this.handle, "invalid");
  }
  void pressed(T0)(scope auto ref Optional!(T0) pressed) if (isTOrPointer!(T0, string)) {
    AccessibleNode_pressed_Set(this.handle, !pressed.empty, pressed.front);
  }
  Optional!(string) pressed()() {
    return Object_Getter__OptionalString(this.handle, "pressed");
  }
  void selected(T0)(scope auto ref Optional!(T0) selected) if (isTOrPointer!(T0, bool)) {
    AccessibleNode_selected_Set(this.handle, !selected.empty, selected.front);
  }
  Optional!(bool) selected()() {
    return Object_Getter__OptionalBool(this.handle, "selected");
  }
  void atomic(T0)(scope auto ref Optional!(T0) atomic) if (isTOrPointer!(T0, bool)) {
    AccessibleNode_atomic_Set(this.handle, !atomic.empty, atomic.front);
  }
  Optional!(bool) atomic()() {
    return Object_Getter__OptionalBool(this.handle, "atomic");
  }
  void busy(T0)(scope auto ref Optional!(T0) busy) if (isTOrPointer!(T0, bool)) {
    AccessibleNode_busy_Set(this.handle, !busy.empty, busy.front);
  }
  Optional!(bool) busy()() {
    return Object_Getter__OptionalBool(this.handle, "busy");
  }
  void live(T0)(scope auto ref Optional!(T0) live) if (isTOrPointer!(T0, string)) {
    AccessibleNode_live_Set(this.handle, !live.empty, live.front);
  }
  Optional!(string) live()() {
    return Object_Getter__OptionalString(this.handle, "live");
  }
  void relevant(T0)(scope auto ref Optional!(T0) relevant) if (isTOrPointer!(T0, string)) {
    AccessibleNode_relevant_Set(this.handle, !relevant.empty, relevant.front);
  }
  Optional!(string) relevant()() {
    return Object_Getter__OptionalString(this.handle, "relevant");
  }
  void activeDescendant(T0)(scope auto ref Optional!(T0) activeDescendant) if (isTOrPointer!(T0, AccessibleNode)) {
    AccessibleNode_activeDescendant_Set(this.handle, !activeDescendant.empty, activeDescendant.front.handle);
  }
  auto activeDescendant()() {
    return Object_Getter__OptionalHandle(this.handle, "activeDescendant");
  }
  void details(T0)(scope auto ref Optional!(T0) details) if (isTOrPointer!(T0, AccessibleNode)) {
    AccessibleNode_details_Set(this.handle, !details.empty, details.front.handle);
  }
  auto details()() {
    return Object_Getter__OptionalHandle(this.handle, "details");
  }
  void errorMessage(T0)(scope auto ref Optional!(T0) errorMessage) if (isTOrPointer!(T0, AccessibleNode)) {
    AccessibleNode_errorMessage_Set(this.handle, !errorMessage.empty, errorMessage.front.handle);
  }
  auto errorMessage()() {
    return Object_Getter__OptionalHandle(this.handle, "errorMessage");
  }
  void colCount(T0)(scope auto ref Optional!(T0) colCount) if (isTOrPointer!(T0, int)) {
    AccessibleNode_colCount_Set(this.handle, !colCount.empty, colCount.front);
  }
  Optional!(int) colCount()() {
    return AccessibleNode_colCount_Get(this.handle);
  }
  void colIndex(T0)(scope auto ref Optional!(T0) colIndex) if (isTOrPointer!(T0, uint)) {
    AccessibleNode_colIndex_Set(this.handle, !colIndex.empty, colIndex.front);
  }
  Optional!(uint) colIndex()() {
    return Object_Getter__OptionalUint(this.handle, "colIndex");
  }
  void colSpan(T0)(scope auto ref Optional!(T0) colSpan) if (isTOrPointer!(T0, uint)) {
    AccessibleNode_colSpan_Set(this.handle, !colSpan.empty, colSpan.front);
  }
  Optional!(uint) colSpan()() {
    return Object_Getter__OptionalUint(this.handle, "colSpan");
  }
  void level(T0)(scope auto ref Optional!(T0) level) if (isTOrPointer!(T0, uint)) {
    AccessibleNode_level_Set(this.handle, !level.empty, level.front);
  }
  Optional!(uint) level()() {
    return Object_Getter__OptionalUint(this.handle, "level");
  }
  void posInSet(T0)(scope auto ref Optional!(T0) posInSet) if (isTOrPointer!(T0, uint)) {
    AccessibleNode_posInSet_Set(this.handle, !posInSet.empty, posInSet.front);
  }
  Optional!(uint) posInSet()() {
    return Object_Getter__OptionalUint(this.handle, "posInSet");
  }
  void rowCount(T0)(scope auto ref Optional!(T0) rowCount) if (isTOrPointer!(T0, int)) {
    AccessibleNode_rowCount_Set(this.handle, !rowCount.empty, rowCount.front);
  }
  Optional!(int) rowCount()() {
    return AccessibleNode_rowCount_Get(this.handle);
  }
  void rowIndex(T0)(scope auto ref Optional!(T0) rowIndex) if (isTOrPointer!(T0, uint)) {
    AccessibleNode_rowIndex_Set(this.handle, !rowIndex.empty, rowIndex.front);
  }
  Optional!(uint) rowIndex()() {
    return Object_Getter__OptionalUint(this.handle, "rowIndex");
  }
  void rowSpan(T0)(scope auto ref Optional!(T0) rowSpan) if (isTOrPointer!(T0, uint)) {
    AccessibleNode_rowSpan_Set(this.handle, !rowSpan.empty, rowSpan.front);
  }
  Optional!(uint) rowSpan()() {
    return Object_Getter__OptionalUint(this.handle, "rowSpan");
  }
  void setSize(T0)(scope auto ref Optional!(T0) setSize) if (isTOrPointer!(T0, int)) {
    AccessibleNode_setSize_Set(this.handle, !setSize.empty, setSize.front);
  }
  Optional!(int) setSize()() {
    return AccessibleNode_setSize_Get(this.handle);
  }
}


extern (C) void AccessibleNode_role_Set(Handle, bool, string);
extern (C) void AccessibleNode_roleDescription_Set(Handle, bool, string);
extern (C) void AccessibleNode_label_Set(Handle, bool, string);
extern (C) void AccessibleNode_current_Set(Handle, bool, string);
extern (C) void AccessibleNode_autocomplete_Set(Handle, bool, string);
extern (C) void AccessibleNode_keyShortcuts_Set(Handle, bool, string);
extern (C) void AccessibleNode_modal_Set(Handle, bool, bool);
extern (C) void AccessibleNode_multiline_Set(Handle, bool, bool);
extern (C) void AccessibleNode_multiselectable_Set(Handle, bool, bool);
extern (C) void AccessibleNode_orientation_Set(Handle, bool, string);
extern (C) void AccessibleNode_readOnly_Set(Handle, bool, bool);
extern (C) void AccessibleNode_required_Set(Handle, bool, bool);
extern (C) void AccessibleNode_sort_Set(Handle, bool, string);
extern (C) void AccessibleNode_placeholder_Set(Handle, bool, string);
extern (C) void AccessibleNode_valueMax_Set(Handle, bool, double);
extern (C) void AccessibleNode_valueMin_Set(Handle, bool, double);
extern (C) void AccessibleNode_valueNow_Set(Handle, bool, double);
extern (C) void AccessibleNode_valueText_Set(Handle, bool, string);
extern (C) void AccessibleNode_checked_Set(Handle, bool, string);
extern (C) void AccessibleNode_disabled_Set(Handle, bool, bool);
extern (C) void AccessibleNode_expanded_Set(Handle, bool, bool);
extern (C) void AccessibleNode_hasPopUp_Set(Handle, bool, string);
extern (C) void AccessibleNode_hidden_Set(Handle, bool, bool);
extern (C) void AccessibleNode_invalid_Set(Handle, bool, string);
extern (C) void AccessibleNode_pressed_Set(Handle, bool, string);
extern (C) void AccessibleNode_selected_Set(Handle, bool, bool);
extern (C) void AccessibleNode_atomic_Set(Handle, bool, bool);
extern (C) void AccessibleNode_busy_Set(Handle, bool, bool);
extern (C) void AccessibleNode_live_Set(Handle, bool, string);
extern (C) void AccessibleNode_relevant_Set(Handle, bool, string);
extern (C) void AccessibleNode_activeDescendant_Set(Handle, bool, Handle);
extern (C) void AccessibleNode_details_Set(Handle, bool, Handle);
extern (C) void AccessibleNode_errorMessage_Set(Handle, bool, Handle);
extern (C) void AccessibleNode_colCount_Set(Handle, bool, int);
extern (C) Optional!(int) AccessibleNode_colCount_Get(Handle);
extern (C) void AccessibleNode_colIndex_Set(Handle, bool, uint);
extern (C) void AccessibleNode_colSpan_Set(Handle, bool, uint);
extern (C) void AccessibleNode_level_Set(Handle, bool, uint);
extern (C) void AccessibleNode_posInSet_Set(Handle, bool, uint);
extern (C) void AccessibleNode_rowCount_Set(Handle, bool, int);
extern (C) Optional!(int) AccessibleNode_rowCount_Get(Handle);
extern (C) void AccessibleNode_rowIndex_Set(Handle, bool, uint);
extern (C) void AccessibleNode_rowSpan_Set(Handle, bool, uint);
extern (C) void AccessibleNode_setSize_Set(Handle, bool, int);
extern (C) Optional!(int) AccessibleNode_setSize_Get(Handle);