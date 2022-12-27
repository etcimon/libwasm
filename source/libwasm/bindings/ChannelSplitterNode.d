module libwasm.bindings.ChannelSplitterNode;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.AudioNode;

@safe:
nothrow:

struct ChannelSplitterNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
}
struct ChannelSplitterOptions {
  nothrow:
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return ChannelSplitterOptions(libwasm_add__object());
  }
  void numberOfOutputs()(uint numberOfOutputs) {
    Object_Call_uint__void(this._parent, "numberOfOutputs", numberOfOutputs);
  }
  uint numberOfOutputs()() {
    return Object_Getter__uint(this._parent, "numberOfOutputs");
  }
}


