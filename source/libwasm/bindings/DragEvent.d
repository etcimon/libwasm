module libwasm.bindings.DragEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.DataTransfer;
import libwasm.bindings.EventTarget;
import libwasm.bindings.MouseEvent;
import libwasm.bindings.Window;

@safe:
nothrow:

struct DragEvent {
  nothrow:
  libwasm.bindings.MouseEvent.MouseEvent _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MouseEvent(h);
  }
  auto dataTransfer()() {
    return recastOpt!(DataTransfer)(Object_Getter__OptionalHandle(this._parent, "dataTransfer"));
  }
  void initDragEvent(T3, T14, T15)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */, bool aAltKey /* = false */, bool aShiftKey /* = false */, bool aMetaKey /* = false */, ushort aButton /* = 0 */, scope auto ref Optional!(T14) aRelatedTarget /* = no!(EventTarget) */, scope auto ref Optional!(T15) aDataTransfer /* = no!(DataTransfer) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget) && isTOrPointer!(T15, DataTransfer)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;ushort;Optional!Handle;Optional!Handle", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey, aAltKey, aShiftKey, aMetaKey, aButton, !aRelatedTarget.empty, cast(Handle)aRelatedTarget.front.handle, !aDataTransfer.empty, cast(Handle)aDataTransfer.front.handle));
  }
  void initDragEvent(T3, T14)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */, bool aAltKey /* = false */, bool aShiftKey /* = false */, bool aMetaKey /* = false */, ushort aButton /* = 0 */, scope auto ref Optional!(T14) aRelatedTarget /* = no!(EventTarget) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;ushort;Optional!Handle", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey, aAltKey, aShiftKey, aMetaKey, aButton, !aRelatedTarget.empty, cast(Handle)aRelatedTarget.front.handle));
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */, bool aAltKey /* = false */, bool aShiftKey /* = false */, bool aMetaKey /* = false */, ushort aButton /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;ushort", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey, aAltKey, aShiftKey, aMetaKey, aButton));
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */, bool aAltKey /* = false */, bool aShiftKey /* = false */, bool aMetaKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey, aAltKey, aShiftKey, aMetaKey));
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */, bool aAltKey /* = false */, bool aShiftKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey, aAltKey, aShiftKey));
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */, bool aAltKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey, aAltKey));
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */, bool aCtrlKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY, aCtrlKey));
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */, int aClientY /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail, aScreenX, aScreenY, aClientX, aClientY));
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */, int aClientX /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle;int;int;int;int", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail, aScreenX, aScreenY, aClientX));
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */, int aScreenY /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle;int;int;int", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail, aScreenX, aScreenY));
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */, int aScreenX /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle;int;int", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail, aScreenX));
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */, int aDetail /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle;int", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent, aDetail));
  }
  void initDragEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) aView /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool;Optional!Handle", tuple(type, canBubble, cancelable, !aView.empty, cast(Handle)aView.front._parent));
  }
  void initDragEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool;bool", tuple(type, canBubble, cancelable));
  }
  void initDragEvent()(string type, bool canBubble /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initDragEvent", "string;bool", tuple(type, canBubble));
  }
  void initDragEvent()(string type) {
    Object_Call_string__void(this._parent, "initDragEvent", type);
  }
}
struct DragEventInit {
  nothrow:
  libwasm.bindings.MouseEvent.MouseEventInit _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .MouseEventInit(h);
  }
  static auto create() {
    return DragEventInit(libwasm_add__object());
  }
  void dataTransfer(T0)(scope auto ref Optional!(T0) dataTransfer) if (isTOrPointer!(T0, DataTransfer)) {
    Serialize_Object_VarArgCall!void(this._parent, "dataTransfer", "Optional!Handle", tuple(!dataTransfer.empty, cast(Handle)dataTransfer.front.handle));
  }
  auto dataTransfer()() {
    return recastOpt!(DataTransfer)(Object_Getter__OptionalHandle(this._parent, "dataTransfer"));
  }
}


