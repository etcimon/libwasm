module spasm.bindings.TimeEvent;

import spasm.types;
import spasm.bindings.Event;
import spasm.bindings.Window;

@safe:
nothrow:

struct TimeEvent {
  nothrow:
  spasm.bindings.Event.Event _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .Event(h);
  }
  int detail()() {
    return Object_Getter__int(this._parent, "detail");
  }
  auto view()() {
    return Object_Getter__OptionalHandle(this._parent, "view");
  }
  void initTimeEvent(T1)(string aType, scope auto ref Optional!(T1) aView /* = no!(Window) */, int aDetail /* = 0 */) if (isTOrPointer!(T1, Window)) {
    TimeEvent_initTimeEvent(this._parent, aType, !aView.empty, aView.front._parent, aDetail);
  }
  void initTimeEvent(T1)(string aType, scope auto ref Optional!(T1) aView /* = no!(Window) */) if (isTOrPointer!(T1, Window)) {
    TimeEvent_initTimeEvent_0(this._parent, aType, !aView.empty, aView.front._parent);
  }
  void initTimeEvent()(string aType) {
    Object_Call_string__void(this._parent, "initTimeEvent", aType);
  }
}


extern (C) void TimeEvent_initTimeEvent(Handle, string, bool, Handle, int);
extern (C) void TimeEvent_initTimeEvent_0(Handle, string, bool, Handle);