module libwasm.bindings.MouseEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventTarget;
import libwasm.bindings.UIEvent;
import libwasm.bindings.Window;

@safe:
nothrow:

struct MouseEvent {
  nothrow:
  libwasm.bindings.UIEvent.UIEvent _parent;
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
    return Serialize_Object_VarArgCall!short(this._parent, "button", "", tuple());
  }
  ushort buttons()() {
    return Object_Getter__ushort(this._parent, "buttons");
  }
  auto relatedTarget()() {
    return Optional!(EventTarget)(Object_Getter__OptionalHandle(this._parent, "relatedTarget"));
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
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short;Optional!Handle", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, cast(Handle)relatedTargetArg.front.handle));
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg));
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg));
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg));
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg));
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg));
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg));
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg));
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool;Optional!Handle;int;int;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg));
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool;Optional!Handle;int;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg));
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool;Optional!Handle;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg));
  }
  void initMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool;Optional!Handle", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent));
  }
  void initMouseEvent()(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg));
  }
  void initMouseEvent()(string typeArg, bool canBubbleArg /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseEvent", "string;bool", tuple(typeArg, canBubbleArg));
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
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short;Optional!Handle;float;ushort", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, cast(Handle)relatedTargetArg.front.handle, pressure, inputSourceArg));
  }
  void initNSMouseEvent(T3, T14)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */, scope auto ref Optional!(T14) relatedTargetArg /* = no!(EventTarget) */, float pressure /* = 0 */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short;Optional!Handle;float", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, cast(Handle)relatedTargetArg.front.handle, pressure));
  }
  void initNSMouseEvent(T3, T14)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */, scope auto ref Optional!(T14) relatedTargetArg /* = no!(EventTarget) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short;Optional!Handle", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg, !relatedTargetArg.empty, cast(Handle)relatedTargetArg.front.handle));
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */, short buttonArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg, buttonArg));
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */, bool metaKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg, metaKeyArg));
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */, bool shiftKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg, shiftKeyArg));
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */, bool altKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg, altKeyArg));
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */, bool ctrlKeyArg /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg, ctrlKeyArg));
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */, int clientYArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg, clientYArg));
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */, int clientXArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int;int;int;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg, clientXArg));
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */, int screenYArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int;int;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg, screenYArg));
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */, int screenXArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg, screenXArg));
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */, int detailArg /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle;int", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent, detailArg));
  }
  void initNSMouseEvent(T3)(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */, scope auto ref Optional!(T3) viewArg /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool;Optional!Handle", tuple(typeArg, canBubbleArg, cancelableArg, !viewArg.empty, cast(Handle)viewArg.front._parent));
  }
  void initNSMouseEvent()(string typeArg, bool canBubbleArg /* = false */, bool cancelableArg /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool;bool", tuple(typeArg, canBubbleArg, cancelableArg));
  }
  void initNSMouseEvent()(string typeArg, bool canBubbleArg /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initNSMouseEvent", "string;bool", tuple(typeArg, canBubbleArg));
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
  libwasm.bindings.UIEvent.EventModifierInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventModifierInit(h);
  }
  static auto create() {
    return MouseEventInit(libwasm_add__object());
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
    Serialize_Object_VarArgCall!void(this._parent, "button", "short", tuple(button));
  }
  short button()() {
    return Serialize_Object_VarArgCall!short(this._parent, "button", "", tuple());
  }
  void buttons()(ushort buttons) {
    Serialize_Object_VarArgCall!void(this._parent, "buttons", "ushort", tuple(buttons));
  }
  ushort buttons()() {
    return Object_Getter__ushort(this._parent, "buttons");
  }
  void relatedTarget(T0)(scope auto ref Optional!(T0) relatedTarget) if (isTOrPointer!(T0, EventTarget)) {
    Serialize_Object_VarArgCall!void(this._parent, "relatedTarget", "Optional!Handle", tuple(!relatedTarget.empty, cast(Handle)relatedTarget.front.handle));
  }
  auto relatedTarget()() {
    return Optional!(EventTarget)(Object_Getter__OptionalHandle(this._parent, "relatedTarget"));
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


