module spasm.bindings.SourceBuffer;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.TimeRanges;

@safe:
nothrow:

struct SourceBuffer {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  void mode()(SourceBufferAppendMode mode) {
    SourceBuffer_mode_Set(this._parent, mode);
  }
  SourceBufferAppendMode mode()() {
    return SourceBuffer_mode_Get(this._parent);
  }
  bool updating()() {
    return Object_Getter__bool(this._parent, "updating");
  }
  auto buffered()() {
    return TimeRanges(Object_Getter__Handle(this._parent, "buffered"));
  }
  void timestampOffset()(double timestampOffset) {
    Object_Call_double__void(this._parent, "timestampOffset", timestampOffset);
  }
  double timestampOffset()() {
    return Object_Getter__double(this._parent, "timestampOffset");
  }
  void appendWindowStart()(double appendWindowStart) {
    Object_Call_double__void(this._parent, "appendWindowStart", appendWindowStart);
  }
  double appendWindowStart()() {
    return Object_Getter__double(this._parent, "appendWindowStart");
  }
  void appendWindowEnd()(double appendWindowEnd) {
    Object_Call_double__void(this._parent, "appendWindowEnd", appendWindowEnd);
  }
  double appendWindowEnd()() {
    return Object_Getter__double(this._parent, "appendWindowEnd");
  }
  void onupdatestart(T0)(scope auto ref Optional!(T0) onupdatestart) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onupdatestart", !onupdatestart.empty, onupdatestart.front);
  }
  EventHandler onupdatestart()() {
    return Object_Getter__EventHandler(this._parent, "onupdatestart");
  }
  void onupdate(T0)(scope auto ref Optional!(T0) onupdate) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onupdate", !onupdate.empty, onupdate.front);
  }
  EventHandler onupdate()() {
    return Object_Getter__EventHandler(this._parent, "onupdate");
  }
  void onupdateend(T0)(scope auto ref Optional!(T0) onupdateend) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onupdateend", !onupdateend.empty, onupdateend.front);
  }
  EventHandler onupdateend()() {
    return Object_Getter__EventHandler(this._parent, "onupdateend");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void onabort(T0)(scope auto ref Optional!(T0) onabort) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onabort", !onabort.empty, onabort.front);
  }
  EventHandler onabort()() {
    return Object_Getter__EventHandler(this._parent, "onabort");
  }
  void appendBuffer()(scope ref ArrayBuffer data) {
    Object_Call_Handle__void(this._parent, "appendBuffer", data.handle);
  }
  void appendBuffer()(scope ref ArrayBufferView data) {
    Object_Call_Handle__void(this._parent, "appendBuffer", data.handle);
  }
  auto appendBufferAsync()(scope ref ArrayBuffer data) {
    return Promise!(void)(Object_Call_Handle__Handle(this._parent, "appendBufferAsync", data.handle));
  }
  auto appendBufferAsync()(scope ref ArrayBufferView data) {
    return Promise!(void)(Object_Call_Handle__Handle(this._parent, "appendBufferAsync", data.handle));
  }
  void abort()() {
    Object_Call__void(this._parent, "abort");
  }
  void remove()(double start, double end) {
    Object_Call_double_double__void(this._parent, "remove", start, end);
  }
  auto removeAsync()(double start, double end) {
    return Promise!(void)(SourceBuffer_removeAsync(this._parent, start, end));
  }
  void changeType()(string type) {
    Object_Call_string__void(this._parent, "changeType", type);
  }
}
enum SourceBufferAppendMode {
  segments,
  sequence
}


extern (C) void SourceBuffer_mode_Set(Handle, SourceBufferAppendMode);
extern (C) SourceBufferAppendMode SourceBuffer_mode_Get(Handle);
extern (C) Handle SourceBuffer_removeAsync(Handle, double, double);