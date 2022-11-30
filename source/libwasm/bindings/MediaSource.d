module libwasm.bindings.MediaSource;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.EventHandler;
import libwasm.bindings.EventTarget;
import libwasm.bindings.SourceBuffer;
import libwasm.bindings.SourceBufferList;

@safe:
nothrow:

struct MediaSource {
  nothrow:
  libwasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto sourceBuffers()() {
    return SourceBufferList(Object_Getter__Handle(this._parent, "sourceBuffers"));
  }
  auto activeSourceBuffers()() {
    return SourceBufferList(Object_Getter__Handle(this._parent, "activeSourceBuffers"));
  }
  MediaSourceReadyState readyState()() {
    return Object_Getter__int(this._parent, "readyState");
  }
  void duration()(double duration) {
    Object_Call_double__void(this._parent, "duration", duration);
  }
  double duration()() {
    return Object_Getter__double(this._parent, "duration");
  }
  void onsourceopen(T0)(scope auto ref Optional!(T0) onsourceopen) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onsourceopen", !onsourceopen.empty, onsourceopen.front);
  }
  EventHandler onsourceopen()() {
    return Object_Getter__EventHandler(this._parent, "onsourceopen");
  }
  void onsourceended(T0)(scope auto ref Optional!(T0) onsourceended) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onsourceended", !onsourceended.empty, onsourceended.front);
  }
  EventHandler onsourceended()() {
    return Object_Getter__EventHandler(this._parent, "onsourceended");
  }
  void onsourceclosed(T0)(scope auto ref Optional!(T0) onsourceclosed) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onsourceclosed", !onsourceclosed.empty, onsourceclosed.front);
  }
  EventHandler onsourceclosed()() {
    return Object_Getter__EventHandler(this._parent, "onsourceclosed");
  }
  auto addSourceBuffer()(string type) {
    return SourceBuffer(Object_Call_string__Handle(this._parent, "addSourceBuffer", type));
  }
  void removeSourceBuffer()(scope ref SourceBuffer sourceBuffer) {
    Object_Call_Handle__void(this._parent, "removeSourceBuffer", sourceBuffer._parent);
  }
  void endOfStream()(MediaSourceEndOfStreamError error) {
    Object_Call_int__void(this._parent, "endOfStream", error);
  }
  void endOfStream()() {
    Object_Call__void(this._parent, "endOfStream");
  }
  void setLiveSeekableRange()(double start, double end) {
    Object_Call_double_double__void(this._parent, "setLiveSeekableRange", start, end);
  }
  void clearLiveSeekableRange()() {
    Object_Call__void(this._parent, "clearLiveSeekableRange");
  }
  bool isTypeSupported()(string type) {
    return Object_Call_string__bool(this._parent, "isTypeSupported", type);
  }
  string mozDebugReaderData()() {
    return Object_Getter__string(this._parent, "mozDebugReaderData");
  }
}
enum MediaSourceEndOfStreamError {
  network,
  decode
}
enum MediaSourceReadyState {
  closed,
  open,
  ended
}


