module libwasm.bindings.DelayNode;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AudioNode;
import libwasm.bindings.AudioParam;

@safe:
nothrow:

struct DelayNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  auto delayTime()() {
    return AudioParam(Object_Getter__Handle(this._parent, "delayTime"));
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}
struct DelayOptions {
  nothrow:
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return DelayOptions(libwasm_add__object());
  }
  void maxDelayTime()(double maxDelayTime) {
    Object_Call_double__void(this._parent, "maxDelayTime", maxDelayTime);
  }
  double maxDelayTime()() {
    return Object_Getter__double(this._parent, "maxDelayTime");
  }
  void delayTime()(double delayTime) {
    Object_Call_double__void(this._parent, "delayTime", delayTime);
  }
  double delayTime()() {
    return Object_Getter__double(this._parent, "delayTime");
  }
}


