module libwasm.bindings.AnalyserNode;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.AudioNode;

@safe:
nothrow:

struct AnalyserNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  void getFloatFrequencyData()(scope ref Float32Array array) {
    Object_Call_Handle__void(this._parent, "getFloatFrequencyData", array.handle);
  }
  void getByteFrequencyData()(scope ref Uint8Array array) {
    Object_Call_Handle__void(this._parent, "getByteFrequencyData", array.handle);
  }
  void getFloatTimeDomainData()(scope ref Float32Array array) {
    Object_Call_Handle__void(this._parent, "getFloatTimeDomainData", array.handle);
  }
  void getByteTimeDomainData()(scope ref Uint8Array array) {
    Object_Call_Handle__void(this._parent, "getByteTimeDomainData", array.handle);
  }
  void fftSize()(uint fftSize) {
    Object_Call_uint__void(this._parent, "fftSize", fftSize);
  }
  uint fftSize()() {
    return Object_Getter__uint(this._parent, "fftSize");
  }
  uint frequencyBinCount()() {
    return Object_Getter__uint(this._parent, "frequencyBinCount");
  }
  void minDecibels()(double minDecibels) {
    Object_Call_double__void(this._parent, "minDecibels", minDecibels);
  }
  double minDecibels()() {
    return Object_Getter__double(this._parent, "minDecibels");
  }
  void maxDecibels()(double maxDecibels) {
    Object_Call_double__void(this._parent, "maxDecibels", maxDecibels);
  }
  double maxDecibels()() {
    return Object_Getter__double(this._parent, "maxDecibels");
  }
  void smoothingTimeConstant()(double smoothingTimeConstant) {
    Object_Call_double__void(this._parent, "smoothingTimeConstant", smoothingTimeConstant);
  }
  double smoothingTimeConstant()() {
    return Object_Getter__double(this._parent, "smoothingTimeConstant");
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}
struct AnalyserOptions {
  nothrow:
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return AnalyserOptions(libwasm_add__object());
  }
  void fftSize()(uint fftSize) {
    Object_Call_uint__void(this._parent, "fftSize", fftSize);
  }
  uint fftSize()() {
    return Object_Getter__uint(this._parent, "fftSize");
  }
  void maxDecibels()(double maxDecibels) {
    Object_Call_double__void(this._parent, "maxDecibels", maxDecibels);
  }
  double maxDecibels()() {
    return Object_Getter__double(this._parent, "maxDecibels");
  }
  void minDecibels()(double minDecibels) {
    Object_Call_double__void(this._parent, "minDecibels", minDecibels);
  }
  double minDecibels()() {
    return Object_Getter__double(this._parent, "minDecibels");
  }
  void smoothingTimeConstant()(double smoothingTimeConstant) {
    Object_Call_double__void(this._parent, "smoothingTimeConstant", smoothingTimeConstant);
  }
  double smoothingTimeConstant()() {
    return Object_Getter__double(this._parent, "smoothingTimeConstant");
  }
}


