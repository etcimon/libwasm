module spasm.bindings.MediaKeySession;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.MediaKeyError;
import spasm.bindings.MediaKeyStatusMap;

@safe:
nothrow:

struct MediaKeySession {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto error()() {
    return Object_Getter__OptionalHandle(this._parent, "error");
  }
  string sessionId()() {
    return Object_Getter__string(this._parent, "sessionId");
  }
  double expiration()() {
    return Object_Getter__double(this._parent, "expiration");
  }
  auto closed()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "closed"));
  }
  auto keyStatuses()() {
    return MediaKeyStatusMap(Object_Getter__Handle(this._parent, "keyStatuses"));
  }
  void onkeystatuseschange(T0)(scope auto ref Optional!(T0) onkeystatuseschange) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onkeystatuseschange", !onkeystatuseschange.empty, onkeystatuseschange.front);
  }
  EventHandler onkeystatuseschange()() {
    return Object_Getter__EventHandler(this._parent, "onkeystatuseschange");
  }
  void onmessage(T0)(scope auto ref Optional!(T0) onmessage) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onmessage", !onmessage.empty, onmessage.front);
  }
  EventHandler onmessage()() {
    return Object_Getter__EventHandler(this._parent, "onmessage");
  }
  auto generateRequest()(string initDataType, scope ref BufferSource initData) {
    return Promise!(void)(MediaKeySession_generateRequest(this._parent, initDataType, initData.handle));
  }
  auto load()(string sessionId) {
    return Promise!(bool)(Object_Call_string__Handle(this._parent, "load", sessionId));
  }
  auto update()(scope ref BufferSource response) {
    return Promise!(void)(Object_Call_Handle__Handle(this._parent, "update", response.handle));
  }
  auto close()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "close"));
  }
  auto remove()() {
    return Promise!(void)(Object_Getter__Handle(this._parent, "remove"));
  }
}


extern (C) Handle MediaKeySession_generateRequest(Handle, string, Handle);