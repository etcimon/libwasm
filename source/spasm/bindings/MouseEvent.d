module spasm.bindings.MouseEvent;

import spasm.types;
import spasm.bindings.EventTarget;
import spasm.bindings.UIEvent;
import spasm.bindings.Window;

@safe:
nothrow:

struct MouseEvent {
  nothrow:
  spasm.bindings.UIEvent.UIEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEvent(h);
  }
  int screenX()() {
    return Object_Getter__int(this._parent, "screenX");
  }
  int screenY()() {
    return Object_Getter__int(this._parent, "screenY");
  }
  int clientX()() {
    return Object_Getter__int(this._parent, "clientX");
  }
  int clientY()() {
    return Object_Getter__int(this._parent, "clientY");
  }
  int x()() {
    return Object_Getter__int(this._parent, "x");
  }
  int y()() {
    return Object_Getter__int(this._parent, "y");
  }
  int offsetX()() {
    return Object_Getter__int(this._parent, "offsetX");
  }
  int offsetY()() {
    return Object_Getter__int(this._parent, "offsetY");
  }
  bool ctrlKey()() {
    return Object_Getter__bool(this._parent, "ctrlKey");
  }
  bool shiftKey()() {
    return Object_Getter__bool(this._parent, "shiftKey");
  }
  bool altKey()() {
    return Object_Getter__bool(this._parent, "altKey");
  }
  bool metaKey()() {
    return Object_Getter__bool(this._parent, "metaKey");
  }
  short button()() {
    return MouseEvent_button_Get(this._parent);
  }
  ushort buttons()() {
    return Object_Getter__ushort(this._parent, "buttons");
  }
  auto relatedTarget()() {
    return Object_Getter__OptionalHandle(this._parent, "relatedTarget");
  }
  Optional!(string) region()() {
    return Object_Getter__OptionalString(this._parent, "region");
  }
  int movementX()() {
    return Object_Getter__int(this._parent, "movementX");
  }
  int movementY()() {
    return Object_Getter__int(this._parent, "movementY");
  }
  void initMouseEvent(T3, T14)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */, scope auto ref Optional!(T14) relatedTargetArg /* = no!(EventTarget) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    MouseEvent_initMouseEvent(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, relatedTargetArg.front.handle);
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initMouseEvent_0(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg);
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initMouseEvent_1(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg);
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initMouseEvent_2(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg);
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initMouseEvent_3(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg);
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initMouseEvent_4(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg);
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initMouseEvent_5(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg);
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initMouseEvent_6(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg);
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initMouseEvent_7(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg);
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initMouseEvent_8(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg);
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initMouseEvent_9(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg);
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initMouseEvent_10(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent);
  }
  void initMouseEvent()(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */) {
    MouseEvent_initMouseEvent_11(this._parent, typeArg, canBubbleArg, cancelableArg);
  }
  void initMouseEvent()(string typeArg, bool canBubbleArg /* = false */) {
    MouseEvent_initMouseEvent_12(this._parent, typeArg, canBubbleArg);
  }
  void initMouseEvent()(string typeArg) {
    Object_Call_string__void(this._parent, "initMouseEvent", typeArg);
  }
  bool getModifierState()(string keyArg) {
    return Object_Call_string__bool(this._parent, "getModifierState", keyArg);
  }
  float mozPressure()() {
    return Object_Getter__float(this._parent, "mozPressure");
  }
  ushort mozInputSource()() {
    return Object_Getter__ushort(this._parent, "mozInputSource");
  }
  void initNSMouseEvent(T3, T14)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */, scope auto ref Optional!(T14) relatedTargetArg /* = no!(EventTarget) */, float pressure /* = 0 */, ushort inputSourceArg /* = 0 */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    MouseEvent_initNSMouseEvent(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, relatedTargetArg.front.handle, pressure, inputSourceArg);
  }
  void initNSMouseEvent(T3, T14)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */, scope auto ref Optional!(T14) relatedTargetArg /* = no!(EventTarget) */, float pressure /* = 0 */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    MouseEvent_initNSMouseEvent_0(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, relatedTargetArg.front.handle, pressure);
  }
  void initNSMouseEvent(T3, T14)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */, scope auto ref Optional!(T14) relatedTargetArg /* = no!(EventTarget) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    MouseEvent_initNSMouseEvent_1(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, relatedTargetArg.front.handle);
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initNSMouseEvent_2(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg);
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initNSMouseEvent_3(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg);
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initNSMouseEvent_4(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg);
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initNSMouseEvent_5(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg);
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initNSMouseEvent_6(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg);
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initNSMouseEvent_7(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg);
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initNSMouseEvent_8(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg);
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initNSMouseEvent_9(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg, screenYArg);
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initNSMouseEvent_10(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg, screenXArg);
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initNSMouseEvent_11(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent, detailArg);
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    MouseEvent_initNSMouseEvent_12(this._parent, typeArg, canBubbleArg, cancelableArg, !viewArg.empty, viewArg.front._parent);
  }
  void initNSMouseEvent()(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */) {
    MouseEvent_initNSMouseEvent_13(this._parent, typeArg, canBubbleArg, cancelableArg);
  }
  void initNSMouseEvent()(string typeArg, bool canBubbleArg /* = false */) {
    MouseEvent_initNSMouseEvent_14(this._parent, typeArg, canBubbleArg);
  }
  void initNSMouseEvent()(string typeArg) {
    Object_Call_string__void(this._parent, "initNSMouseEvent", typeArg);
  }
  bool hitCluster()() {
    return Object_Getter__bool(this._parent, "hitCluster");
  }
}
struct MouseEventInit {
  nothrow:
  spasm.bindings.UIEvent.EventModifierInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventModifierInit(h);
  }
  static auto create() {
    return MouseEventInit(spasm_add__object());
  }
  void screenX()(int screenX) {
    Object_Call_int__void(this._parent, "screenX", screenX);
  }
  int screenX()() {
    return Object_Getter__int(this._parent, "screenX");
  }
  void screenY()(int screenY) {
    Object_Call_int__void(this._parent, "screenY", screenY);
  }
  int screenY()() {
    return Object_Getter__int(this._parent, "screenY");
  }
  void clientX()(int clientX) {
    Object_Call_int__void(this._parent, "clientX", clientX);
  }
  int clientX()() {
    return Object_Getter__int(this._parent, "clientX");
  }
  void clientY()(int clientY) {
    Object_Call_int__void(this._parent, "clientY", clientY);
  }
  int clientY()() {
    return Object_Getter__int(this._parent, "clientY");
  }
  void button()(short button) {
    MouseEventInit_button_Set(this._parent, button);
  }
  short button()() {
    return MouseEventInit_button_Get(this._parent);
  }
  void buttons()(ushort buttons) {
    MouseEventInit_buttons_Set(this._parent, buttons);
  }
  ushort buttons()() {
    return Object_Getter__ushort(this._parent, "buttons");
  }
  void relatedTarget(T0)(scope auto ref Optional!(T0) relatedTarget) if (isTOrPointer!(T0, EventTarget)) {
    MouseEventInit_relatedTarget_Set(this._parent, !relatedTarget.empty, relatedTarget.front.handle);
  }
  auto relatedTarget()() {
    return Object_Getter__OptionalHandle(this._parent, "relatedTarget");
  }
  void movementX()(int movementX) {
    Object_Call_int__void(this._parent, "movementX", movementX);
  }
  int movementX()() {
    return Object_Getter__int(this._parent, "movementX");
  }
  void movementY()(int movementY) {
    Object_Call_int__void(this._parent, "movementY", movementY);
  }
  int movementY()() {
    return Object_Getter__int(this._parent, "movementY");
  }
}


