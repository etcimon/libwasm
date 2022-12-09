module libwasm.bindings.XULCommandEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.UIEvent;
import libwasm.bindings.Window;

@safe:
nothrow:

struct XULCommandEvent {
  nothrow:
  libwasm.bindings.UIEvent.UIEvent _parent;
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
    return recastOpt!(Event)(Object_Getter__OptionalHandle(this._parent, "sourceEvent"));
  }
  void initCommandEvent(T3, T9)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, scope auto ref Optional!(T9) sourceEvent /* = no!(Event) */, ushort inputSource /* = 0 */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T9, Event)) {
    Serialize_Object_VarArgCall!void(this._parent, "initCommandEvent", "string;bool;bool;Optional!Handle;int;bool;bool;bool;bool;Optional!Handle;ushort", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey, !sourceEvent.empty, cast(Handle)sourceEvent.front.handle, inputSource));
  }
  void initCommandEvent(T3, T9)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */, scope auto ref Optional!(T9) sourceEvent /* = no!(Event) */) if (isTOrPointer!(T3, Window) && isTOrPointer!(T9, Event)) {
    Serialize_Object_VarArgCall!void(this._parent, "initCommandEvent", "string;bool;bool;Optional!Handle;int;bool;bool;bool;bool;Optional!Handle", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey, !sourceEvent.empty, cast(Handle)sourceEvent.front.handle));
  }
  void initCommandEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */, bool metaKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initCommandEvent", "string;bool;bool;Optional!Handle;int;bool;bool;bool;bool", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey, altKey, shiftKey, metaKey));
  }
  void initCommandEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */, bool shiftKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initCommandEvent", "string;bool;bool;Optional!Handle;int;bool;bool;bool", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey, altKey, shiftKey));
  }
  void initCommandEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */, bool altKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initCommandEvent", "string;bool;bool;Optional!Handle;int;bool;bool", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey, altKey));
  }
  void initCommandEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, bool ctrlKey /* = false */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initCommandEvent", "string;bool;bool;Optional!Handle;int;bool", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, ctrlKey));
  }
  void initCommandEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initCommandEvent", "string;bool;bool;Optional!Handle;int", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail));
  }
  void initCommandEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initCommandEvent", "string;bool;bool;Optional!Handle", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent));
  }
  void initCommandEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initCommandEvent", "string;bool;bool", tuple(type, canBubble, cancelable));
  }
  void initCommandEvent()(string type, bool canBubble /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initCommandEvent", "string;bool", tuple(type, canBubble));
  }
  void initCommandEvent()(string type) {
    Object_Call_string__void(this._parent, "initCommandEvent", type);
  }
}


