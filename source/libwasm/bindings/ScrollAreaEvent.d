module libwasm.bindings.ScrollAreaEvent;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.UIEvent;
import libwasm.bindings.Window;

@safe:
nothrow:

struct ScrollAreaEvent {
  nothrow:
  libwasm.bindings.UIEvent.UIEvent _parent;
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
    Serialize_Object_VarArgCall!void(this._parent, "initScrollAreaEvent", "string;bool;bool;Optional!Handle;int;float;float;float;float", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, x, y, width, height));
  }
  void initScrollAreaEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, float x /* = 0 */, float y /* = 0 */, float width /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initScrollAreaEvent", "string;bool;bool;Optional!Handle;int;float;float;float", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, x, y, width));
  }
  void initScrollAreaEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, float x /* = 0 */, float y /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initScrollAreaEvent", "string;bool;bool;Optional!Handle;int;float;float", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, x, y));
  }
  void initScrollAreaEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */, float x /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initScrollAreaEvent", "string;bool;bool;Optional!Handle;int;float", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail, x));
  }
  void initScrollAreaEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */, int detail /* = 0 */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initScrollAreaEvent", "string;bool;bool;Optional!Handle;int", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent, detail));
  }
  void initScrollAreaEvent(T3)(string type, bool canBubble /* = false */, bool cancelable /* = false */, scope auto ref Optional!(T3) view /* = no!(Window) */) if (isTOrPointer!(T3, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initScrollAreaEvent", "string;bool;bool;Optional!Handle", tuple(type, canBubble, cancelable, !view.empty, cast(Handle)view.front._parent));
  }
  void initScrollAreaEvent()(string type, bool canBubble /* = false */, bool cancelable /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initScrollAreaEvent", "string;bool;bool", tuple(type, canBubble, cancelable));
  }
  void initScrollAreaEvent()(string type, bool canBubble /* = false */) {
    Serialize_Object_VarArgCall!void(this._parent, "initScrollAreaEvent", "string;bool", tuple(type, canBubble));
  }
  void initScrollAreaEvent()(string type) {
    Object_Call_string__void(this._parent, "initScrollAreaEvent", type);
  }
}


