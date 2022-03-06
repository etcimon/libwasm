module spasm.bindings.BiquadFilterNode;

import spasm.types;
import spasm.bindings.AudioNode;
import spasm.bindings.AudioParam;

@safe:
nothrow:

struct BiquadFilterNode {
  nothrow:
  spasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  void type()(BiquadFilterType type) {
    BiquadFilterNode_type_Set(this._parent, type);
  }
  BiquadFilterType type()() {
    return BiquadFilterNode_type_Get(this._parent);
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
    BiquadFilterNode_getFrequencyResponse(this._parent, frequencyHz.handle, magResponse.handle, phaseResponse.handle);
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
  spasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return BiquadFilterOptions(spasm_add__object());
  }
  void type()(BiquadFilterType type) {
    BiquadFilterOptions_type_Set(this._parent, type);
  }
  BiquadFilterType type()() {
    return BiquadFilterOptions_type_Get(this._parent);
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


extern (C) void BiquadFilterNode_type_Set(Handle, BiquadFilterType);
extern (C) BiquadFilterType BiquadFilterNode_type_Get(Handle);
extern (C) void BiquadFilterNode_getFrequencyResponse(Handle, Handle, Handle, Handle);
extern (C) void BiquadFilterOptions_type_Set(Handle, BiquadFilterType);
extern (C) BiquadFilterType BiquadFilterOptions_type_Get(Handle);