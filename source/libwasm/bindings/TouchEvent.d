module libwasm.bindings.TouchEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Touch;
import libwasm.bindings.TouchList;
import libwasm.bindings.UIEvent;
import libwasm.bindings.Window;

@safe:
nothrow:

struct TouchEvent {
  nothrow:
  libwasm.bindings.UIEvent.UIEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEvent(h);
  }
  auto touches()() {
    return TouchList(Object_Getter__Handle(this._parent, "touches"));
  }
  auto targetTouches()() {
    return TouchList(Object_Getter__Handle(this._parent, "targetTouches"));
  }
  auto changedTouches()() {
    return TouchList(Object_Getter__Handle(this._parent, "changedTouches"));
  }
  bool altKey()() {
    return Object_Getter__bool(this._parent, "altKey");
  }
  bool metaKey()() {
    return Object_Getter__bool(this._parent, "metaKey");
  }
  bool ctrlKey()() {
    return Object_Getter__bool(this._parent, "ctrlKey");
  }
  bool shiftKey()() {
    return Object_Getter__bool(this._parent, "shiftKey");
  }
  void initTouchEvent(T3, T9, T10, T11)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, scope auto ref Optional!(T9) touches /* = no!(TouchList) */, scope auto ref Optional!(T10) targetTouches /* = no!(TouchList) */, scope auto ref Optional!(T11) changedTouches /* = no!(TouchList) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T9, TouchList) && isTOrPointer!(T10, TouchList) && isTOrPointer!(T11, TouchList)) {
    Serialize_Object_VarArgCall!void(this._parent, "initTouchEvent", "string;bool;bool;Optional!Handle;int;bool;bool;bool;bool;Optional!Handle;Optional!Handle;Optional!Handle", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey, !touches.empty, cast(Handle)touches.front.handle, !targetTouches.empty, cast(Handle)targetTouches.front.handle, !changedTouches.empty, cast(Handle)changedTouches.front.handle));
  }
  void initTouchEvent(T3, T9, T10)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, scope auto ref Optional!(T9) touches /* = no!(TouchList) */, scope auto ref Optional!(T10) targetTouches /* = no!(TouchList) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T9, TouchList) && isTOrPointer!(T10, TouchList)) {
    Serialize_Object_VarArgCall!void(this._parent, "initTouchEvent", "string;bool;bool;Optional!Handle;int;bool;bool;bool;bool;Optional!Handle;Optional!Handle", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey, !touches.empty, cast(Handle)touches.front.handle, !targetTouches.empty, cast(Handle)targetTouches.front.handle));
  }
  void initTouchEvent(T3, T9)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, scope auto ref Optional!(T9) touches /* = no!(TouchList) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T9, TouchList)) {
    Serialize_Object_VarArgCall!void(this._parent, "initTouchEvent", "string;bool;bool;Optional!Handle;int;bool;bool;bool;bool;Optional!Handle", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey, !touches.empty, cast(Handle)touches.front.handle));
  }
  void initTouchEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initTouchEvent", "string;bool;bool;Optional!Handle;int;bool;bool;bool;bool", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey));
  }
  void initTouchEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initTouchEvent", "string;bool;bool;Optional!Handle;int;bool;bool;bool", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey, altKey, shiftKey));
  }
  void initTouchEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initTouchEvent", "string;bool;bool;Optional!Handle;int;bool;bool", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey, altKey));
  }
  void initTouchEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initTouchEvent", "string;bool;bool;Optional!Handle;int;bool", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey));
  }
  void initTouchEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initTouchEvent", "string;bool;bool;Optional!Handle;int", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail));
  }
  void initTouchEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initTouchEvent", "string;bool;bool;Optional!Handle", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent));
  }
  void initTouchEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initTouchEvent", "string;bool;bool", tuple(type, canBubble, cancelable));
  }
  void initTouchEvent()(string type, bool canBubble /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initTouchEvent", "string;bool", tuple(type, canBubble));
  }
  void initTouchEvent()(string type) {
    Object_Call_string__void(this._parent, "initTouchEvent", type);
  }
}
struct TouchEventInit {
  nothrow:
  libwasm.bindings.UIEvent.EventModifierInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventModifierInit(h);
  }
  static auto create() {
    return TouchEventInit(libwasm_add__object());
  }
  void touches()(scope ref Sequence!(Touch) touches) {
    Object_Call_Handle__void(this._parent, "touches", touches.handle);
  }
  auto touches()() {
    return Sequence!(Touch)(Object_Getter__Handle(this._parent, "touches"));
  }
  void targetTouches()(scope ref Sequence!(Touch) targetTouches) {
    Object_Call_Handle__void(this._parent, "targetTouches", targetTouches.handle);
  }
  auto targetTouches()() {
    return Sequence!(Touch)(Object_Getter__Handle(this._parent, "targetTouches"));
  }
  void changedTouches()(scope ref Sequence!(Touch) changedTouches) {
    Object_Call_Handle__void(this._parent, "changedTouches", changedTouches.handle);
  }
  auto changedTouches()() {
    return Sequence!(Touch)(Object_Getter__Handle(this._parent, "changedTouches"));
  }
}


