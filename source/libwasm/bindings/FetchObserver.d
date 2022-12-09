module libwasm.bindings.FetchObserver;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct FetchObserver {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  FetchState state()() {
    return Object_Getter__int(this._parent, "state");
  }
  void onstatechange(T0)(scope auto ref Optional!(T0) onstatechange) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onstatechange", !onstatechange.empty, onstatechange.front);
  }
  EventHandler onstatechange()() {
    return Object_Getter__EventHandler(this._parent, "onstatechange");
  }
  void onrequestprogress(T0)(scope auto ref Optional!(T0) onrequestprogress) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onrequestprogress", !onrequestprogress.empty, onrequestprogress.front);
  }
  EventHandler onrequestprogress()() {
    return Object_Getter__EventHandler(this._parent, "onrequestprogress");
  }
  void onresponseprogress(T0)(scope auto ref Optional!(T0) onresponseprogress) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onresponseprogress", !onresponseprogress.empty, onresponseprogress.front);
  }
  EventHandler onresponseprogress()() {
    return Object_Getter__EventHandler(this._parent, "onresponseprogress");
  }
}
enum FetchState {
  requesting,
  responding,
  aborted,
  errored,
  complete
}
struct ObserverCallback {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  void handleEvent()(scope ref FetchObserver observer) {
    Object_Call_Handle__void(this.handle, "handleEvent", observer._parent);
  }
}


