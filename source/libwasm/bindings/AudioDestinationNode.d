module libwasm.bindings.AudioDestinationNode;

import libwasm.types;

import std.typecons: tuple;
import libwasm.bindings.AudioNode;

@safe:
nothrow:

struct AudioDestinationNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  uint maxChannelCount()() {
    return Object_Getter__uint(this._parent, "maxChannelCount");
  }
}


