module libwasm.bindings.MediaStreamAudioDestinationNode;

import libwasm.types;

import memutils.ct: tuple;
import libwasm.bindings.AudioNode;
import libwasm.bindings.MediaStream;

@safe:
nothrow:

struct MediaStreamAudioDestinationNode {
  nothrow:
  libwasm.bindings.AudioNode.AudioNode _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .AudioNode(h);
  }
  auto stream()() {
    return MediaStream(Object_Getter__Handle(this._parent, "stream"));
  }
}


