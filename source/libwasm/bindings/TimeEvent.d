module libwasm.bindings.TimeEvent;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.Event;
import libwasm.bindings.Window;

@safe:
nothrow:

struct TimeEvent {
  nothrow:
  libwasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  int detail()() {
    return Object_Getter__int(this._parent, "detail");
  }
  auto view()() {
    return Optional!(WindowProxy)(Object_Getter__OptionalHandle(this._parent, "view"));
  }
  void initTimeEvent(T1)(string aType, scope auto ref Optional!(T1) aView /* = no!(Window) */, int aDetail /* = 0 */) if (isTOrPointer!(T1, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initTimeEvent", "string;Optional!Handle;int", tuple(aType, !aView.empty, cast(Handle)aView.front._parent, aDetail));
  }
  void initTimeEvent(T1)(string aType, scope auto ref Optional!(T1) aView /* = no!(Window) */) if (isTOrPointer!(T1, Window)) {
    Serialize_Object_VarArgCall!void(this._parent, "initTimeEvent", "string;Optional!Handle", tuple(aType, !aView.empty, cast(Handle)aView.front._parent));
  }
  void initTimeEvent()(string aType) {
    Object_Call_string__void(this._parent, "initTimeEvent", aType);
  }
}


