module spasm.bindings.AudioDestinationNode;

import spasm.types;
import spasm.bindings.AudioNode;

@safe:
nothrow:

struct AudioDestinationNode {
  nothrow:
  spasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  uint maxChannelCount()() {
    return Object_Getter__uint(this._parent, "maxChannelCount");
  }
}


