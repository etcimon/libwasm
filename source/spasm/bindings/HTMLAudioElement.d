module spasm.bindings.HTMLAudioElement;

import spasm.types;
import spasm.bindings.HTMLMediaElement;

@safe:
nothrow:

struct HTMLAudioElement {
  nothrow:
  spasm.bindings.HTMLMediaElement.HTMLMediaElement _parent;
  alias _parent this;
  this(Handle h) {
    _parent = .HTMLMediaElement(h);
  }
}


