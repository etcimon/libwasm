module libwasm.bindings.MediaQueryList;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventListener;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct MediaQueryList {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string media()() {
    return Object_Getter__string(this._parent, "media");
  }
  bool matches()() {
    return Object_Getter__bool(this._parent, "matches");
  }
  void addListener(T0)(scope auto ref Optional!(T0) listener) if (isTOrPointer!(T0, EventListener)) {
    MediaQueryList_addListener(this._parent, !listener.empty, listener.front.handle);
  }
  void removeListener(T0)(scope auto ref Optional!(T0) listener) if (isTOrPointer!(T0, EventListener)) {
    MediaQueryList_removeListener(this._parent, !listener.empty, listener.front.handle);
  }
  void onchange(T0)(scope auto ref Optional!(T0) onchange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onchange", !onchange.empty, onchange.front);
  }
  EventHandler onchange()() {
    return Object_Getter__EventHandler(this._parent, "onchange");
  }
}


extern (C) void MediaQueryList_addListener(Handle, bool, Handle);
extern (C) void MediaQueryList_removeListener(Handle, bool, Handle);