module libwasm.bindings.DynamicsCompressorNode;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.AudioNode;
import libwasm.bindings.AudioParam;

@safe:
nothrow:

struct DynamicsCompressorNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  auto threshold()() {
    return AudioParam(Object_Getter__Handle(this._parent, "threshold"));
  }
  auto knee()() {
    return AudioParam(Object_Getter__Handle(this._parent, "knee"));
  }
  auto ratio()() {
    return AudioParam(Object_Getter__Handle(this._parent, "ratio"));
  }
  float reduction()() {
    return Object_Getter__float(this._parent, "reduction");
  }
  auto attack()() {
    return AudioParam(Object_Getter__Handle(this._parent, "attack"));
  }
  auto release()() {
    return AudioParam(Object_Getter__Handle(this._parent, "release"));
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}
struct DynamicsCompressorOptions {
  nothrow:
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return DynamicsCompressorOptions(libwasm_add__object());
  }
  void attack()(float attack) {
    Object_Call_float__void(this._parent, "attack", attack);
  }
  float attack()() {
    return Object_Getter__float(this._parent, "attack");
  }
  void knee()(float knee) {
    Object_Call_float__void(this._parent, "knee", knee);
  }
  float knee()() {
    return Object_Getter__float(this._parent, "knee");
  }
  void ratio()(float ratio) {
    Object_Call_float__void(this._parent, "ratio", ratio);
  }
  float ratio()() {
    return Object_Getter__float(this._parent, "ratio");
  }
  void release()(float release) {
    Object_Call_float__void(this._parent, "release", release);
  }
  float release()() {
    return Object_Getter__float(this._parent, "release");
  }
  void threshold()(float threshold) {
    Object_Call_float__void(this._parent, "threshold", threshold);
  }
  float threshold()() {
    return Object_Getter__float(this._parent, "threshold");
  }
}


