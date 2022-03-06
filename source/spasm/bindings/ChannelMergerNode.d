module spasm.bindings.ChannelMergerNode;

import spasm.types;
import spasm.bindings.AudioNode;

@safe:
nothrow:

struct ChannelMergerNode {
  nothrow:
  spasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
}
struct ChannelMergerOptions {
  nothrow:
  spasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return ChannelMergerOptions(spasm_add__object());
  }
  void numberOfInputs()(uint numberOfInputs) {
    Object_Call_uint__void(this._parent, "numberOfInputs", numberOfInputs);
  }
  uint numberOfInputs()() {
    return Object_Getter__uint(this._parent, "numberOfInputs");
  }
}


