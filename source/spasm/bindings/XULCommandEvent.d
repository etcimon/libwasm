module spasm.bindings.XULCommandEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.UIEvent;
import spasm.bindings.Window;

@safe:
nothrow:

struct XULCommandEvent {
  nothrow:
  spasm.bindings.UIEvent.UIEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .UIEvent(h);
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
  ushort inputSource()() {
    return Object_Getter__ushort(this._parent, "inputSource");
  }
  auto sourceEvent()() {
    return Object_Getter__OptionalHandle(this._parent, "sourceEvent");
  }
  void initCommandEvent(T3, T9)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, scope auto ref Optional!(T9) sourceEvent /* = no!(Event) */, ushort inputSource /* = 0 */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T9, Event)) {
    XULCommandEvent_initCommandEvent(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey, !sourceEvent.empty, sourceEvent.front.handle, inputSource);
  }
  void initCommandEvent(T3, T9)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, scope auto ref Optional!(T9) sourceEvent /* = no!(Event) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T9, Event)) {
    XULCommandEvent_initCommandEvent_0(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey, !sourceEvent.empty, sourceEvent.front.handle);
  }
  void initCommandEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */) if (isTOrPointer!(T3, Window)) {
    XULCommandEvent_initCommandEvent_1(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey);
  }
  void initCommandEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */) if (isTOrPointer!(T3, Window)) {
    XULCommandEvent_initCommandEvent_2(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey, altKey, shiftKey);
  }
  void initCommandEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */) if (isTOrPointer!(T3, Window)) {
    XULCommandEvent_initCommandEvent_3(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey, altKey);
  }
  void initCommandEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */) if (isTOrPointer!(T3, Window)) {
    XULCommandEvent_initCommandEvent_4(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail, ctrlKey);
  }
  void initCommandEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */) if (isTOrPointer!(T3, Window)) {
    XULCommandEvent_initCommandEvent_5(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent, detail);
  }
  void initCommandEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    XULCommandEvent_initCommandEvent_6(this._parent, type, canBubble, cancelable, !view.empty, view.front._parent);
  }
  void initCommandEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    XULCommandEvent_initCommandEvent_7(this._parent, type, canBubble, cancelable);
  }
  void initCommandEvent()(string type, bool canBubble /* = false */) {
    XULCommandEvent_initCommandEvent_8(this._parent, type, canBubble);
  }
  void initCommandEvent()(string type) {
    Object_Call_string__void(this._parent, "initCommandEvent", type);
  }
}


extern (C) void XULCommandEvent_initCommandEvent(Handle, string, bool, bool, bool, Handle, int, bool, bool, bool, bool, bool, Handle, ushort);
extern (C) void XULCommandEvent_initCommandEvent_0(Handle, string, bool, bool, bool, Handle, int, bool, bool, bool, bool, bool, Handle);
extern (C) void XULCommandEvent_initCommandEvent_1(Handle, string, bool, bool, bool, Handle, int, bool, bool, bool, bool);
extern (C) void XULCommandEvent_initCommandEvent_2(Handle, string, bool, bool, bool, Handle, int, bool, bool, bool);
extern (C) void XULCommandEvent_initCommandEvent_3(Handle, string, bool, bool, bool, Handle, int, bool, bool);
extern (C) void XULCommandEvent_initCommandEvent_4(Handle, string, bool, bool, bool, Handle, int, bool);
extern (C) void XULCommandEvent_initCommandEvent_5(Handle, string, bool, bool, bool, Handle, int);
extern (C) void XULCommandEvent_initCommandEvent_6(Handle, string, bool, bool, bool, Handle);
extern (C) void XULCommandEvent_initCommandEvent_7(Handle, string, bool, bool);
extern (C) void XULCommandEvent_initCommandEvent_8(Handle, string, bool);