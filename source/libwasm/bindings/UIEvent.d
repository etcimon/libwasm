module libwasm.bindings.UIEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.Node;
import libwasm.bindings.Window;

@safe:
nothrow:

struct EventModifierInit {
  nothrow:
  libwasm.bindings.UIEvent.UIEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEventInit(h);
  }
  static auto create() {
    return EventModifierInit(libwasm_add__object());
  }
  void ctrlKey()(bool ctrlKey) {
    Object_Call_bool__void(this._parent, "ctrlKey", ctrlKey);
  }
  bool ctrlKey()() {
    return Object_Getter__bool(this._parent, "ctrlKey");
  }
  void shiftKey()(bool shiftKey) {
    Object_Call_bool__void(this._parent, "shiftKey", shiftKey);
  }
  bool shiftKey()() {
    return Object_Getter__bool(this._parent, "shiftKey");
  }
  void altKey()(bool altKey) {
    Object_Call_bool__void(this._parent, "altKey", altKey);
  }
  bool altKey()() {
    return Object_Getter__bool(this._parent, "altKey");
  }
  void metaKey()(bool metaKey) {
    Object_Call_bool__void(this._parent, "metaKey", metaKey);
  }
  bool metaKey()() {
    return Object_Getter__bool(this._parent, "metaKey");
  }
  void modifierAltGraph()(bool modifierAltGraph) {
    Object_Call_bool__void(this._parent, "modifierAltGraph", modifierAltGraph);
  }
  bool modifierAltGraph()() {
    return Object_Getter__bool(this._parent, "modifierAltGraph");
  }
  void modifierCapsLock()(bool modifierCapsLock) {
    Object_Call_bool__void(this._parent, "modifierCapsLock", modifierCapsLock);
  }
  bool modifierCapsLock()() {
    return Object_Getter__bool(this._parent, "modifierCapsLock");
  }
  void modifierFn()(bool modifierFn) {
    Object_Call_bool__void(this._parent, "modifierFn", modifierFn);
  }
  bool modifierFn()() {
    return Object_Getter__bool(this._parent, "modifierFn");
  }
  void modifierFnLock()(bool modifierFnLock) {
    Object_Call_bool__void(this._parent, "modifierFnLock", modifierFnLock);
  }
  bool modifierFnLock()() {
    return Object_Getter__bool(this._parent, "modifierFnLock");
  }
  void modifierNumLock()(bool modifierNumLock) {
    Object_Call_bool__void(this._parent, "modifierNumLock", modifierNumLock);
  }
  bool modifierNumLock()() {
    return Object_Getter__bool(this._parent, "modifierNumLock");
  }
  void modifierOS()(bool modifierOS) {
    Object_Call_bool__void(this._parent, "modifierOS", modifierOS);
  }
  bool modifierOS()() {
    return Object_Getter__bool(this._parent, "modifierOS");
  }
  void modifierScrollLock()(bool modifierScrollLock) {
    Object_Call_bool__void(this._parent, "modifierScrollLock", modifierScrollLock);
  }
  bool modifierScrollLock()() {
    return Object_Getter__bool(this._parent, "modifierScrollLock");
  }
  void modifierSymbol()(bool modifierSymbol) {
    Object_Call_bool__void(this._parent, "modifierSymbol", modifierSymbol);
  }
  bool modifierSymbol()() {
    return Object_Getter__bool(this._parent, "modifierSymbol");
  }
  void modifierSymbolLock()(bool modifierSymbolLock) {
    Object_Call_bool__void(this._parent, "modifierSymbolLock", modifierSymbolLock);
  }
  bool modifierSymbolLock()() {
    return Object_Getter__bool(this._parent, "modifierSymbolLock");
  }
}
struct UIEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  auto view()() {
    return recastOpt!(WindowProxy)(Object_Getter__OptionalHandle(this._parent, "view"));
  }
  int detail()() {
    return Object_Getter__int(this._parent, "detail");
  }
  void initUIEvent(T3)(string aType, bool aCanBubble /* = false */, bool aCancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initUIEvent", "string;bool;bool;Optional!Handle;int", tuple(aType, aCanBubble, aCancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail));
  }
  void initUIEvent(T3)(string aType, bool aCanBubble /* = false */, bool aCancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initUIEvent", "string;bool;bool;Optional!Handle", tuple(aType, aCanBubble, aCancelable, !aView.empty, cast(Handle)aView.front._parent));
  }
  void initUIEvent()(string aType, bool aCanBubble /* = false */, bool aCancelable /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initUIEvent", "string;bool;bool", tuple(aType, aCanBubble, aCancelable));
  }
  void initUIEvent()(string aType, bool aCanBubble /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initUIEvent", "string;bool", tuple(aType, aCanBubble));
  }
  void initUIEvent()(string aType) {
    Object_Call_string__void(this._parent, "initUIEvent", aType);
  }
  int layerX()() {
    return Object_Getter__int(this._parent, "layerX");
  }
  int layerY()() {
    return Object_Getter__int(this._parent, "layerY");
  }
  int pageX()() {
    return Object_Getter__int(this._parent, "pageX");
  }
  int pageY()() {
    return Object_Getter__int(this._parent, "pageY");
  }
  uint which()() {
    return Object_Getter__uint(this._parent, "which");
  }
  auto rangeParent()() {
    return recastOpt!(Node)(Object_Getter__OptionalHandle(this._parent, "rangeParent"));
  }
  int rangeOffset()() {
    return Object_Getter__int(this._parent, "rangeOffset");
  }
}
struct UIEventInit {
  nothrow:
  libwasm.bindings.Event.EventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventInit(h);
  }
  static auto create() {
    return UIEventInit(libwasm_add__object());
  }
  void view(T0)(scope auto ref Optional!(T0) view) if (isTOrPointer!(T0, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "view", "Optional!Handle", tuple(!view.empty, cast(Handle)view.front._parent));
  }
  auto view()() {
    return recastOpt!(Window)(Object_Getter__OptionalHandle(this._parent, "view"));
  }
  void detail()(int detail) {
    Object_Call_int__void(this._parent, "detail", detail);
  }
  int detail()() {
    return Object_Getter__int(this._parent, "detail");
  }
}


