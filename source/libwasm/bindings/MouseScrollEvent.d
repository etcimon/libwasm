module libwasm.bindings.MouseScrollEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventTarget;
import libwasm.bindings.MouseEvent;
import libwasm.bindings.Window;

@safe:
nothrow:

struct MouseScrollEvent {
  nothrow:
  libwasm.bindings.MouseEvent.MouseEvent _parent;
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
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short;Optional!Handle;int", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey, altKey, shiftKey, metaKey, button, !relatedTarget.empty, cast(Handle)relatedTarget.front.handle, axis));
  }
  void initMouseScrollEvent(T3, T14)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, short button /* = 0 */, scope auto ref Optional!(T14) relatedTarget /* = no!(EventTarget) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T14, EventTarget)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short;Optional!Handle", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey, altKey, shiftKey, metaKey, button, !relatedTarget.empty, cast(Handle)relatedTarget.front.handle));
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, short button /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool;short", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey, altKey, shiftKey, metaKey, button));
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool;bool", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey, altKey, shiftKey, metaKey));
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool;bool", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey, altKey, shiftKey));
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool;bool", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey, altKey));
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */, bool ctrlKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int;bool", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, screenX, screenY, clientX, clientY, ctrlKey));
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */, int clientY /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle;int;int;int;int;int", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, screenX, screenY, clientX, clientY));
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */, int clientX /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle;int;int;int;int", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, screenX, screenY, clientX));
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */, int screenY /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle;int;int;int", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, screenX, screenY));
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, int screenX /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle;int;int", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, screenX));
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle;int", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail));
  }
  void initMouseScrollEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool;Optional!Handle", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent));
  }
  void initMouseScrollEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool;bool", tuple(type, canBubble, cancelable));
  }
  void initMouseScrollEvent()(string type, bool canBubble /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initMouseScrollEvent", "string;bool", tuple(type, canBubble));
  }
  void initMouseScrollEvent()(string type) {
    Object_Call_string__void(this._parent, "initMouseScrollEvent", type);
  }
}


