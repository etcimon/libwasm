module libwasm.bindings.ChannelMergerNode;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AudioNode;

@safe:
nothrow:

struct ChannelMergerNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
}
struct ChannelMergerOptions {
  nothrow:
  libwasm.bindings.AudioNode.AudioNodeOptions _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNodeOptions(h);
  }
  static auto create() {
    return ChannelMergerOptions(libwasm_add__object());
  }
  void numberOfInputs()(uint numberOfInputs) {
    Object_Call_uint__void(this._parent, "numberOfInputs", numberOfInputs);
  }
  uint numberOfInputs()() {
    return Object_Getter__uint(this._parent, "numberOfInputs");
  }
}


