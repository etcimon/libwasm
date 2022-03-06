module spasm.bindings.ChannelSplitterNode;

import spasm.types;
import spasm.bindings.AudioNode;

@safe:
nothrow:

struct ChannelSplitterNode {
  nothrow:
  spasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
}
struct ChannelSplitterOptions {
  nothrow:
  spasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return ChannelSplitterOptions(spasm_add__object());
  }
  void numberOfOutputs()(uint numberOfOutputs) {
    Object_Call_uint__void(this._parent, "numberOfOutputs", numberOfOutputs);
  }
  uint numberOfOutputs()() {
    return Object_Getter__uint(this._parent, "numberOfOutputs");
  }
}


