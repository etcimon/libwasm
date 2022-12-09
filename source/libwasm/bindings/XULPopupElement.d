module libwasm.bindings.XULPopupElement;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.DOMRect;
import libwasm.bindings.Element;
import libwasm.bindings.Event;
import libwasm.bindings.Node;
import libwasm.bindings.XULElement;

@safe:
nothrow:

struct OpenPopupOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return OpenPopupOptions(libwasm_add__object());
  }
  void position()(string position) {
    Object_Call_string__void(this.handle, "position", position);
  }
  string position()() {
    return Object_Getter__string(this.handle, "position");
  }
  void x()(int x) {
    Object_Call_int__void(this.handle, "x", x);
  }
  int x()() {
    return Object_Getter__int(this.handle, "x");
  }
  void y()(int y) {
    Object_Call_int__void(this.handle, "y", y);
  }
  int y()() {
    return Object_Getter__int(this.handle, "y");
  }
  void isContextMenu()(bool isContextMenu) {
    Object_Call_bool__void(this.handle, "isContextMenu", isContextMenu);
  }
  bool isContextMenu()() {
    return Object_Getter__bool(this.handle, "isContextMenu");
  }
  void attributesOverride()(bool attributesOverride) {
    Object_Call_bool__void(this.handle, "attributesOverride", attributesOverride);
  }
  bool attributesOverride()() {
    return Object_Getter__bool(this.handle, "attributesOverride");
  }
  void triggerEvent(T0)(scope auto ref Optional!(T0) triggerEvent) if (isTOrPointer!(T0, Event)) {
    Serialize_Object_VarArgCall!void(this.handle, "triggerEvent", "Optional!Handle", tuple(!triggerEvent.empty, cast(Handle)triggerEvent.front.handle));
  }
  auto triggerEvent()() {
    return recastOpt!(Event)(Object_Getter__OptionalHandle(this.handle, "triggerEvent"));
  }
}
alias StringOrOpenPopupOptions = SumType!(string, OpenPopupOptions);
struct XULPopupElement {
  nothrow:
  libwasm.bindings.XULElement.XULElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .XULElement(h);
  }
  void autoPosition()(bool autoPosition) {
    Object_Call_bool__void(this._parent, "autoPosition", autoPosition);
  }
  bool autoPosition()() {
    return Object_Getter__bool(this._parent, "autoPosition");
  }
  void openPopup(T0, T6)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, scope ref StringOrOpenPopupOptions options, int x /* = 0 */, int y /* = 0 */, bool isContextMenu /* = false */, bool attributesOverride /* = false */, scope auto ref Optional!(T6) triggerEvent /* = no!(Event) */) if (isTOrPointer!(T0, Element) && isTOrPointer!(T6, Event)) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopup", "Optional!Handle;SumType!(string,Handle);int;int;bool;bool;Optional!Handle", tuple(!anchorElement.empty, cast(Handle)anchorElement.front._parent, libwasm.sumtype.match!(((string v) => 0),((ref options.Types[1] v) => 1))(options),tuple(libwasm.sumtype.match!(((string v) => v),((ref options.Types[1] v) => string.init))(options),libwasm.sumtype.match!(((string v) => Handle.init),((ref options.Types[1] v) => cast(Handle)v.handle))(options)), x, y, isContextMenu, attributesOverride, !triggerEvent.empty, cast(Handle)triggerEvent.front.handle));
  }
  void openPopup(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, scope ref StringOrOpenPopupOptions options, int x /* = 0 */, int y /* = 0 */, bool isContextMenu /* = false */, bool attributesOverride /* = false */) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopup", "Optional!Handle;SumType!(string,Handle);int;int;bool;bool", tuple(!anchorElement.empty, cast(Handle)anchorElement.front._parent, libwasm.sumtype.match!(((string v) => 0),((ref options.Types[1] v) => 1))(options),tuple(libwasm.sumtype.match!(((string v) => v),((ref options.Types[1] v) => string.init))(options),libwasm.sumtype.match!(((string v) => Handle.init),((ref options.Types[1] v) => cast(Handle)v.handle))(options)), x, y, isContextMenu, attributesOverride));
  }
  void openPopup(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, scope ref StringOrOpenPopupOptions options, int x /* = 0 */, int y /* = 0 */, bool isContextMenu /* = false */) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopup", "Optional!Handle;SumType!(string,Handle);int;int;bool", tuple(!anchorElement.empty, cast(Handle)anchorElement.front._parent, libwasm.sumtype.match!(((string v) => 0),((ref options.Types[1] v) => 1))(options),tuple(libwasm.sumtype.match!(((string v) => v),((ref options.Types[1] v) => string.init))(options),libwasm.sumtype.match!(((string v) => Handle.init),((ref options.Types[1] v) => cast(Handle)v.handle))(options)), x, y, isContextMenu));
  }
  void openPopup(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, scope ref StringOrOpenPopupOptions options, int x /* = 0 */, int y /* = 0 */) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopup", "Optional!Handle;SumType!(string,Handle);int;int", tuple(!anchorElement.empty, cast(Handle)anchorElement.front._parent, libwasm.sumtype.match!(((string v) => 0),((ref options.Types[1] v) => 1))(options),tuple(libwasm.sumtype.match!(((string v) => v),((ref options.Types[1] v) => string.init))(options),libwasm.sumtype.match!(((string v) => Handle.init),((ref options.Types[1] v) => cast(Handle)v.handle))(options)), x, y));
  }
  void openPopup(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, scope ref StringOrOpenPopupOptions options, int x /* = 0 */) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopup", "Optional!Handle;SumType!(string,Handle);int", tuple(!anchorElement.empty, cast(Handle)anchorElement.front._parent, libwasm.sumtype.match!(((string v) => 0),((ref options.Types[1] v) => 1))(options),tuple(libwasm.sumtype.match!(((string v) => v),((ref options.Types[1] v) => string.init))(options),libwasm.sumtype.match!(((string v) => Handle.init),((ref options.Types[1] v) => cast(Handle)v.handle))(options)), x));
  }
  void openPopup(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, scope ref StringOrOpenPopupOptions options) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopup", "Optional!Handle;SumType!(string,Handle)", tuple(!anchorElement.empty, cast(Handle)anchorElement.front._parent, libwasm.sumtype.match!(((string v) => 0),((ref options.Types[1] v) => 1))(options),tuple(libwasm.sumtype.match!(((string v) => v),((ref options.Types[1] v) => string.init))(options),libwasm.sumtype.match!(((string v) => Handle.init),((ref options.Types[1] v) => cast(Handle)v.handle))(options))));
  }
  void openPopup(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopup", "Optional!Handle", tuple(!anchorElement.empty, cast(Handle)anchorElement.front._parent));
  }
  void openPopup()() {
    Object_Call__void(this._parent, "openPopup");
  }
  void openPopupAtScreen(T3)(int x /* = 0 */, int y /* = 0 */, bool isContextMenu /* = false */, scope auto ref Optional!(T3) triggerEvent /* = no!(Event) */) if (isTOrPointer!(T3, Event)) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopupAtScreen", "int;int;bool;Optional!Handle", tuple(x, y, isContextMenu, !triggerEvent.empty, cast(Handle)triggerEvent.front.handle));
  }
  void openPopupAtScreen()(int x /* = 0 */, int y /* = 0 */, bool isContextMenu /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopupAtScreen", "int;int;bool", tuple(x, y, isContextMenu));
  }
  void openPopupAtScreen()(int x /* = 0 */, int y /* = 0 */) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopupAtScreen", "int;int", tuple(x, y));
  }
  void openPopupAtScreen()(int x /* = 0 */) {
    Object_Call_int__void(this._parent, "openPopupAtScreen", x);
  }
  void openPopupAtScreen()() {
    Object_Call__void(this._parent, "openPopupAtScreen");
  }
  void openPopupAtScreenRect(T7)(string position /* = "" */, int x /* = 0 */, int y /* = 0 */, int width /* = 0 */, int height /* = 0 */, bool isContextMenu /* = false */, bool attributesOverride /* = false */, scope auto ref Optional!(T7) triggerEvent /* = no!(Event) */) if (isTOrPointer!(T7, Event)) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopupAtScreenRect", "string;int;int;int;int;bool;bool;Optional!Handle", tuple(position, x, y, width, height, isContextMenu, attributesOverride, !triggerEvent.empty, cast(Handle)triggerEvent.front.handle));
  }
  void openPopupAtScreenRect()(string position /* = "" */, int x /* = 0 */, int y /* = 0 */, int width /* = 0 */, int height /* = 0 */, bool isContextMenu /* = false */, bool attributesOverride /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopupAtScreenRect", "string;int;int;int;int;bool;bool", tuple(position, x, y, width, height, isContextMenu, attributesOverride));
  }
  void openPopupAtScreenRect()(string position /* = "" */, int x /* = 0 */, int y /* = 0 */, int width /* = 0 */, int height /* = 0 */, bool isContextMenu /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopupAtScreenRect", "string;int;int;int;int;bool", tuple(position, x, y, width, height, isContextMenu));
  }
  void openPopupAtScreenRect()(string position /* = "" */, int x /* = 0 */, int y /* = 0 */, int width /* = 0 */, int height /* = 0 */) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopupAtScreenRect", "string;int;int;int;int", tuple(position, x, y, width, height));
  }
  void openPopupAtScreenRect()(string position /* = "" */, int x /* = 0 */, int y /* = 0 */, int width /* = 0 */) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopupAtScreenRect", "string;int;int;int", tuple(position, x, y, width));
  }
  void openPopupAtScreenRect()(string position /* = "" */, int x /* = 0 */, int y /* = 0 */) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopupAtScreenRect", "string;int;int", tuple(position, x, y));
  }
  void openPopupAtScreenRect()(string position /* = "" */, int x /* = 0 */) {
    Serialize_Object_VarArgCall!void(this._parent, "openPopupAtScreenRect", "string;int", tuple(position, x));
  }
  void openPopupAtScreenRect()(string position /* = "" */) {
    Object_Call_string__void(this._parent, "openPopupAtScreenRect", position);
  }
  void openPopupAtScreenRect()() {
    Object_Call__void(this._parent, "openPopupAtScreenRect");
  }
  void hidePopup()(bool cancel /* = false */) {
    Object_Call_bool__void(this._parent, "hidePopup", cancel);
  }
  void hidePopup()() {
    Object_Call__void(this._parent, "hidePopup");
  }
  void label()(string label) {
    Object_Call_string__void(this._parent, "label", label);
  }
  string label()() {
    return Object_Getter__string(this._parent, "label");
  }
  void position()(string position) {
    Object_Call_string__void(this._parent, "position", position);
  }
  string position()() {
    return Object_Getter__string(this._parent, "position");
  }
  string state()() {
    return Object_Getter__string(this._parent, "state");
  }
  auto triggerNode()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this._parent, "triggerNode"));
  }
  auto anchorNode()() {
    return recastOpt!(Element)(Object_Getter__OptionalHandle(this._parent, "anchorNode"));
  }
  auto getOuterScreenRect()() {
    return DOMRect(Object_Getter__Handle(this._parent, "getOuterScreenRect"));
  }
  void moveTo()(int left, int top) {
    Serialize_Object_VarArgCall!void(this._parent, "moveTo", "int;int", tuple(left, top));
  }
  void moveToAnchor(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, string position /* = "" */, int x /* = 0 */, int y /* = 0 */, bool attributesOverride /* = false */) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this._parent, "moveToAnchor", "Optional!Handle;string;int;int;bool", tuple(!anchorElement.empty, cast(Handle)anchorElement.front._parent, position, x, y, attributesOverride));
  }
  void moveToAnchor(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, string position /* = "" */, int x /* = 0 */, int y /* = 0 */) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this._parent, "moveToAnchor", "Optional!Handle;string;int;int", tuple(!anchorElement.empty, cast(Handle)anchorElement.front._parent, position, x, y));
  }
  void moveToAnchor(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, string position /* = "" */, int x /* = 0 */) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this._parent, "moveToAnchor", "Optional!Handle;string;int", tuple(!anchorElement.empty, cast(Handle)anchorElement.front._parent, position, x));
  }
  void moveToAnchor(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, string position /* = "" */) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this._parent, "moveToAnchor", "Optional!Handle;string", tuple(!anchorElement.empty, cast(Handle)anchorElement.front._parent, position));
  }
  void moveToAnchor(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */) if (isTOrPointer!(T0, Element)) {
    Serialize_Object_VarArgCall!void(this._parent, "moveToAnchor", "Optional!Handle", tuple(!anchorElement.empty, cast(Handle)anchorElement.front._parent));
  }
  void moveToAnchor()() {
    Object_Call__void(this._parent, "moveToAnchor");
  }
  void sizeTo()(int width, int height) {
    Serialize_Object_VarArgCall!void(this._parent, "sizeTo", "int;int", tuple(width, height));
  }
  string alignmentPosition()() {
    return Object_Getter__string(this._parent, "alignmentPosition");
  }
  int alignmentOffset()() {
    return Object_Getter__int(this._parent, "alignmentOffset");
  }
  void setConstraintRect()(scope ref DOMRectReadOnly rect) {
    Object_Call_Handle__void(this._parent, "setConstraintRect", rect.handle);
  }
}


