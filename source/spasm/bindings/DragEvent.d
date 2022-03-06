module spasm.bindings.DragEvent;

import spasm.types;
import spasm.bindings.DataTransfer;
import spasm.bindings.EventTarget;
import spasm.bindings.MouseEvent;
import spasm.bindings.Window;

@safe:
nothrow:

struct DragEvent {
  nothrow:
  spasm.bindings.MouseEvent.MouseEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MouseEvent(h);
  }
  auto dataTransfer()() {
    return Object_Getter__OptionalHandle(this._parent, "dataTransfer");
  }
  void initDragEvent(T3, T14, T15)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */, bool aAltKey /* = false */, bool aShiftKey /* = false */, bool aMetaKey /* = false */, ushort aButton /* = 0 */, scope auto ref Optional!(T14) aRelatedTarget /* = no!(EventTarget) */, scope auto ref Optional!(T15) aDataTransfer /* = no!(DataTransfer) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget) && isTOrPointer!(T15, DataTransfer)) {
    DragEvent_initDragEvent(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey, aAltKey, aShiftKey, aMetaKey, aButton, !aRelatedTarget.empty, aRelatedTarget.front.handle, !aDataTransfer.empty, aDataTransfer.front.handle);
  }
  void initDragEvent(T3, T14)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */, bool aAltKey /* = false */, bool aShiftKey /* = false */, bool aMetaKey /* = false */, ushort aButton /* = 0 */, scope auto ref Optional!(T14) aRelatedTarget /* = no!(EventTarget) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    DragEvent_initDragEvent_0(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey, aAltKey, aShiftKey, aMetaKey, aButton, !aRelatedTarget.empty, aRelatedTarget.front.handle);
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */, bool aAltKey /* = false */, bool aShiftKey /* = false */, bool aMetaKey /* = false */, ushort aButton /* = 0 */) if (isTOrPointer!(T3, Window)) {
    DragEvent_initDragEvent_1(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey, aAltKey, aShiftKey, aMetaKey, aButton);
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */, bool aAltKey /* = false */, bool aShiftKey /* = false */, bool aMetaKey /* = false */) if (isTOrPointer!(T3, Window)) {
    DragEvent_initDragEvent_2(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey, aAltKey, aShiftKey, aMetaKey);
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */, bool aAltKey /* = false */, bool aShiftKey /* = false */) if (isTOrPointer!(T3, Window)) {
    DragEvent_initDragEvent_3(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey, aAltKey, aShiftKey);
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */, bool aAltKey /* = false */) if (isTOrPointer!(T3, Window)) {
    DragEvent_initDragEvent_4(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey, aAltKey);
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */) if (isTOrPointer!(T3, Window)) {
    DragEvent_initDragEvent_5(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey);
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */) if (isTOrPointer!(T3, Window)) {
    DragEvent_initDragEvent_6(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY);
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */) if (isTOrPointer!(T3, Window)) {
    DragEvent_initDragEvent_7(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent, aDetail, aScreenX, aScreenY, aClientX);
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */) if (isTOrPointer!(T3, Window)) {
    DragEvent_initDragEvent_8(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent, aDetail, aScreenX, aScreenY);
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */) if (isTOrPointer!(T3, Window)) {
    DragEvent_initDragEvent_9(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent, aDetail, aScreenX);
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */) if (isTOrPointer!(T3, Window)) {
    DragEvent_initDragEvent_10(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent, aDetail);
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    DragEvent_initDragEvent_11(this._parent, type, canBubble, cancelable, !aView.empty, aView.front._parent);
  }
  void initDragEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    DragEvent_initDragEvent_12(this._parent, type, canBubble, cancelable);
  }
  void initDragEvent()(string type, bool canBubble /* = false */) {
    DragEvent_initDragEvent_13(this._parent, type, canBubble);
  }
  void initDragEvent()(string type) {
    Object_Call_string__void(this._parent, "initDragEvent", type);
  }
}
struct DragEventInit {
  nothrow:
  spasm.bindings.MouseEvent.MouseEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MouseEventInit(h);
  }
  static auto create() {
    return DragEventInit(spasm_add__object());
  }
  void dataTransfer(T0)(scope auto ref Optional!(T0) dataTransfer) if (isTOrPointer!(T0, DataTransfer)) {
    DragEventInit_dataTransfer_Set(this._parent, !dataTransfer.empty, dataTransfer.front.handle);
  }
  auto dataTransfer()() {
    return Object_Getter__OptionalHandle(this._parent, "dataTransfer");
  }
}


extern (C) void DragEvent_initDragEvent(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool, ushort, bool, Handle, bool, Handle);
extern (C) void DragEvent_initDragEvent_0(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool, ushort, bool, Handle);
extern (C) void DragEvent_initDragEvent_1(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool, ushort);
extern (C) void DragEvent_initDragEvent_2(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool, bool);
extern (C) void DragEvent_initDragEvent_3(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool, bool);
extern (C) void DragEvent_initDragEvent_4(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool, bool);
extern (C) void DragEvent_initDragEvent_5(Handle, string, bool, bool, bool, Handle, int, int, int, int, int, bool);
extern (C) void DragEvent_initDragEvent_6(Handle, string, bool, bool, bool, Handle, int, int, int, int, int);
extern (C) void DragEvent_initDragEvent_7(Handle, string, bool, bool, bool, Handle, int, int, int, int);
extern (C) void DragEvent_initDragEvent_8(Handle, string, bool, bool, bool, Handle, int, int, int);
extern (C) void DragEvent_initDragEvent_9(Handle, string, bool, bool, bool, Handle, int, int);
extern (C) void DragEvent_initDragEvent_10(Handle, string, bool, bool, bool, Handle, int);
extern (C) void DragEvent_initDragEvent_11(Handle, string, bool, bool, bool, Handle);
extern (C) void DragEvent_initDragEvent_12(Handle, string, bool, bool);
extern (C) void DragEvent_initDragEvent_13(Handle, string, bool);
extern (C) void DragEventInit_dataTransfer_Set(Handle, bool, Handle);