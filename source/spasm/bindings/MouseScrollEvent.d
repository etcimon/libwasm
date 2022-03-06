module spasm.bindings.MouseScrollEvent;

import spasm.types;
import spasm.bindings.EventTarget;
import spasm.bindings.MouseEvent;
import spasm.bindings.Window;

@safe:
nothrow:

struct MouseScrollEvent {
  nothrow:
  spasm.bindings.MouseEvent.MouseEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MouseEvent(h);
  }
  enum int HORIZONTAL_AXIS = 1;
  enum int VERTICAL_AXIS = 2;
  int axis()() {
    return Object_Getter__int(this._parent, "axis");
  }
  void initMouseScrollEvent(T3, T14)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, short button /* = 0 */, scope auto ref Optional!(T14) relatedTarget /* = no!(EventTarget) */, int axis /* = 0 */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    MouseScrollEvent_initMouseScrollEvent(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey, altKey, shiftKey, metaKey, button, !relatedTarget.empty, relatedTarget.front.handle, axis);
  }
  void initMouseScrollEvent(T3, T14)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, short button /* = 0 */, scope auto ref Optional!(T14) relatedTarget /* = no!(EventTarget) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    MouseScrollEvent_initMouseScrollEvent_0(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey, altKey, shiftKey, metaKey, button, !relatedTarget.empty, relatedTarget.front.handle);
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, short button /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseScrollEvent_initMouseScrollEvent_1(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey, altKey, shiftKey, metaKey, button);
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */) if (isTOrPointer!(T3, Window)) {
    MouseScrollEvent_initMouseScrollEvent_2(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey, altKey, shiftKey, metaKey);
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */) if (isTOrPointer!(T3, Window)) {
    MouseScrollEvent_initMouseScrollEvent_3(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey, altKey, shiftKey);
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */) if (isTOrPointer!(T3, Window)) {
    MouseScrollEvent_initMouseScrollEvent_4(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey, altKey);
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */) if (isTOrPointer!(T3, Window)) {
    MouseScrollEvent_initMouseScrollEvent_5(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey);
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseScrollEvent_initMouseScrollEvent_6(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, screenX, screenY, clientX, clientY);
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseScrollEvent_initMouseScrollEvent_7(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, screenX, screenY, clientX);
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseScrollEvent_initMouseScrollEvent_8(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, screenX, screenY);
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseScrollEvent_initMouseScrollEvent_9(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, screenX);
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */) if (isTOrPointer!(T3, Window)) {
    MouseScrollEvent_initMouseScrollEvent_10(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail);
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    MouseScrollEvent_initMouseScrollEvent_11(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent);
  }
  void initMouseScrollEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    MouseScrollEvent_initMouseScrollEvent_12(this._parent, type, canBubble, cancelable);
  }
  void initMouseScrollEvent()(string type, bool canBubble /* = false */) {
    MouseScrollEvent_initMouseScrollEvent_13(this._parent, type, canBubble);
  }
  void initMouseScrollEvent()(string type) {
    Object_Call_string__void(this._parent, "initMouseScrollEvent", type);
  }
}


extern (C) void MouseScrollEvent_initMouseScrollEvent(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool, short, bool, Handle, int);
extern (C) void MouseScrollEvent_initMouseScrollEvent_0(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool, short, bool, Handle);
extern (C) void MouseScrollEvent_initMouseScrollEvent_1(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool, short);
extern (C) void MouseScrollEvent_initMouseScrollEvent_2(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool);
extern (C) void MouseScrollEvent_initMouseScrollEvent_3(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool);
extern (C) void MouseScrollEvent_initMouseScrollEvent_4(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool);
extern (C) void MouseScrollEvent_initMouseScrollEvent_5(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool);
extern (C) void MouseScrollEvent_initMouseScrollEvent_6(Handle, string, bool, bool, bool, Handle, int, int, int, int, int);
extern (C) void MouseScrollEvent_initMouseScrollEvent_7(Handle, string, bool, bool, bool, Handle, int, int, int, int);
extern (C) void MouseScrollEvent_initMouseScrollEvent_8(Handle, string, bool, bool, bool, Handle, int, int, int);
extern (C) void MouseScrollEvent_initMouseScrollEvent_9(Handle, string, bool, bool, bool, Handle, int, int);
extern (C) void MouseScrollEvent_initMouseScrollEvent_10(Handle, string, bool, bool, bool, Handle, int);
extern (C) void MouseScrollEvent_initMouseScrollEvent_11(Handle, string, bool, bool, bool, Handle);
extern (C) void MouseScrollEvent_initMouseScrollEvent_12(Handle, string, bool, bool);
extern (C) void MouseScrollEvent_initMouseScrollEvent_13(Handle, string, bool);