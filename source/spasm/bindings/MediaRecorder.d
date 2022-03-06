module spasm.bindings.MediaRecorder;

import spasm.types;
import spasm.bindings.EventHandler;
import spasm.bindings.EventTarget;
import spasm.bindings.MediaStream;

@safe:
nothrow:

struct MediaRecorder {
  nothrow:
  spasm.bindings.EventTarget.EventTarget _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .EventTarget(h);
  }
  auto stream()() {
    return MediaStream(Object_Getter__Handle(this._parent, "stream"));
  }
  string mimeType()() {
    return Object_Getter__string(this._parent, "mimeType");
  }
  RecordingState state()() {
    return MediaRecorder_state_Get(this._parent);
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
  void ondataavailable(T0)(scope auto ref Optional!(T0) ondataavailable) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "ondataavailable", !ondataavailable.empty, ondataavailable.front);
  }
  EventHandler ondataavailable()() {
    return Object_Getter__EventHandler(this._parent, "ondataavailable");
  }
  void onpause(T0)(scope auto ref Optional!(T0) onpause) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onpause", !onpause.empty, onpause.front);
  }
  EventHandler onpause()() {
    return Object_Getter__EventHandler(this._parent, "onpause");
  }
  void onresume(T0)(scope auto ref Optional!(T0) onresume) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onresume", !onresume.empty, onresume.front);
  }
  EventHandler onresume()() {
    return Object_Getter__EventHandler(this._parent, "onresume");
  }
  void onerror(T0)(scope auto ref Optional!(T0) onerror) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onerror", !onerror.empty, onerror.front);
  }
  EventHandler onerror()() {
    return Object_Getter__EventHandler(this._parent, "onerror");
  }
  void onwarning(T0)(scope auto ref Optional!(T0) onwarning) if (isTOrPointer!(T0, EventHandler)) {
    Object_Call_EventHandler__void(this._parent, "onwarning", !onwarning.empty, onwarning.front);
  }
  EventHandler onwarning()() {
    return Object_Getter__EventHandler(this._parent, "onwarning");
  }
  void start()(int timeSlice) {
    Object_Call_int__void(this._parent, "start", timeSlice);
  }
  void start()() {
    Object_Call__void(this._parent, "start");
  }
  void stop()() {
    Object_Call__void(this._parent, "stop");
  }
  void pause()() {
    Object_Call__void(this._parent, "pause");
  }
  void resume()() {
    Object_Call__void(this._parent, "resume");
  }
  void requestData()() {
    Object_Call__void(this._parent, "requestData");
  }
  bool isTypeSupported()(string type) {
    return Object_Call_string__bool(this._parent, "isTypeSupported", type);
  }
}
struct MediaRecorderOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return MediaRecorderOptions(spasm_add__object());
  }
  void mimeType()(string mimeType) {
    Object_Call_string__void(this.handle, "mimeType", mimeType);
  }
  string mimeType()() {
    return Object_Getter__string(this.handle, "mimeType");
  }
  void audioBitsPerSecond()(uint audioBitsPerSecond) {
    Object_Call_uint__void(this.handle, "audioBitsPerSecond", audioBitsPerSecond);
  }
  uint audioBitsPerSecond()() {
    return Object_Getter__uint(this.handle, "audioBitsPerSecond");
  }
  void videoBitsPerSecond()(uint videoBitsPerSecond) {
    Object_Call_uint__void(this.handle, "videoBitsPerSecond", videoBitsPerSecond);
  }
  uint videoBitsPerSecond()() {
    return Object_Getter__uint(this.handle, "videoBitsPerSecond");
  }
  void bitsPerSecond()(uint bitsPerSecond) {
    Object_Call_uint__void(this.handle, "bitsPerSecond", bitsPerSecond);
  }
  uint bitsPerSecond()() {
    return Object_Getter__uint(this.handle, "bitsPerSecond");
  }
}
enum RecordingState {
  inactive,
  recording,
  paused
}


extern (C) RecordingState MediaRecorder_state_Get(Handle);