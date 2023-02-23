module libwasm.bindings.OscillatorNode;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.AudioNode;
import libwasm.bindings.AudioParam;
import libwasm.bindings.AudioScheduledSourceNode;
import libwasm.bindings.PeriodicWave;

@safe:
nothrow:

struct OscillatorNode {
  nothrow:
  libwasm.bindings.AudioScheduledSourceNode.AudioScheduledSourceNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioScheduledSourceNode(h);
  }
  void type()(OscillatorType type) {
    Object_Call_int__void(this._parent, "type", type);
  }
  OscillatorType type()() {
    return Object_Getter__int(this._parent, "type");
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
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return OscillatorOptions(libwasm_add__object());
  }
  void type()(OscillatorType type) {
    Object_Call_int__void(this._parent, "type", type);
  }
  OscillatorType type()() {
    return Object_Getter__int(this._parent, "type");
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


