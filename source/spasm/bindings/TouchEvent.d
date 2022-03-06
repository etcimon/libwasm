module spasm.bindings.TouchEvent;

import spasm.types;
import spasm.bindings.Touch;
import spasm.bindings.TouchList;
import spasm.bindings.UIEvent;
import spasm.bindings.Window;

@safe:
nothrow:

struct TouchEvent {
  nothrow:
  spasm.bindings.UIEvent.UIEvent _parent;
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
    TouchEvent_initTouchEvent(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey, !touches.empty, touches.front.handle, !targetTouches.empty, targetTouches.front.handle, !changedTouches.empty, changedTouches.front.handle);
  }
  void initTouchEvent(T3, T9, T10)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, scope auto ref Optional!(T9) touches /* = no!(TouchList) */, scope auto ref Optional!(T10) targetTouches /* = no!(TouchList) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T9, TouchList) && isTOrPointer!(T10, TouchList)) {
    TouchEvent_initTouchEvent_0(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey, !touches.empty, touches.front.handle, !targetTouches.empty, targetTouches.front.handle);
  }
  void initTouchEvent(T3, T9)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, scope auto ref Optional!(T9) touches /* = no!(TouchList) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T9, TouchList)) {
    TouchEvent_initTouchEvent_1(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey, !touches.empty, touches.front.handle);
  }
  void initTouchEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */) if (isTOrPointer!(T3, Window)) {
    TouchEvent_initTouchEvent_2(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey);
  }
  void initTouchEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */) if (isTOrPointer!(T3, Window)) {
    TouchEvent_initTouchEvent_3(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey, altKey, shiftKey);
  }
  void initTouchEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */) if (isTOrPointer!(T3, Window)) {
    TouchEvent_initTouchEvent_4(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey, altKey);
  }
  void initTouchEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */) if (isTOrPointer!(T3, Window)) {
    TouchEvent_initTouchEvent_5(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey);
  }
  void initTouchEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */) if (isTOrPointer!(T3, Window)) {
    TouchEvent_initTouchEvent_6(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail);
  }
  void initTouchEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    TouchEvent_initTouchEvent_7(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent);
  }
  void initTouchEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    TouchEvent_initTouchEvent_8(this._parent, type, canBubble, cancelable);
  }
  void initTouchEvent()(string type, bool canBubble /* = false */) {
    TouchEvent_initTouchEvent_9(this._parent, type, canBubble);
  }
  void initTouchEvent()(string type) {
    Object_Call_string__void(this._parent, "initTouchEvent", type);
  }
}
struct TouchEventInit {
  nothrow:
  spasm.bindings.UIEvent.EventModifierInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventModifierInit(h);
  }
  static auto create() {
    return TouchEventInit(spasm_add__object());
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


extern (C) void TouchEvent_initTouchEvent(Handle, string, bool, bool, bool, Handle, int, bool, bool, bool, bool, bool, Handle, bool, Handle, bool, Handle);
extern (C) void TouchEvent_initTouchEvent_0(Handle, string, bool, bool, bool, Handle, int, bool, bool, bool, bool, bool, Handle, bool, Handle);
extern (C) void TouchEvent_initTouchEvent_1(Handle, string, bool, bool, bool, Handle, int, bool, bool, bool, bool, bool, Handle);
extern (C) void TouchEvent_initTouchEvent_2(Handle, string, bool, bool, bool, Handle, int, bool, bool, bool, bool);
extern (C) void TouchEvent_initTouchEvent_3(Handle, string, bool, bool, bool, Handle, int, bool, bool, bool);
extern (C) void TouchEvent_initTouchEvent_4(Handle, string, bool, bool, bool, Handle, int, bool, bool);
extern (C) void TouchEvent_initTouchEvent_5(Handle, string, bool, bool, bool, Handle, int, bool);
extern (C) void TouchEvent_initTouchEvent_6(Handle, string, bool, bool, bool, Handle, int);
extern (C) void TouchEvent_initTouchEvent_7(Handle, string, bool, bool, bool, Handle);
extern (C) void TouchEvent_initTouchEvent_8(Handle, string, bool, bool);
extern (C) void TouchEvent_initTouchEvent_9(Handle, string, bool);