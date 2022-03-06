module spasm.bindings.OscillatorNode;

import spasm.types;
import spasm.bindings.AudioNode;
import spasm.bindings.AudioParam;
import spasm.bindings.AudioScheduledSourceNode;
import spasm.bindings.PeriodicWave;

@safe:
nothrow:

struct OscillatorNode {
  nothrow:
  spasm.bindings.AudioScheduledSourceNode.AudioScheduledSourceNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioScheduledSourceNode(h);
  }
  void type()(OscillatorType type) {
    OscillatorNode_type_Set(this._parent, type);
  }
  OscillatorType type()() {
    return OscillatorNode_type_Get(this._parent);
  }
  auto frequency()() {
    return AudioParam(Object_Getter__Handle(this._parent, "frequency"));
  }
  auto detune()() {
    return AudioParam(Object_Getter__Handle(this._parent, "detune"));
  }
  void setPeriodicWave()(scope ref PeriodicWave periodicWave) {
    Object_Call_Handle__void(this._parent, "setPeriodicWave", periodicWave.handle);
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}
struct OscillatorOptions {
  nothrow:
  spasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return OscillatorOptions(spasm_add__object());
  }
  void type()(OscillatorType type) {
    OscillatorOptions_type_Set(this._parent, type);
  }
  OscillatorType type()() {
    return OscillatorOptions_type_Get(this._parent);
  }
  void frequency()(float frequency) {
    Object_Call_float__void(this._parent, "frequency", frequency);
  }
  float frequency()() {
    return Object_Getter__float(this._parent, "frequency");
  }
  void detune()(float detune) {
    Object_Call_float__void(this._parent, "detune", detune);
  }
  float detune()() {
    return Object_Getter__float(this._parent, "detune");
  }
  void periodicWave()(scope ref PeriodicWave periodicWave) {
    Object_Call_Handle__void(this._parent, "periodicWave", periodicWave.handle);
  }
  auto periodicWave()() {
    return PeriodicWave(Object_Getter__Handle(this._parent, "periodicWave"));
  }
}
enum OscillatorType {
  sine,
  square,
  sawtooth,
  triangle,
  custom
}


extern (C) void OscillatorNode_type_Set(Handle, OscillatorType);
extern (C) OscillatorType OscillatorNode_type_Get(Handle);
extern (C) void OscillatorOptions_type_Set(Handle, OscillatorType);
extern (C) OscillatorType OscillatorOptions_type_Get(Handle);