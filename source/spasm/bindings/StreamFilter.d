module spasm.bindings.StreamFilter;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;

@safe:
nothrow:

struct StreamFilter {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto create()(uint requestId, string addonId) {
    return StreamFilter(StreamFilter_create(this._parent, requestId, addonId));
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
    StreamFilter_write(this._parent, data);
  }
  StreamFilterStatus status()() {
    return StreamFilter_status_Get(this._parent);
  }
  string error()() {
    return Object_Getter__string(this._parent, "error");
  }
  void ondata(T0)(scope auto ref Optional!(T0) ondata) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondata", !ondata.empty, ondata.front);
  }
  EventHandler ondata()() {
    return Object_Getter__EventHandler(this._parent, "ondata");
  }
  void onstart(T0)(scope auto ref Optional!(T0) onstart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onstart", !onstart.empty, onstart.front);
  }
  EventHandler onstart()() {
    return Object_Getter__EventHandler(this._parent, "onstart");
  }
  void onstop(T0)(scope auto ref Optional!(T0) onstop) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onstop", !onstop.empty, onstop.front);
  }
  EventHandler onstop()() {
    return Object_Getter__EventHandler(this._parent, "onstop");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
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


extern (C) Handle StreamFilter_create(Handle, uint, string);
extern (C) void StreamFilter_write(Handle, scope ref SumType!(ArrayBuffer, Uint8Array));
extern (C) StreamFilterStatus StreamFilter_status_Get(Handle);