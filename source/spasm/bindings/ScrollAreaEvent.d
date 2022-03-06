module spasm.bindings.ScrollAreaEvent;

import spasm.types;
import spasm.bindings.UIEvent;
import spasm.bindings.Window;

@safe:
nothrow:

struct ScrollAreaEvent {
  nothrow:
  spasm.bindings.UIEvent.UIEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEvent(h);
  }
  float x()() {
    return Object_Getter__float(this._parent, "x");
  }
  float y()() {
    return Object_Getter__float(this._parent, "y");
  }
  float width()() {
    return Object_Getter__float(this._parent, "width");
  }
  float height()() {
    return Object_Getter__float(this._parent, "height");
  }
  void initScrollAreaEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, float x /* = 0 */, float y /* = 0 */, float width /* = 0 */, float height /* = 0 */) if (isTOrPointer!(T3, Window)) {
    ScrollAreaEvent_initScrollAreaEvent(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, x, y, width, height);
  }
  void initScrollAreaEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, float x /* = 0 */, float y /* = 0 */, float width /* = 0 */) if (isTOrPointer!(T3, Window)) {
    ScrollAreaEvent_initScrollAreaEvent_0(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, x, y, width);
  }
  void initScrollAreaEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, float x /* = 0 */, float y /* = 0 */) if (isTOrPointer!(T3, Window)) {
    ScrollAreaEvent_initScrollAreaEvent_1(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, x, y);
  }
  void initScrollAreaEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, float x /* = 0 */) if (isTOrPointer!(T3, Window)) {
    ScrollAreaEvent_initScrollAreaEvent_2(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, x);
  }
  void initScrollAreaEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */) if (isTOrPointer!(T3, Window)) {
    ScrollAreaEvent_initScrollAreaEvent_3(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail);
  }
  void initScrollAreaEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    ScrollAreaEvent_initScrollAreaEvent_4(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent);
  }
  void initScrollAreaEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    ScrollAreaEvent_initScrollAreaEvent_5(this._parent, type, canBubble, cancelable);
  }
  void initScrollAreaEvent()(string type, bool canBubble /* = false */) {
    ScrollAreaEvent_initScrollAreaEvent_6(this._parent, type, canBubble);
  }
  void initScrollAreaEvent()(string type) {
    Object_Call_string__void(this._parent, "initScrollAreaEvent", type);
  }
}


extern (C) void ScrollAreaEvent_initScrollAreaEvent(Handle, string, bool, bool, bool, Handle, int, float, float, float, float);
extern (C) void ScrollAreaEvent_initScrollAreaEvent_0(Handle, string, bool, bool, bool, Handle, int, float, float, float);
extern (C) void ScrollAreaEvent_initScrollAreaEvent_1(Handle, string, bool, bool, bool, Handle, int, float, float);
extern (C) void ScrollAreaEvent_initScrollAreaEvent_2(Handle, string, bool, bool, bool, Handle, int, float);
extern (C) void ScrollAreaEvent_initScrollAreaEvent_3(Handle, string, bool, bool, bool, Handle, int);
extern (C) void ScrollAreaEvent_initScrollAreaEvent_4(Handle, string, bool, bool, bool, Handle);
extern (C) void ScrollAreaEvent_initScrollAreaEvent_5(Handle, string, bool, bool);
extern (C) void ScrollAreaEvent_initScrollAreaEvent_6(Handle, string, bool);