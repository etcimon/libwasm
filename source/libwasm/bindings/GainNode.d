module libwasm.bindings.GainNode;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.AudioNode;
import libwasm.bindings.AudioParam;

@safe:
nothrow:

struct GainNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  auto gain()() {
    return AudioParam(Object_Getter__Handle(this._parent, "gain"));
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}
struct GainOptions {
  nothrow:
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return GainOptions(libwasm_add__object());
  }
  void gain()(float gain) {
    Object_Call_float__void(this._parent, "gain", gain);
  }
  float gain()() {
    return Object_Getter__float(this._parent, "gain");
  }
}


