module libwasm.bindings.EventSource;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct EventSource {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  string url()() {
    return Object_Getter__string(this._parent, "url");
  }
  bool withCredentials()() {
    return Object_Getter__bool(this._parent, "withCredentials");
  }
  enum ushort CONNECTING = 0;
  enum ushort OPEN = 1;
  enum ushort CLOSED = 2;
  ushort readyState()() {
    return Object_Getter__ushort(this._parent, "readyState");
  }
  void onopen(T0)(scope auto ref Optional!(T0) onopen) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onopen", !onopen.empty, onopen.front);
  }
  EventHandler onopen()() {
    return Object_Getter__EventHandler(this._parent, "onopen");
  }
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmessage", !onmessage.empty, onmessage.front);
  }
  EventHandler onmessage()() {
    return Object_Getter__EventHandler(this._parent, "onmessage");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
}
struct EventSourceInit {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return EventSourceInit(libwasm_add__object());
  }
  void withCredentials()(bool withCredentials) {
    Object_Call_bool__void(this.handle, "withCredentials", withCredentials);
  }
  bool withCredentials()() {
    return Object_Getter__bool(this.handle, "withCredentials");
  }
}


