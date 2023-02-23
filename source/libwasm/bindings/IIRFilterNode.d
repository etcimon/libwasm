module libwasm.bindings.IIRFilterNode;

import libwasm.types;

import libwasm.memory.ct: tuple;
import libwasm.bindings.AudioNode;

@safe:
nothrow:

struct IIRFilterNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
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
struct IIRFilterOptions {
  nothrow:
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return IIRFilterOptions(libwasm_add__object());
  }
  void feedforward()(scope ref Sequence!(double) feedforward) {
    Object_Call_Handle__void(this._parent, "feedforward", feedforward.handle);
  }
  auto feedforward()() {
    return Sequence!(double)(Object_Getter__Handle(this._parent, "feedforward"));
  }
  void feedback()(scope ref Sequence!(double) feedback) {
    Object_Call_Handle__void(this._parent, "feedback", feedback.handle);
  }
  auto feedback()() {
    return Sequence!(double)(Object_Getter__Handle(this._parent, "feedback"));
  }
}


