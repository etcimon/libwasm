module libwasm.bindings.VideoTrackList;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.VideoTrack;

@safe:
nothrow:

struct VideoTrackList {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  uint length()() {
    return Object_Getter__uint(this._parent, "length");
  }
  auto opIndex()(uint index) {
    return VideoTrack(Object_Call_uint__Handle(this._parent, "getter", index));
  }
  auto opDispatch(uint index)() {
    return VideoTrack(Object_Call_uint__Handle(this._parent, "getter", index));
  }
  auto getTrackById()(string id) {
    return recastOpt!(VideoTrack)(Object_Call_string__OptionalHandle(this._parent, "getTrackById", id));
  }
  int selectedIndex()() {
    return Object_Getter__int(this._parent, "selectedIndex");
  }
  void onchange(T0)(scope auto ref Optional!(T0) onchange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onchange", !onchange.empty, onchange.front);
  }
  EventHandler onchange()() {
    return Object_Getter__EventHandler(this._parent, "onchange");
  }
  void onaddtrack(T0)(scope auto ref Optional!(T0) onaddtrack) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onaddtrack", !onaddtrack.empty, onaddtrack.front);
  }
  EventHandler onaddtrack()() {
    return Object_Getter__EventHandler(this._parent, "onaddtrack");
  }
  void onremovetrack(T0)(scope auto ref Optional!(T0) onremovetrack) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onremovetrack", !onremovetrack.empty, onremovetrack.front);
  }
  EventHandler onremovetrack()() {
    return Object_Getter__EventHandler(this._parent, "onremovetrack");
  }
}


