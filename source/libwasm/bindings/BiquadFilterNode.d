module libwasm.bindings.BiquadFilterNode;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.AudioNode;
import libwasm.bindings.AudioParam;

@safe:
nothrow:

struct BiquadFilterNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  void type()(BiquadFilterType type) {
    Object_Call_int__void(this._parent, "type", type);
  }
  BiquadFilterType type()() {
    return Object_Getter__int(this._parent, "type");
  }
  auto frequency()() {
    return AudioParam(Object_Getter__Handle(this._parent, "frequency"));
  }
  auto detune()() {
    return AudioParam(Object_Getter__Handle(this._parent, "detune"));
  }
  auto Q()() {
    return AudioParam(Object_Getter__Handle(this._parent, "Q"));
  }
  auto gain()() {
    return AudioParam(Object_Getter__Handle(this._parent, "gain"));
  }
  void getFrequencyResponse()(scope ref Float32Array frequencyHz, scope ref Float32Array magResponse, scope ref Float32Array phaseResponse) {
    Serialize_Object_VarArgCall!void(this._parent, "getFrequencyResponse", "Handle;Handle;Handle", tuple(cast(Handle)frequencyHz.handle, cast(Handle)magResponse.handle, cast(Handle)phaseResponse.handle));
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}
struct BiquadFilterOptions {
  nothrow:
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return BiquadFilterOptions(libwasm_add__object());
  }
  void type()(BiquadFilterType type) {
    Object_Call_int__void(this._parent, "type", type);
  }
  BiquadFilterType type()() {
    return Object_Getter__int(this._parent, "type");
  }
  void Q()(float q) {
    Object_Call_float__void(this._parent, "Q", Q);
  }
  float Q()() {
    return Object_Getter__float(this._parent, "Q");
  }
  void detune()(float detune) {
    Object_Call_float__void(this._parent, "detune", detune);
  }
  float detune()() {
    return Object_Getter__float(this._parent, "detune");
  }
  void frequency()(float frequency) {
    Object_Call_float__void(this._parent, "frequency", frequency);
  }
  float frequency()() {
    return Object_Getter__float(this._parent, "frequency");
  }
  void gain()(float gain) {
    Object_Call_float__void(this._parent, "gain", gain);
  }
  float gain()() {
    return Object_Getter__float(this._parent, "gain");
  }
}
enum BiquadFilterType {
  lowpass,
  highpass,
  bandpass,
  lowshelf,
  highshelf,
  peaking,
  notch,
  allpass
}


