module libwasm.bindings.StereoPannerNode;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AudioNode;
import libwasm.bindings.AudioParam;

@safe:
nothrow:

struct StereoPannerNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  auto pan()() {
    return AudioParam(Object_Getter__Handle(this._parent, "pan"));
  }
  void passThrough()(bool passThrough) {
    Object_Call_bool__void(this._parent, "passThrough", passThrough);
  }
  bool passThrough()() {
    return Object_Getter__bool(this._parent, "passThrough");
  }
}
struct StereoPannerOptions {
  nothrow:
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return StereoPannerOptions(libwasm_add__object());
  }
  void pan()(float pan) {
    Object_Call_float__void(this._parent, "pan", pan);
  }
  float pan()() {
    return Object_Getter__float(this._parent, "pan");
  }
}


