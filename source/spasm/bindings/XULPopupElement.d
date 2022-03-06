module spasm.bindings.XULPopupElement;

import spasm.types;
import spasm.bindings.DOMRect;
import spasm.bindings.Element;
import spasm.bindings.Event;
import spasm.bindings.Node;
import spasm.bindings.XULElement;

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
    return OpenPopupOptions(spasm_add__object());
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
    OpenPopupOptions_triggerEvent_Set(this.handle, !triggerEvent.empty, triggerEvent.front.handle);
  }
  auto triggerEvent()() {
    return Object_Getter__OptionalHandle(this.handle, "triggerEvent");
  }
}
alias StringOrOpenPopupOptions = SumType!(string, OpenPopupOptions);
struct XULPopupElement {
  nothrow:
  spasm.bindings.XULElement.XULElement _parent;
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
    XULPopupElement_openPopup(this._parent, !anchorElement.empty, anchorElement.front._parent, options, x, y, isContextMenu, attributesOverride, !triggerEvent.empty, triggerEvent.front.handle);
  }
  void openPopup(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, scope ref StringOrOpenPopupOptions options, int x /* = 0 */, int y /* = 0 */, bool isContextMenu /* = false */, bool attributesOverride /* = false */) if (isTOrPointer!(T0, Element)) {
    XULPopupElement_openPopup_0(this._parent, !anchorElement.empty, anchorElement.front._parent, options, x, y, isContextMenu, attributesOverride);
  }
  void openPopup(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, scope ref StringOrOpenPopupOptions options, int x /* = 0 */, int y /* = 0 */, bool isContextMenu /* = false */) if (isTOrPointer!(T0, Element)) {
    XULPopupElement_openPopup_1(this._parent, !anchorElement.empty, anchorElement.front._parent, options, x, y, isContextMenu);
  }
  void openPopup(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, scope ref StringOrOpenPopupOptions options, int x /* = 0 */, int y /* = 0 */) if (isTOrPointer!(T0, Element)) {
    XULPopupElement_openPopup_2(this._parent, !anchorElement.empty, anchorElement.front._parent, options, x, y);
  }
  void openPopup(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, scope ref StringOrOpenPopupOptions options, int x /* = 0 */) if (isTOrPointer!(T0, Element)) {
    XULPopupElement_openPopup_3(this._parent, !anchorElement.empty, anchorElement.front._parent, options, x);
  }
  void openPopup(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, scope ref StringOrOpenPopupOptions options) if (isTOrPointer!(T0, Element)) {
    XULPopupElement_openPopup_4(this._parent, !anchorElement.empty, anchorElement.front._parent, options);
  }
  void openPopup(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */) if (isTOrPointer!(T0, Element)) {
    XULPopupElement_openPopup_5(this._parent, !anchorElement.empty, anchorElement.front._parent);
  }
  void openPopup()() {
    Object_Call__void(this._parent, "openPopup");
  }
  void openPopupAtScreen(T3)(int x /* = 0 */, int y /* = 0 */, bool isContextMenu /* = false */, scope auto ref Optional!(T3) triggerEvent /* = no!(Event) */) if (isTOrPointer!(T3, Event)) {
    XULPopupElement_openPopupAtScreen(this._parent, x, y, isContextMenu, !triggerEvent.empty, triggerEvent.front.handle);
  }
  void openPopupAtScreen()(int x /* = 0 */, int y /* = 0 */, bool isContextMenu /* = false */) {
    XULPopupElement_openPopupAtScreen_0(this._parent, x, y, isContextMenu);
  }
  void openPopupAtScreen()(int x /* = 0 */, int y /* = 0 */) {
    XULPopupElement_openPopupAtScreen_1(this._parent, x, y);
  }
  void openPopupAtScreen()(int x /* = 0 */) {
    Object_Call_int__void(this._parent, "openPopupAtScreen", x);
  }
  void openPopupAtScreen()() {
    Object_Call__void(this._parent, "openPopupAtScreen");
  }
  void openPopupAtScreenRect(T7)(string position /* = "" */, int x /* = 0 */, int y /* = 0 */, int width /* = 0 */, int height /* = 0 */, bool isContextMenu /* = false */, bool attributesOverride /* = false */, scope auto ref Optional!(T7) triggerEvent /* = no!(Event) */) if (isTOrPointer!(T7, Event)) {
    XULPopupElement_openPopupAtScreenRect(this._parent, position, x, y, width, height, isContextMenu, attributesOverride, !triggerEvent.empty, triggerEvent.front.handle);
  }
  void openPopupAtScreenRect()(string position /* = "" */, int x /* = 0 */, int y /* = 0 */, int width /* = 0 */, int height /* = 0 */, bool isContextMenu /* = false */, bool attributesOverride /* = false */) {
    XULPopupElement_openPopupAtScreenRect_0(this._parent, position, x, y, width, height, isContextMenu, attributesOverride);
  }
  void openPopupAtScreenRect()(string position /* = "" */, int x /* = 0 */, int y /* = 0 */, int width /* = 0 */, int height /* = 0 */, bool isContextMenu /* = false */) {
    XULPopupElement_openPopupAtScreenRect_1(this._parent, position, x, y, width, height, isContextMenu);
  }
  void openPopupAtScreenRect()(string position /* = "" */, int x /* = 0 */, int y /* = 0 */, int width /* = 0 */, int height /* = 0 */) {
    XULPopupElement_openPopupAtScreenRect_2(this._parent, position, x, y, width, height);
  }
  void openPopupAtScreenRect()(string position /* = "" */, int x /* = 0 */, int y /* = 0 */, int width /* = 0 */) {
    XULPopupElement_openPopupAtScreenRect_3(this._parent, position, x, y, width);
  }
  void openPopupAtScreenRect()(string position /* = "" */, int x /* = 0 */, int y /* = 0 */) {
    XULPopupElement_openPopupAtScreenRect_4(this._parent, position, x, y);
  }
  void openPopupAtScreenRect()(string position /* = "" */, int x /* = 0 */) {
    XULPopupElement_openPopupAtScreenRect_5(this._parent, position, x);
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
    return Object_Getter__OptionalHandle(this._parent, "triggerNode");
  }
  auto anchorNode()() {
    return Object_Getter__OptionalHandle(this._parent, "anchorNode");
  }
  auto getOuterScreenRect()() {
    return DOMRect(Object_Getter__Handle(this._parent, "getOuterScreenRect"));
  }
  void moveTo()(int left, int top) {
    XULPopupElement_moveTo(this._parent, left, top);
  }
  void moveToAnchor(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, string position /* = "" */, int x /* = 0 */, int y /* = 0 */, bool attributesOverride /* = false */) if (isTOrPointer!(T0, Element)) {
    XULPopupElement_moveToAnchor(this._parent, !anchorElement.empty, anchorElement.front._parent, position, x, y, attributesOverride);
  }
  void moveToAnchor(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, string position /* = "" */, int x /* = 0 */, int y /* = 0 */) if (isTOrPointer!(T0, Element)) {
    XULPopupElement_moveToAnchor_0(this._parent, !anchorElement.empty, anchorElement.front._parent, position, x, y);
  }
  void moveToAnchor(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, string position /* = "" */, int x /* = 0 */) if (isTOrPointer!(T0, Element)) {
    XULPopupElement_moveToAnchor_1(this._parent, !anchorElement.empty, anchorElement.front._parent, position, x);
  }
  void moveToAnchor(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */, string position /* = "" */) if (isTOrPointer!(T0, Element)) {
    XULPopupElement_moveToAnchor_2(this._parent, !anchorElement.empty, anchorElement.front._parent, position);
  }
  void moveToAnchor(T0)(scope auto ref Optional!(T0) anchorElement /* = no!(Element) */) if (isTOrPointer!(T0, Element)) {
    XULPopupElement_moveToAnchor_3(this._parent, !anchorElement.empty, anchorElement.front._parent);
  }
  void moveToAnchor()() {
    Object_Call__void(this._parent, "moveToAnchor");
  }
  void sizeTo()(int width, int height) {
    XULPopupElement_sizeTo(this._parent, width, height);
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


extern (C) void OpenPopupOptions_triggerEvent_Set(Handle, bool, Handle);
extern (C) void XULPopupElement_openPopup(Handle, bool, Handle, scope ref StringOrOpenPopupOptions, int, int, bool, bool, bool, Handle);
extern (C) void XULPopupElement_openPopup_0(Handle, bool, Handle, scope ref StringOrOpenPopupOptions, int, int, bool, bool);
extern (C) void XULPopupElement_openPopup_1(Handle, bool, Handle, scope ref StringOrOpenPopupOptions, int, int, bool);
extern (C) void XULPopupElement_openPopup_2(Handle, bool, Handle, scope ref StringOrOpenPopupOptions, int, int);
extern (C) void XULPopupElement_openPopup_3(Handle, bool, Handle, scope ref StringOrOpenPopupOptions, int);
extern (C) void XULPopupElement_openPopup_4(Handle, bool, Handle, scope ref StringOrOpenPopupOptions);
extern (C) void XULPopupElement_openPopup_5(Handle, bool, Handle);
extern (C) void XULPopupElement_openPopupAtScreen(Handle, int, int, bool, bool, Handle);
extern (C) void XULPopupElement_openPopupAtScreen_0(Handle, int, int, bool);
extern (C) void XULPopupElement_openPopupAtScreen_1(Handle, int, int);
extern (C) void XULPopupElement_openPopupAtScreenRect(Handle, string, int, int, int, int, bool, bool, bool, Handle);
extern (C) void XULPopupElement_openPopupAtScreenRect_0(Handle, string, int, int, int, int, bool, bool);
extern (C) void XULPopupElement_openPopupAtScreenRect_1(Handle, string, int, int, int, int, bool);
extern (C) void XULPopupElement_openPopupAtScreenRect_2(Handle, string, int, int, int, int);
extern (C) void XULPopupElement_openPopupAtScreenRect_3(Handle, string, int, int, int);
extern (C) void XULPopupElement_openPopupAtScreenRect_4(Handle, string, int, int);
extern (C) void XULPopupElement_openPopupAtScreenRect_5(Handle, string, int);
extern (C) void XULPopupElement_moveTo(Handle, int, int);
extern (C) void XULPopupElement_moveToAnchor(Handle, bool, Handle, string, int, int, bool);
extern (C) void XULPopupElement_moveToAnchor_0(Handle, bool, Handle, string, int, int);
extern (C) void XULPopupElement_moveToAnchor_1(Handle, bool, Handle, string, int);
extern (C) void XULPopupElement_moveToAnchor_2(Handle, bool, Handle, string);
extern (C) void XULPopupElement_moveToAnchor_3(Handle, bool, Handle);
extern (C) void XULPopupElement_sizeTo(Handle, int, int);