extern (C) short MouseEvent_button_Get(Handle);
extern (C) void MouseEvent_initMouseEvent(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool, short, bool, Handle);
extern (C) void MouseEvent_initMouseEvent_0(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool, short);
extern (C) void MouseEvent_initMouseEvent_1(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool);
extern (C) void MouseEvent_initMouseEvent_2(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool);
extern (C) void MouseEvent_initMouseEvent_3(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool);
extern (C) void MouseEvent_initMouseEvent_4(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool);
extern (C) void MouseEvent_initMouseEvent_5(Handle, string, bool, bool, bool, Handle, int, int, int, int, int);
extern (C) void MouseEvent_initMouseEvent_6(Handle, string, bool, bool, bool, Handle, int, int, int, int);
extern (C) void MouseEvent_initMouseEvent_7(Handle, string, bool, bool, bool, Handle, int, int, int);
extern (C) void MouseEvent_initMouseEvent_8(Handle, string, bool, bool, bool, Handle, int, int);
extern (C) void MouseEvent_initMouseEvent_9(Handle, string, bool, bool, bool, Handle, int);
extern (C) void MouseEvent_initMouseEvent_10(Handle, string, bool, bool, bool, Handle);
extern (C) void MouseEvent_initMouseEvent_11(Handle, string, bool, bool);
extern (C) void MouseEvent_initMouseEvent_12(Handle, string, bool);
extern (C) void MouseEvent_initNSMouseEvent(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool, short, bool, Handle, float, ushort);
extern (C) void MouseEvent_initNSMouseEvent_0(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool, short, bool, Handle, float);
extern (C) void MouseEvent_initNSMouseEvent_1(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool, short, bool, Handle);
extern (C) void MouseEvent_initNSMouseEvent_2(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool, short);
extern (C) void MouseEvent_initNSMouseEvent_3(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool);
extern (C) void MouseEvent_initNSMouseEvent_4(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool);
extern (C) void MouseEvent_initNSMouseEvent_5(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool);
extern (C) void MouseEvent_initNSMouseEvent_6(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool);
extern (C) void MouseEvent_initNSMouseEvent_7(Handle, string, bool, bool, bool, Handle, int, int, int, int, int);
extern (C) void MouseEvent_initNSMouseEvent_8(Handle, string, bool, bool, bool, Handle, int, int, int, int);
extern (C) void MouseEvent_initNSMouseEvent_9(Handle, string, bool, bool, bool, Handle, int, int, int);
extern (C) void MouseEvent_initNSMouseEvent_10(Handle, string, bool, bool, bool, Handle, int, int);
extern (C) void MouseEvent_initNSMouseEvent_11(Handle, string, bool, bool, bool, Handle, int);
extern (C) void MouseEvent_initNSMouseEvent_12(Handle, string, bool, bool, bool, Handle);
extern (C) void MouseEvent_initNSMouseEvent_13(Handle, string, bool, bool);
extern (C) void MouseEvent_initNSMouseEvent_14(Handle, string, bool);
extern (C) void MouseEventInit_button_Set(Handle, short);
extern (C) short MouseEventInit_button_Get(Handle);
extern (C) void MouseEventInit_buttons_Set(Handle, ushort);
extern (C) void MouseEventInit_relatedTarget_Set(Handle, bool, Handle);