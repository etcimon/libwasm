module libwasm.bindings.AudioBufferSourceNode;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.AudioBuffer;
import libwasm.bindings.AudioNode;
import libwasm.bindings.AudioParam;
import libwasm.bindings.AudioScheduledSourceNode;

@safe:
nothrow:

struct AudioBufferSourceNode {
  nothrow:
  libwasm.bindings.AudioScheduledSourceNode.AudioScheduledSourceNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioScheduledSourceNode(h);
  }
  void buffer(T0)(scope auto ref Optional!(T0) buffer) if (isTOrPointer!(T0, AudioBuffer)) {
    Serialize_Object_VarArgCall!void(this._parent, "buffer", "Optional!Handle", tuple(!buffer.empty, cast(Handle)buffer.front.handle));
  }
  auto buffer()() {
    return recastOpt!(AudioBuffer)(Object_Getter__OptionalHandle(this._parent, "buffer"));
  }
  auto playbackRate()() {
    return AudioParam(Object_Getter__Handle(this._parent, "playbackRate"));
  }
  auto detune()() {
    return AudioParam(Object_Getter__Handle(this._parent, "detune"));
  }
  void loop()(bool loop) {
    Object_Call_bool__void(this._parent, "loop", loop);
  }
  bool loop()() {
    return Object_Getter__bool(this._parent, "loop");
  }
  void loopStart()(double loopStart) {
    Object_Call_double__void(this._parent, "loopStart", loopStart);
  }
  double loopStart()() {
    return Object_Getter__double(this._parent, "loopStart");
  }
  void loopEnd()(double loopEnd) {
    Object_Call_double__void(this._parent, "loopEnd", loopEnd);
  }
  double loopEnd()() {
    return Object_Getter__double(this._parent, "loopEnd");
  }
  void start()(double when /* = 0 */, double grainOffset /* = 0 */, double grainDuration) {
    Serialize_Object_VarArgCall!void(this._parent, "start", "double;double;double", tuple(when, grainOffset, grainDuration));
  }
  void start()(double when /* = 0 */, double grainOffset /* = 0 */) {
    Object_Call_double_double__void(this._parent, "start", when, grainOffset);
  }
  void start()(double when /* = 0 */) {
    Object_Call_double__void(this._parent, "start", when);
  }
  void start()() {
    Object_Call__void(this._parent, "start");
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}
struct AudioBufferSourceOptions {
  nothrow:
  JsHandle handle;
  alias handle this;
  this(Handle h) {
    this.handle = JsHandle(h);
  }
  static auto create() {
    return AudioBufferSourceOptions(libwasm_add__object());
  }
  void buffer(T0)(scope auto ref Optional!(T0) buffer) if (isTOrPointer!(T0, AudioBuffer)) {
    Serialize_Object_VarArgCall!void(this.handle, "buffer", "Optional!Handle", tuple(!buffer.empty, cast(Handle)buffer.front.handle));
  }
  auto buffer()() {
    return recastOpt!(AudioBuffer)(Object_Getter__OptionalHandle(this.handle, "buffer"));
  }
  void detune()(float detune) {
    Object_Call_float__void(this.handle, "detune", detune);
  }
  float detune()() {
    return Object_Getter__float(this.handle, "detune");
  }
  void loop()(bool loop) {
    Object_Call_bool__void(this.handle, "loop", loop);
  }
  bool loop()() {
    return Object_Getter__bool(this.handle, "loop");
  }
  void loopEnd()(double loopEnd) {
    Object_Call_double__void(this.handle, "loopEnd", loopEnd);
  }
  double loopEnd()() {
    return Object_Getter__double(this.handle, "loopEnd");
  }
  void loopStart()(double loopStart) {
    Object_Call_double__void(this.handle, "loopStart", loopStart);
  }
  double loopStart()() {
    return Object_Getter__double(this.handle, "loopStart");
  }
  void playbackRate()(float playbackRate) {
    Object_Call_float__void(this.handle, "playbackRate", playbackRate);
  }
  float playbackRate()() {
    return Object_Getter__float(this.handle, "playbackRate");
  }
}


