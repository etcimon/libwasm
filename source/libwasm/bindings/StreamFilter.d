module libwasm.bindings.StreamFilter;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;

@safe:
nothrow:

struct StreamFilter {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto create()(uint requestId, string addonId) {
    return StreamFilter(Serialize_Object_VarArgCall!Handle(this._parent, "create", "uint;string", tuple(requestId, addonId)));
  }
  void suspend()() {
    Object_Call__void(this._parent, "suspend");
  }
  void resume()() {
    Object_Call__void(this._parent, "resume");
  }
  void close()() {
    Object_Call__void(this._parent, "close");
  }
  void disconnect()() {
    Object_Call__void(this._parent, "disconnect");
  }
  void write()(scope ref SumType!(ArrayBuffer, Uint8Array) data) {
    Serialize_Object_VarArgCall!void(this._parent, "write", "SumType!(Handle,Handle)", tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => 0),((ref data.Types[1] v) => 1))(data),tuple(libwasm.sumtype.match!(((ref data.Types[0] v) => cast(Handle)v.handle),((ref data.Types[1] v) => Handle.init))(data),libwasm.sumtype.match!(((ref data.Types[0] v) => Handle.init),((ref data.Types[1] v) => cast(Handle)v.handle))(data))));
  }
  StreamFilterStatus status()() {
    return Object_Getter__int(this._parent, "status");
  }
  string error()() {
    return Object_Getter__string(this._parent, "error");
  }
  void ondata(T0)(scope auto ref Optional!(T0) ondata) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "ondata", !ondata.empty, ondata.front);
  }
  EventHandler ondata()() {
    return Object_Getter__EventHandler(this._parent, "ondata");
  }
  void onstart(T0)(scope auto ref Optional!(T0) onstart) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onstart", !onstart.empty, onstart.front);
  }
  EventHandler onstart()() {
    return Object_Getter__EventHandler(this._parent, "onstart");
  }
  void onstop(T0)(scope auto ref Optional!(T0) onstop) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onstop", !onstop.empty, onstop.front);
  }
  EventHandler onstop()() {
    return Object_Getter__EventHandler(this._parent, "onstop");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandlerNonNull)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
}
enum StreamFilterStatus {
  uninitialized,
  transferringdata,
  finishedtransferringdata,
  suspended,
  closed,
  disconnected,
  failed
}


