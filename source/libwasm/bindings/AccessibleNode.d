module libwasm.bindings.AccessibleNode;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Node;

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
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this.handle, "DOMNode"));
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
    Serialize_Object_VarArgCall!void(this.handle, "role", "Optional!(string)", tuple(!role.empty, role.front));
  }
  Optional!(string) role()() {
    return Object_Getter__OptionalString(this.handle, "role");
  }
  void roleDescription(T0)(scope auto ref Optional!(T0) roleDescription) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "roleDescription", "Optional!(string)", tuple(!roleDescription.empty, roleDescription.front));
  }
  Optional!(string) roleDescription()() {
    return Object_Getter__OptionalString(this.handle, "roleDescription");
  }
  void label(T0)(scope auto ref Optional!(T0) label) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "label", "Optional!(string)", tuple(!label.empty, label.front));
  }
  Optional!(string) label()() {
    return Object_Getter__OptionalString(this.handle, "label");
  }
  void current(T0)(scope auto ref Optional!(T0) current) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "current", "Optional!(string)", tuple(!current.empty, current.front));
  }
  Optional!(string) current()() {
    return Object_Getter__OptionalString(this.handle, "current");
  }
  void autocomplete(T0)(scope auto ref Optional!(T0) autocomplete) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "autocomplete", "Optional!(string)", tuple(!autocomplete.empty, autocomplete.front));
  }
  Optional!(string) autocomplete()() {
    return Object_Getter__OptionalString(this.handle, "autocomplete");
  }
  void keyShortcuts(T0)(scope auto ref Optional!(T0) keyShortcuts) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "keyShortcuts", "Optional!(string)", tuple(!keyShortcuts.empty, keyShortcuts.front));
  }
  Optional!(string) keyShortcuts()() {
    return Object_Getter__OptionalString(this.handle, "keyShortcuts");
  }
  void modal(T0)(scope auto ref Optional!(T0) modal) if (isTOrPointer!(T0, bool)) {
    Serialize_Object_VarArgCall!void(this.handle, "modal", "Optional!(bool)", tuple(!modal.empty, modal.front));
  }
  Optional!(bool) modal()() {
    return Object_Getter__OptionalBool(this.handle, "modal");
  }
  void multiline(T0)(scope auto ref Optional!(T0) multiline) if (isTOrPointer!(T0, bool)) {
    Serialize_Object_VarArgCall!void(this.handle, "multiline", "Optional!(bool)", tuple(!multiline.empty, multiline.front));
  }
  Optional!(bool) multiline()() {
    return Object_Getter__OptionalBool(this.handle, "multiline");
  }
  void multiselectable(T0)(scope auto ref Optional!(T0) multiselectable) if (isTOrPointer!(T0, bool)) {
    Serialize_Object_VarArgCall!void(this.handle, "multiselectable", "Optional!(bool)", tuple(!multiselectable.empty, multiselectable.front));
  }
  Optional!(bool) multiselectable()() {
    return Object_Getter__OptionalBool(this.handle, "multiselectable");
  }
  void orientation(T0)(scope auto ref Optional!(T0) orientation) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "orientation", "Optional!(string)", tuple(!orientation.empty, orientation.front));
  }
  Optional!(string) orientation()() {
    return Object_Getter__OptionalString(this.handle, "orientation");
  }
  void readOnly(T0)(scope auto ref Optional!(T0) readOnly) if (isTOrPointer!(T0, bool)) {
    Serialize_Object_VarArgCall!void(this.handle, "readOnly", "Optional!(bool)", tuple(!readOnly.empty, readOnly.front));
  }
  Optional!(bool) readOnly()() {
    return Object_Getter__OptionalBool(this.handle, "readOnly");
  }
  void required(T0)(scope auto ref Optional!(T0) required) if (isTOrPointer!(T0, bool)) {
    Serialize_Object_VarArgCall!void(this.handle, "required", "Optional!(bool)", tuple(!required.empty, required.front));
  }
  Optional!(bool) required()() {
    return Object_Getter__OptionalBool(this.handle, "required");
  }
  void sort(T0)(scope auto ref Optional!(T0) sort) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "sort", "Optional!(string)", tuple(!sort.empty, sort.front));
  }
  Optional!(string) sort()() {
    return Object_Getter__OptionalString(this.handle, "sort");
  }
  void placeholder(T0)(scope auto ref Optional!(T0) placeholder) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "placeholder", "Optional!(string)", tuple(!placeholder.empty, placeholder.front));
  }
  Optional!(string) placeholder()() {
    return Object_Getter__OptionalString(this.handle, "placeholder");
  }
  void valueMax(T0)(scope auto ref Optional!(T0) valueMax) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this.handle, "valueMax", "Optional!(double)", tuple(!valueMax.empty, valueMax.front));
  }
  Optional!(double) valueMax()() {
    return Object_Getter__OptionalDouble(this.handle, "valueMax");
  }
  void valueMin(T0)(scope auto ref Optional!(T0) valueMin) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this.handle, "valueMin", "Optional!(double)", tuple(!valueMin.empty, valueMin.front));
  }
  Optional!(double) valueMin()() {
    return Object_Getter__OptionalDouble(this.handle, "valueMin");
  }
  void valueNow(T0)(scope auto ref Optional!(T0) valueNow) if (isTOrPointer!(T0, double)) {
    Serialize_Object_VarArgCall!void(this.handle, "valueNow", "Optional!(double)", tuple(!valueNow.empty, valueNow.front));
  }
  Optional!(double) valueNow()() {
    return Object_Getter__OptionalDouble(this.handle, "valueNow");
  }
  void valueText(T0)(scope auto ref Optional!(T0) valueText) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "valueText", "Optional!(string)", tuple(!valueText.empty, valueText.front));
  }
  Optional!(string) valueText()() {
    return Object_Getter__OptionalString(this.handle, "valueText");
  }
  void checked(T0)(scope auto ref Optional!(T0) checked) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "checked", "Optional!(string)", tuple(!checked.empty, checked.front));
  }
  Optional!(string) checked()() {
    return Object_Getter__OptionalString(this.handle, "checked");
  }
  void disabled(T0)(scope auto ref Optional!(T0) disabled) if (isTOrPointer!(T0, bool)) {
    Serialize_Object_VarArgCall!void(this.handle, "disabled", "Optional!(bool)", tuple(!disabled.empty, disabled.front));
  }
  Optional!(bool) disabled()() {
    return Object_Getter__OptionalBool(this.handle, "disabled");
  }
  void expanded(T0)(scope auto ref Optional!(T0) expanded) if (isTOrPointer!(T0, bool)) {
    Serialize_Object_VarArgCall!void(this.handle, "expanded", "Optional!(bool)", tuple(!expanded.empty, expanded.front));
  }
  Optional!(bool) expanded()() {
    return Object_Getter__OptionalBool(this.handle, "expanded");
  }
  void hasPopUp(T0)(scope auto ref Optional!(T0) hasPopUp) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "hasPopUp", "Optional!(string)", tuple(!hasPopUp.empty, hasPopUp.front));
  }
  Optional!(string) hasPopUp()() {
    return Object_Getter__OptionalString(this.handle, "hasPopUp");
  }
  void hidden(T0)(scope auto ref Optional!(T0) hidden) if (isTOrPointer!(T0, bool)) {
    Serialize_Object_VarArgCall!void(this.handle, "hidden", "Optional!(bool)", tuple(!hidden.empty, hidden.front));
  }
  Optional!(bool) hidden()() {
    return Object_Getter__OptionalBool(this.handle, "hidden");
  }
  void invalid(T0)(scope auto ref Optional!(T0) invalid) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "invalid", "Optional!(string)", tuple(!invalid.empty, invalid.front));
  }
  Optional!(string) invalid()() {
    return Object_Getter__OptionalString(this.handle, "invalid");
  }
  void pressed(T0)(scope auto ref Optional!(T0) pressed) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "pressed", "Optional!(string)", tuple(!pressed.empty, pressed.front));
  }
  Optional!(string) pressed()() {
    return Object_Getter__OptionalString(this.handle, "pressed");
  }
  void selected(T0)(scope auto ref Optional!(T0) selected) if (isTOrPointer!(T0, bool)) {
    Serialize_Object_VarArgCall!void(this.handle, "selected", "Optional!(bool)", tuple(!selected.empty, selected.front));
  }
  Optional!(bool) selected()() {
    return Object_Getter__OptionalBool(this.handle, "selected");
  }
  void atomic(T0)(scope auto ref Optional!(T0) atomic) if (isTOrPointer!(T0, bool)) {
    Serialize_Object_VarArgCall!void(this.handle, "atomic", "Optional!(bool)", tuple(!atomic.empty, atomic.front));
  }
  Optional!(bool) atomic()() {
    return Object_Getter__OptionalBool(this.handle, "atomic");
  }
  void busy(T0)(scope auto ref Optional!(T0) busy) if (isTOrPointer!(T0, bool)) {
    Serialize_Object_VarArgCall!void(this.handle, "busy", "Optional!(bool)", tuple(!busy.empty, busy.front));
  }
  Optional!(bool) busy()() {
    return Object_Getter__OptionalBool(this.handle, "busy");
  }
  void live(T0)(scope auto ref Optional!(T0) live) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "live", "Optional!(string)", tuple(!live.empty, live.front));
  }
  Optional!(string) live()() {
    return Object_Getter__OptionalString(this.handle, "live");
  }
  void relevant(T0)(scope auto ref Optional!(T0) relevant) if (isTOrPointer!(T0, string)) {
    Serialize_Object_VarArgCall!void(this.handle, "relevant", "Optional!(string)", tuple(!relevant.empty, relevant.front));
  }
  Optional!(string) relevant()() {
    return Object_Getter__OptionalString(this.handle, "relevant");
  }
  void activeDescendant(T0)(scope auto ref Optional!(T0) activeDescendant) if (isTOrPointer!(T0, AccessibleNode)) {
    Serialize_Object_VarArgCall!void(this.handle, "activeDescendant", "Optional!Handle", tuple(!activeDescendant.empty, cast(Handle)activeDescendant.front.handle));
  }
  auto activeDescendant()() {
    return recastOpt!(AccessibleNode)(Object_Getter__OptionalHandle(this.handle, "activeDescendant"));
  }
  void details(T0)(scope auto ref Optional!(T0) details) if (isTOrPointer!(T0, AccessibleNode)) {
    Serialize_Object_VarArgCall!void(this.handle, "details", "Optional!Handle", tuple(!details.empty, cast(Handle)details.front.handle));
  }
  auto details()() {
    return recastOpt!(AccessibleNode)(Object_Getter__OptionalHandle(this.handle, "details"));
  }
  void errorMessage(T0)(scope auto ref Optional!(T0) errorMessage) if (isTOrPointer!(T0, AccessibleNode)) {
    Serialize_Object_VarArgCall!void(this.handle, "errorMessage", "Optional!Handle", tuple(!errorMessage.empty, cast(Handle)errorMessage.front.handle));
  }
  auto errorMessage()() {
    return recastOpt!(AccessibleNode)(Object_Getter__OptionalHandle(this.handle, "errorMessage"));
  }
  void colCount(T0)(scope auto ref Optional!(T0) colCount) if (isTOrPointer!(T0, int)) {
    Serialize_Object_VarArgCall!void(this.handle, "colCount", "Optional!(int)", tuple(!colCount.empty, colCount.front));
  }
  Optional!(int) colCount()() {
    return AccessibleNode_colCount_Get(this.handle);
  }
  void colIndex(T0)(scope auto ref Optional!(T0) colIndex) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this.handle, "colIndex", "Optional!(uint)", tuple(!colIndex.empty, colIndex.front));
  }
  Optional!(uint) colIndex()() {
    return Object_Getter__OptionalUint(this.handle, "colIndex");
  }
  void colSpan(T0)(scope auto ref Optional!(T0) colSpan) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this.handle, "colSpan", "Optional!(uint)", tuple(!colSpan.empty, colSpan.front));
  }
  Optional!(uint) colSpan()() {
    return Object_Getter__OptionalUint(this.handle, "colSpan");
  }
  void level(T0)(scope auto ref Optional!(T0) level) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this.handle, "level", "Optional!(uint)", tuple(!level.empty, level.front));
  }
  Optional!(uint) level()() {
    return Object_Getter__OptionalUint(this.handle, "level");
  }
  void posInSet(T0)(scope auto ref Optional!(T0) posInSet) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this.handle, "posInSet", "Optional!(uint)", tuple(!posInSet.empty, posInSet.front));
  }
  Optional!(uint) posInSet()() {
    return Object_Getter__OptionalUint(this.handle, "posInSet");
  }
  void rowCount(T0)(scope auto ref Optional!(T0) rowCount) if (isTOrPointer!(T0, int)) {
    Serialize_Object_VarArgCall!void(this.handle, "rowCount", "Optional!(int)", tuple(!rowCount.empty, rowCount.front));
  }
  Optional!(int) rowCount()() {
    return AccessibleNode_rowCount_Get(this.handle);
  }
  void rowIndex(T0)(scope auto ref Optional!(T0) rowIndex) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this.handle, "rowIndex", "Optional!(uint)", tuple(!rowIndex.empty, rowIndex.front));
  }
  Optional!(uint) rowIndex()() {
    return Object_Getter__OptionalUint(this.handle, "rowIndex");
  }
  void rowSpan(T0)(scope auto ref Optional!(T0) rowSpan) if (isTOrPointer!(T0, uint)) {
    Serialize_Object_VarArgCall!void(this.handle, "rowSpan", "Optional!(uint)", tuple(!rowSpan.empty, rowSpan.front));
  }
  Optional!(uint) rowSpan()() {
    return Object_Getter__OptionalUint(this.handle, "rowSpan");
  }
  void setSize(T0)(scope auto ref Optional!(T0) setSize) if (isTOrPointer!(T0, int)) {
    Serialize_Object_VarArgCall!void(this.handle, "setSize", "Optional!(int)", tuple(!setSize.empty, setSize.front));
  }
  Optional!(int) setSize()() {
    return AccessibleNode_setSize_Get(this.handle);
  }
}


extern (C) Optional!(int) AccessibleNode_colCount_Get(Handle);
extern (C) Optional!(int) AccessibleNode_rowCount_Get(Handle);
extern (C) Optional!(int) AccessibleNode_setSize_Get(Handle);