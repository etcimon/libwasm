module spasm.bindings.IIRFilterNode;

import spasm.types;
import spasm.bindings.AudioNode;

@safe:
nothrow:

struct IIRFilterNode {
  nothrow:
  spasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  void getFrequencyResponse()(scope ref Float32Array frequencyHz, scope ref Float32Array magResponse, scope ref Float32Array phaseResponse) {
    IIRFilterNode_getFrequencyResponse(this._parent, frequencyHz.handle, magResponse.handle, phaseResponse.handle);
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
  spasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return IIRFilterOptions(spasm_add__object());
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


extern (C) void IIRFilterNode_getFrequencyResponse(Handle, Handle, Handle, Handle);