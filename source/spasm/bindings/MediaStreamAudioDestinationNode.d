module spasm.bindings.MediaStreamAudioDestinationNode;

import spasm.types;
import spasm.bindings.AudioNode;
import spasm.bindings.MediaStream;

@safe:
nothrow:

struct MediaStreamAudioDestinationNode {
  nothrow:
  spasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  auto stream()() {
    return MediaStream(Object_Getter__Handle(this._parent, "stream"));
  }
}


